import SwiftUI

public struct CalculatorMainView: View {
    @StateObject private var state = CalculatorState()
    @State private var pressedKeyId: Int? = nil
    
    public init() {}
    
    public var body: some View {
        GeometryReader { geo in
            let canvasW = ExtractedFaceplateData.canvasWidth   // 644
            let canvasH = ExtractedFaceplateData.canvasHeight  // 1250
            
            // Calculate scale to fit screen preserving exact aspect ratio
            let scaleX = geo.size.width / canvasW
            let scaleY = geo.size.height / canvasH
            let scale = min(scaleX, scaleY)
            
            let renderedW = canvasW * scale
            let renderedH = canvasH * scale
            let offsetX = (geo.size.width - renderedW) / 2.0
            let offsetY = (geo.size.height - renderedH) / 2.0
            
            ZStack {
                // Background dark matte border
                Color(red: 0.08, green: 0.09, blue: 0.10)
                    .edgesIgnoringSafeArea(.all)
                
                // Centered Calculator Faceplate Container
                ZStack(alignment: .topLeading) {
                    // 1. Authentic Faceplate Skin (Extracted from CLASSWIZ_P20.dll res 103)
                    Image("casio_faceplate")
                        .resizable()
                        .interpolation(.high)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: renderedW, height: renderedH)
                    
                    // 2. LCD Display Framebuffer (Renders at native 384x126 then scaled down cleanly)
                    let dRect = ExtractedFaceplateData.displayRect
                    LCDView(state: state)
                        .frame(width: dRect.width, height: dRect.height)
                        .scaleEffect(scale, anchor: .topLeading)
                        .frame(width: dRect.width * scale, height: dRect.height * scale, alignment: .topLeading)
                        .offset(x: dRect.origin.x * scale, y: dRect.origin.y * scale)
                    
                    // 3. 50 Physical Key Hitboxes Overlay (From CLASSWIZ_P20.dll 0x10004010)
                    ForEach(ExtractedFaceplateData.keyHitboxes) { hitbox in
                        let kw = hitbox.width * scale
                        let kh = hitbox.height * scale
                        let kx = hitbox.x * scale
                        let ky = hitbox.y * scale
                        
                        ZStack {
                            // Touch highlight feedback
                            if pressedKeyId == hitbox.id {
                                RoundedRectangle(cornerRadius: hitbox.id < 8 ? kw / 2.0 : 6 * scale)
                                    .fill(Color.white.opacity(0.35))
                                    .frame(width: kw, height: kh)
                            }
                        }
                        .frame(width: kw, height: kh)
                        .contentShape(Rectangle())
                        .offset(x: kx, y: ky)
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { _ in
                                    if pressedKeyId != hitbox.id {
                                        pressedKeyId = hitbox.id
                                        state.handleKeyPress(key: hitbox.key)
                                    }
                                }
                                .onEnded { _ in
                                    pressedKeyId = nil
                                }
                        )
                    }
                }
                .frame(width: renderedW, height: renderedH)
                .offset(x: offsetX, y: offsetY)
            }
        }
        .preferredColorScheme(.dark)
    }
}

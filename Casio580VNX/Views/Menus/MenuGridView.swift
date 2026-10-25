import SwiftUI

// MARK: - 1:1 Authentic ClassWiz LCD Menu Screen (Pixel-Perfect 384x126 Framebuffer)
public struct MenuGridView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    private var highlightedMode: CalculatorMode {
        if case .menu(let mode) = state.activeOverlay {
            return mode
        }
        return state.currentMode
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            // 1. Top Inverted Mode Banner (Height: 24)
            ZStack {
                Color.black.opacity(0.88)
                
                HStack {
                    Text(state.isVietnamese ? highlightedMode.titleVi : highlightedMode.titleEn)
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                    
                    Spacer()
                    
                    Text("[\(highlightedMode.symbolText)]")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                }
                .padding(.horizontal, 8)
            }
            .frame(height: 24)
            
            // 2. Center Icon Carousel (Height: 76)
            HStack(spacing: 0) {
                // Left scroll hint
                Text("◄")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.6))
                    .frame(width: 16)
                
                Spacer(minLength: 0)
                
                HStack(spacing: 12) {
                    let currentIdx = highlightedMode.rawValue
                    ForEach(-2...2, id: \.self) { offset in
                        let targetIdx = ((currentIdx - 1 + offset + 12) % 12) + 1
                        if let mode = CalculatorMode(rawValue: targetIdx) {
                            let isSelected = (offset == 0)
                            let isNeighbor = (abs(offset) == 1)
                            
                            VStack(spacing: 2) {
                                ZStack {
                                    if isSelected {
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.black.opacity(0.92))
                                            .frame(width: 42, height: 42)
                                        
                                        Image(mode.iconAsset)
                                            .renderingMode(.template)
                                            .resizable()
                                            .interpolation(.none)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color(red: 0.86, green: 0.92, blue: 0.86))
                                            .frame(width: 28, height: 28)
                                    } else {
                                        RoundedRectangle(cornerRadius: 3)
                                            .stroke(Color.black.opacity(isNeighbor ? 0.25 : 0.1), lineWidth: 1)
                                            .frame(width: isNeighbor ? 34 : 28, height: isNeighbor ? 34 : 28)
                                        
                                        Image(mode.iconAsset)
                                            .renderingMode(.template)
                                            .resizable()
                                            .interpolation(.none)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color.black.opacity(isNeighbor ? 0.85 : 0.35))
                                            .frame(width: isNeighbor ? 24 : 18, height: isNeighbor ? 24 : 18)
                                    }
                                }
                                .frame(height: 44)
                                
                                Text(mode.symbolText)
                                    .font(.system(size: isSelected ? 11 : 9, weight: isSelected ? .bold : .medium, design: .monospaced))
                                    .foregroundColor(Color.black.opacity(isSelected ? 0.95 : (isNeighbor ? 0.75 : 0.35)))
                            }
                            .frame(width: isSelected ? 48 : (isNeighbor ? 40 : 32))
                            .contentShape(Rectangle())
                            .onTapGesture {
                                state.currentMode = mode
                                state.activeOverlay = .none
                                state.resetCurrentScreen()
                            }
                        }
                    }
                }
                
                Spacer(minLength: 0)
                
                // Right scroll hint
                Text("►")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.6))
                    .frame(width: 16)
            }
            .frame(height: 76)
            
            // Subtle horizontal dividing line
            Rectangle()
                .fill(Color.black.opacity(0.2))
                .frame(height: 1)
                .padding(.horizontal, 6)
            
            // 3. Bottom Navigation Hint (Height: 25)
            HStack {
                Text("[=]: " + (state.isVietnamese ? "Chọn" : "OK"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                
                Spacer()
                
                Text(state.isVietnamese ? "1~9, A, B, C: Nhập số" : "1~9, A, B, C: Select")
                    .font(.system(size: 9, weight: .medium, design: .monospaced))
                
                Spacer()
                
                Text("[AC]: " + (state.isVietnamese ? "Hủy" : "Cancel"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
            .padding(.horizontal, 8)
            .frame(height: 25)
        }
        .frame(width: 384, height: 126)
    }
}

import SwiftUI

// MARK: - 1:1 Genuine ClassWiz LCD Menu Screen (Embedded directly inside 192x63 LCD)
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
        VStack(spacing: 3) {
            // Top Mode Title Header
            HStack {
                Text(state.isVietnamese ? highlightedMode.titleVi : highlightedMode.titleEn)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                Spacer()
                Text("[\(highlightedMode.symbolText)]")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.8))
            }
            .padding(.horizontal, 6)
            .padding(.top, 2)
            
            Divider()
                .background(Color.black.opacity(0.3))
                .padding(.horizontal, 4)
            
            // Authentic 5-Icon Horizontal Strip
            HStack(spacing: 8) {
                let currentIdx = highlightedMode.rawValue
                ForEach(-2...2, id: \.self) { offset in
                    let targetIdx = ((currentIdx - 1 + offset + 12) % 12) + 1
                    if let mode = CalculatorMode(rawValue: targetIdx) {
                        let isSelected = (offset == 0)
                        
                        VStack(spacing: 1) {
                            ZStack {
                                if isSelected {
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(Color.black.opacity(0.9))
                                        .frame(width: 34, height: 34)
                                } else {
                                    RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.black.opacity(0.2), lineWidth: 1)
                                        .frame(width: 32, height: 32)
                                }
                                
                                Image(mode.iconAsset)
                                    .renderingMode(isSelected ? .template : .original)
                                    .resizable()
                                    .interpolation(.none)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(isSelected ? Color(red: 0.85, green: 0.90, blue: 0.85) : .black)
                                    .frame(width: 26, height: 26)
                            }
                            
                            Text(mode.symbolText)
                                .font(.system(size: 9, weight: isSelected ? .bold : .regular, design: .monospaced))
                                .foregroundColor(.black)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            state.currentMode = mode
                            state.activeOverlay = .none
                            state.resetCurrentScreen()
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity)
            
            // Bottom Helper Line
            HStack {
                Text("◄ [=]: " + (state.isVietnamese ? "Chọn" : "OK") + " ►")
                    .font(.system(size: 9, weight: .medium, design: .monospaced))
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Hủy" : "Cancel"))
                    .font(.system(size: 9, weight: .medium, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.75))
            .padding(.horizontal, 6)
            .padding(.bottom, 2)
        }
    }
}

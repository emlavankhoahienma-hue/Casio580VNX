import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Menu Screen (2x4 Dot-Matrix Icon Grid)
public struct MenuGridView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    // Highlighted mode index (1 to 12)
    private var highlightedMode: CalculatorMode {
        if case .menu(let mode) = state.activeOverlay {
            return mode
        }
        return state.currentMode
    }
    
    // Rows to display: 0 (modes 1..8) or 1 (modes 5..12)
    private var scrollRow: Int {
        let idx = highlightedMode.rawValue
        if idx > 8 {
            return 1 // Show row 1 (5..8) and row 2 (9..12)
        }
        return 0 // Show row 0 (1..4) and row 1 (5..8)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            // 1. Top 2 Rows of 4 Icons + Scroll indicator (Total Height: 96 pt = 2 x 48 pt)
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    ForEach(0..<2, id: \.self) { displayRow in
                        let actualRow = scrollRow + displayRow
                        HStack(spacing: 0) {
                            ForEach(0..<4, id: \.self) { col in
                                let modeIdx = actualRow * 4 + col + 1
                                if let mode = CalculatorMode(rawValue: modeIdx) {
                                    let isSelected = (mode == highlightedMode)
                                    
                                    ZStack {
                                        // Selected Inverted Background
                                        if isSelected {
                                            Rectangle()
                                                .fill(Color(red: 25/255, green: 30/255, blue: 27/255))
                                        }
                                        
                                        // Genuine Sliced Icon
                                        Image("menu_icon_\(modeIdx)")
                                            .renderingMode(.template)
                                            .resizable()
                                            .interpolation(.none)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(isSelected ? Color(red: 214/255, green: 227/255, blue: 214/255) : Color(red: 25/255, green: 30/255, blue: 27/255))
                                            .frame(width: 88, height: 44)
                                    }
                                    .frame(width: 92, height: 48)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        state.currentMode = mode
                                        state.activeOverlay = .none
                                        state.resetCurrentScreen()
                                    }
                                }
                            }
                        }
                        .frame(height: 48)
                    }
                }
                .frame(width: 368, height: 96)
                
                // Right Scroll Indicator
                VStack {
                    if scrollRow == 0 {
                        Spacer()
                        Text("▼")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.black.opacity(0.85))
                            .padding(.bottom, 6)
                    } else {
                        Text("▲")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.black.opacity(0.85))
                            .padding(.top, 6)
                        Spacer()
                    }
                }
                .frame(width: 16, height: 96)
            }
            .frame(width: 384, height: 96)
            
            // Horizontal divider before text line
            Rectangle()
                .fill(Color.black.opacity(0.22))
                .frame(width: 384, height: 1)
            
            // 2. Bottom Mode Name Line (Height: 29 pt)
            HStack {
                Text(state.isVietnamese ? highlightedMode.titleVi : highlightedMode.titleEn)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(red: 25/255, green: 30/255, blue: 27/255))
                
                Spacer()
            }
            .padding(.horizontal, 10)
            .frame(width: 384, height: 29)
        }
        .frame(width: 384, height: 126)
    }
}

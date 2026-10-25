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
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                // 1. Top 2 Rows of 4 Icons (Total Height: 96 pt = 2 x 48 pt)
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
                                                .fill(Color(red: 30/255, green: 35/255, blue: 32/255))
                                        }
                                        
                                        // Genuine Sliced Icon (contains both symbol and bottom-right subscript tag)
                                        if isSelected {
                                            Image("menu_icon_\(modeIdx)_selected")
                                                .resizable()
                                                .interpolation(.none)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 92, height: 46)
                                        } else {
                                            Image("menu_icon_\(modeIdx)")
                                                .resizable()
                                                .interpolation(.none)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 92, height: 46)
                                        }
                                    }
                                    .frame(width: 96, height: 48)
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
                        
                        // Horizontal divider between rows
                        if displayRow == 0 {
                            Rectangle()
                                .fill(Color.black.opacity(0.18))
                                .frame(height: 1)
                        }
                    }
                }
                .frame(width: 384, height: 96)
                
                // Horizontal divider before text line
                Rectangle()
                    .fill(Color.black.opacity(0.22))
                    .frame(height: 1)
                
                // 2. Bottom Mode Name Line (Height: 29 pt)
                HStack {
                    Text(state.isVietnamese ? highlightedMode.titleVi : highlightedMode.titleEn)
                        .font(.system(size: 16, weight: .bold, design: .serif))
                        .foregroundColor(Color(red: 25/255, green: 30/255, blue: 27/255))
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .frame(width: 384, height: 29)
            }
            
            // 3. Scroll Arrow Indicator (Top-Right)
            Text(scrollRow == 0 ? "▼" : "▲")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(Color.black.opacity(0.85))
                .padding(.trailing, 6)
                .padding(.top, 4)
        }
        .frame(width: 384, height: 126)
    }
}

import SwiftUI

public struct LCDView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        ZStack {
            // LCD Background with authentic ClassWiz greenish-grey tone
            RoundedRectangle(cornerRadius: 6)
                .fill(lcdBackgroundColor)
                .overlay(
                    // Subtle pixel dot grid pattern simulation
                    Rectangle()
                        .strokeBorder(Color.black.opacity(0.12), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
            
            VStack(spacing: 0) {
                // Top Status Bar (ClassWiz Icons)
                statusBar
                    .frame(height: 16)
                    .padding(.horizontal, 8)
                    .padding(.top, 4)
                
                Divider()
                    .background(Color.black.opacity(0.15))
                    .padding(.horizontal, 4)
                
                // Main LCD Screen Area (192 x 63 logic pixels)
                ZStack {
                    if let err = state.activeError {
                        errorScreen(err)
                    } else if case .solveScreen(let xVal, let lrVal) = state.activeOverlay {
                        solveScreen(xVal: xVal, lrVal: lrVal)
                    } else if case .calcPrompt(let varName, let curVal) = state.activeOverlay {
                        calcPromptScreen(varName: varName, curVal: curVal)
                    } else {
                        normalCalculationScreen
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
            }
        }
        .frame(height: 140)
    }
    
    // Background color dynamically influenced by Contrast setting
    private var lcdBackgroundColor: Color {
        // Base greenish-grey: #CFD9C8
        let baseR = 0.81 + (state.contrast - 0.5) * 0.1
        let baseG = 0.85 + (state.contrast - 0.5) * 0.1
        let baseB = 0.78 + (state.contrast - 0.5) * 0.1
        return Color(red: min(1.0, max(0.5, baseR)),
                     green: min(1.0, max(0.5, baseG)),
                     blue: min(1.0, max(0.5, baseB)))
    }
    
    // Status Bar with indicators
    private var statusBar: some View {
        HStack(spacing: 5) {
            statusBadge(text: "S", isActive: state.isShiftActive)
            statusBadge(text: "A", isActive: state.isAlphaActive)
            statusBadge(text: "M", isActive: state.hasMemoryValue)
            statusBadge(text: "STO", isActive: state.isStoreActive)
            statusBadge(text: "√□/", isActive: true)
            
            Spacer()
            
            // Angle unit
            statusBadge(text: state.angleUnit.rawValue, isActive: true)
            
            // Mode flags
            if state.currentMode == .complex {
                statusBadge(text: "𝒊", isActive: true)
            }
            if state.currentMode == .matrix {
                statusBadge(text: "MAT", isActive: true)
            }
            if state.currentMode == .vector {
                statusBadge(text: "VCT", isActive: true)
            }
            if state.currentMode == .baseN {
                statusBadge(text: state.baseNRadix.rawValue, isActive: true)
            }
            
            // Replay navigation indicator
            if !state.history.isEmpty {
                Text("▲▼")
                    .font(.system(size: 8, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.8))
            }
        }
    }
    
    private func statusBadge(text: String, isActive: Bool) -> some View {
        Text(text)
            .font(.system(size: 9, weight: .bold, design: .monospaced))
            .foregroundColor(isActive ? Color.black : Color.black.opacity(0.12))
            .padding(.horizontal, 1)
    }
    
    // Normal Math Input & Output Screen
    private var normalCalculationScreen: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Input Expression line (scrollable horizontally if needed)
            ScrollView(.horizontal, showsIndicators: false) {
                MathNodeSequenceView(
                    nodes: state.document.nodes,
                    cursorIndex: state.document.cursorIndex,
                    emptyPlaceholder: ""
                )
                .frame(minHeight: 34, alignment: .leading)
            }
            
            Spacer()
            
            // Result Display line (aligned right)
            HStack {
                Spacer()
                if let res = state.currentResult {
                    resultText(for: res)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.black.opacity(0.9))
                }
            }
        }
    }
    
    @ViewBuilder
    private func resultText(for res: EvaluationResult) -> some View {
        switch state.resultStyle {
        case .exact:
            if let rem = res.remainderDisplay {
                Text(rem)
            } else {
                Text(res.exactDisplay)
            }
        case .decimal:
            Text(res.decimalDisplay)
        case .dms:
            Text(res.dmsDisplay)
        case .primeFact:
            Text(res.primeFactDisplay ?? res.decimalDisplay)
        }
    }
    
    // Authentic Error Screen
    private func errorScreen(_ err: CasioError) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(state.isVietnamese ? err.titleVi : err.titleEn)
                .font(.system(size: 15, weight: .bold, design: .monospaced))
                .foregroundColor(Color.black)
            
            Spacer()
            
            HStack {
                Text("[AC]")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Text(state.isVietnamese ? " :Hủy" : " :Cancel")
                    .font(.system(size: 12, weight: .regular, design: .monospaced))
                
                Spacer()
                
                Text("[◄][►]")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Text(state.isVietnamese ? ":Đến" : ":Goto")
                    .font(.system(size: 12, weight: .regular, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
        }
    }
    
    // Authentic SOLVE Screen
    private func solveScreen(xVal: String, lrVal: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("x =")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                Spacer()
                Text(xVal)
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
            }
            HStack {
                Text("L - R =")
                    .font(.system(size: 13, weight: .regular, design: .monospaced))
                Spacer()
                Text(lrVal)
                    .font(.system(size: 13, weight: .regular, design: .monospaced))
            }
            Spacer()
            HStack {
                Spacer()
                Text("[AC] :Xong")
                    .font(.system(size: 11, weight: .regular, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
            }
        }
    }
    
    // CALC Prompt Screen
    private func calcPromptScreen(varName: String, curVal: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("\(varName)?")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                Spacer()
                Text(curVal)
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
            }
            Spacer()
            HStack {
                Spacer()
                Text("[=] :Thực hiện")
                    .font(.system(size: 11, weight: .regular, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
            }
        }
    }
}

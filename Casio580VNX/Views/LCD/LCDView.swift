import SwiftUI

public struct LCDView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        ZStack {
            // Authentic dot matrix LCD background texture (Emulator res 135)
            Image("lcd_bg")
                .resizable(resizingMode: .tile)
                .background(lcdColorTint)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
            
            VStack(spacing: 2) {
                // Top Status Bar (ClassWiz Indicators: S, A, M, STO, √□/, D/R/G, 𝒊, MAT, VCT)
                statusBar
                    .frame(height: 14)
                    .padding(.horizontal, 6)
                    .padding(.top, 2)
                
                // Active LCD Framebuffer Screen
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
                .padding(.horizontal, 6)
                .padding(.bottom, 3)
            }
        }
    }
    
    // Tint color modified by Contrast setting
    private var lcdColorTint: Color {
        let base = 0.82 + (state.contrast - 0.5) * 0.12
        return Color(red: base * 0.96, green: base, blue: base * 0.92)
    }
    
    // Authentic Status Bar Indicators
    private var statusBar: some View {
        HStack(spacing: 4) {
            statusBadge(text: "S", isActive: state.isShiftActive)
            statusBadge(text: "A", isActive: state.isAlphaActive)
            statusBadge(text: "M", isActive: state.hasMemoryValue)
            statusBadge(text: "STO", isActive: state.isStoreActive)
            statusBadge(text: "√□/", isActive: true)
            
            Spacer()
            
            // Angle unit
            statusBadge(text: state.angleUnit.rawValue, isActive: true)
            
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
    
    private var normalCalculationScreen: some View {
        VStack(alignment: .leading, spacing: 2) {
            // Natural Textbook 2D Formula line
            ScrollView(.horizontal, showsIndicators: false) {
                MathNodeSequenceView(
                    nodes: state.document.nodes,
                    cursorIndex: state.document.cursorIndex,
                    emptyPlaceholder: ""
                )
                .frame(minHeight: 30, alignment: .leading)
            }
            
            Spacer()
            
            // Result Display line (aligned bottom-right)
            HStack {
                Spacer()
                if let res = state.currentResult {
                    resultText(for: res)
                        .font(.system(size: 19, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.black.opacity(0.92))
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
    
    // Casio Error Screen
    private func errorScreen(_ err: CasioError) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(state.isVietnamese ? err.titleVi : err.titleEn)
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(Color.black)
            
            Spacer()
            
            HStack {
                Text("[AC]")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text(state.isVietnamese ? " :Hủy" : " :Cancel")
                    .font(.system(size: 11, design: .monospaced))
                
                Spacer()
                
                Text("[◄][►]")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text(state.isVietnamese ? ":Đến" : ":Goto")
                    .font(.system(size: 11, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
        }
    }
    
    // SOLVE Screen
    private func solveScreen(xVal: String, lrVal: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("x =")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                Spacer()
                Text(xVal)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
            }
            HStack {
                Text("L - R =")
                    .font(.system(size: 12, design: .monospaced))
                Spacer()
                Text(lrVal)
                    .font(.system(size: 12, design: .monospaced))
            }
            Spacer()
            HStack {
                Spacer()
                Text("[AC] :Xong")
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
            }
        }
    }
    
    // CALC Screen
    private func calcPromptScreen(varName: String, curVal: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("\(varName)?")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                Spacer()
                Text(curVal)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
            }
            Spacer()
            HStack {
                Spacer()
                Text("[=] :Thực hiện")
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
            }
        }
    }
}

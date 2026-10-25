import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Inequality Mode Screen (384x126)
public struct InequalityScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            if let res = state.ineqResultStr {
                resultView(text: res)
            } else if state.ineqDegree == 0 {
                degreeSelectView
            } else if state.ineqForm == 0 {
                formSelectView
            } else {
                coeffsGridView
            }
        }
        .frame(width: 384, height: 126)
        .foregroundColor(.black)
    }
    
    private var miniStatusBar: some View {
        HStack(spacing: 6) {
            Text("√□/")
                .font(.system(size: 9, weight: .bold, design: .monospaced))
            Spacer()
            Text(state.angleUnit.rawValue)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
        }
        .frame(height: 14)
        .padding(.horizontal, 6)
        .padding(.top, 2)
    }
    
    // 1. Degree Select
    private var degreeSelectView: some View {
        VStack(spacing: 8) {
            Text(state.isVietnamese ? "Bất phương trình" : "Inequality")
                .font(.system(size: 13, weight: .bold, design: .monospaced))
            
            Text(state.isVietnamese ? "Bậc?" : "Degree?")
                .font(.system(size: 12, weight: .medium, design: .monospaced))
            
            Text(state.isVietnamese ? "Chọn 2 ~ 4" : "Select 2 ~ 4")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .padding(.vertical, 2)
                .padding(.horizontal, 14)
                .background(Color.black.opacity(0.08))
                .cornerRadius(3)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
    }
    
    // 2. Form Select (1..4)
    private var formSelectView: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(state.isVietnamese ? "Chọn dạng BPT (Bậc \(state.ineqDegree)):" : "Select Form (Deg \(state.ineqDegree)):")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .padding(.bottom, 2)
            
            let s = polyPrefix(deg: state.ineqDegree)
            Text("1: \(s) > 0")
                .font(.system(size: 11, weight: .bold, design: .monospaced))
            Text("2: \(s) < 0")
                .font(.system(size: 11, weight: .bold, design: .monospaced))
            Text("3: \(s) ≥ 0")
                .font(.system(size: 11, weight: .bold, design: .monospaced))
            Text("4: \(s) ≤ 0")
                .font(.system(size: 11, weight: .bold, design: .monospaced))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 10)
    }
    
    // 3. Coeffs Grid
    private var coeffsGridView: some View {
        VStack(spacing: 3) {
            HStack {
                Text(formTitle(deg: state.ineqDegree, form: state.ineqForm))
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 6)
            
            HStack(spacing: 3) {
                ForEach(0..<state.ineqCoeffs.count, id: \.self) { c in
                    let isSelected = (state.ineqCursorIdx == c)
                    let val = state.ineqCoeffs[c]
                    let displayTxt = (isSelected && !state.ineqInputBuf.isEmpty) ? state.ineqInputBuf : formatVal(val)
                    
                    Text(displayTxt)
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 4)
                        .frame(height: 22)
                        .background(isSelected ? Color.black : Color.black.opacity(0.06))
                        .foregroundColor(isSelected ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
                        .cornerRadius(2)
                }
            }
            .padding(.horizontal, 6)
            
            Spacer()
            
            let curVal = state.ineqCursorIdx < state.ineqCoeffs.count ? state.ineqCoeffs[state.ineqCursorIdx] : 0.0
            let pName = ["a", "b", "c", "d", "e"][min(4, state.ineqCursorIdx)]
            HStack {
                Text("\(pName) =")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Text(state.ineqInputBuf.isEmpty ? formatVal(curVal) : state.ineqInputBuf)
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 4)
        }
    }
    
    // 4. Result View
    private func resultView(text: String) -> some View {
        VStack(spacing: 4) {
            HStack {
                Text(state.isVietnamese ? "Nghiệm của BPT:" : "Solution:")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            
            Spacer()
            
            Text(text)
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
    
    private func formatVal(_ v: Double) -> String {
        if abs(v - round(v)) < 1e-9 { return "\(Int64(round(v)))" }
        return String(format: "%g", v)
    }
    
    private func polyPrefix(deg: Int) -> String {
        switch deg {
        case 2: return "ax² + bx + c"
        case 3: return "ax³ + bx² + cx + d"
        case 4: return "ax⁴ + bx³ + cx² + dx + e"
        default: return "P(x)"
        }
    }
    
    private func formTitle(deg: Int, form: Int) -> String {
        let op = [">", "<", "≥", "≤"][max(0, min(3, form - 1))]
        return "\(polyPrefix(deg: deg)) \(op) 0"
    }
}

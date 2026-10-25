import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Ratio Mode Screen (384x126)
public struct RatioScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            if let xVal = state.ratioResultX {
                resultView(x: xVal)
            } else if state.ratioForm == 0 {
                formSelectView
            } else {
                inputGridView
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
    
    // 1. Select Form: 1: A:B = X:D, 2: A:B = C:X
    private var formSelectView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(state.isVietnamese ? "Tỷ lệ thức (Ratio):" : "Select Ratio Form:")
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .padding(.bottom, 2)
            
            Text("1:  A : B = X : D")
                .font(.system(size: 13, weight: .bold, design: .monospaced))
            Text("2:  A : B = C : X")
                .font(.system(size: 13, weight: .bold, design: .monospaced))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
        .padding(.top, 8)
    }
    
    // 2. Input Grid
    private var inputGridView: some View {
        VStack(spacing: 4) {
            HStack {
                Text(state.ratioForm == 1 ? "A : B = X : D" : "A : B = C : X")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            
            HStack(spacing: 4) {
                // Cell 0: A
                cellBox(label: "A", idx: 0)
                Text(":")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                // Cell 1: B
                cellBox(label: "B", idx: 1)
                Text("=")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                // Cell 2: X or C
                if state.ratioForm == 1 {
                    Text("X")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .frame(width: 32)
                } else {
                    cellBox(label: "C", idx: 2)
                }
                Text(":")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                // Cell 3: D or X
                if state.ratioForm == 1 {
                    cellBox(label: "D", idx: 2)
                } else {
                    Text("X")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .frame(width: 32)
                }
            }
            .padding(.horizontal, 6)
            
            Spacer()
            
            // Bottom edit line
            let curVal = state.ratioCursorIdx < state.ratioValues.count ? state.ratioValues[state.ratioCursorIdx] : 0.0
            let pName = ratioLabel(idx: state.ratioCursorIdx)
            HStack {
                Text("\(pName) =")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Text(state.ratioInputBuf.isEmpty ? formatVal(curVal) : state.ratioInputBuf)
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 4)
        }
    }
    
    // 3. Result View
    private func resultView(x: Double) -> some View {
        VStack(spacing: 2) {
            HStack {
                Text(state.ratioForm == 1 ? "A : B = X : D" : "A : B = C : X")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            
            HStack {
                Text("X =")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 12)
            
            Spacer()
            
            HStack {
                Spacer()
                Text(formatResultValue(x))
                    .font(.system(size: 21, weight: .bold, design: .monospaced))
            }
            .padding(.horizontal, 14)
            .padding(.bottom, 6)
        }
    }
    
    private func cellBox(label: String, idx: Int) -> some View {
        let isSelected = (state.ratioCursorIdx == idx)
        let val = idx < state.ratioValues.count ? state.ratioValues[idx] : 0.0
        let displayTxt = (isSelected && !state.ratioInputBuf.isEmpty) ? state.ratioInputBuf : formatVal(val)
        
        return Text(displayTxt)
            .font(.system(size: 12, weight: .bold, design: .monospaced))
            .frame(maxWidth: .infinity)
            .frame(height: 24)
            .background(isSelected ? Color.black : Color.black.opacity(0.06))
            .foregroundColor(isSelected ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
            .cornerRadius(2)
    }
    
    private func ratioLabel(idx: Int) -> String {
        if state.ratioForm == 1 {
            return ["A", "B", "D"][min(2, idx)]
        } else {
            return ["A", "B", "C"][min(2, idx)]
        }
    }
    
    private func formatVal(_ v: Double) -> String {
        if abs(v - round(v)) < 1e-9 { return "\(Int64(round(v)))" }
        return String(format: "%g", v)
    }
    
    private func formatResultValue(_ v: Double) -> String {
        if state.resultStyle == .exact, let frac = MathEvaluator.toFractionString(v) {
            return frac
        }
        if abs(v - round(v)) < 1e-9 { return "\(Int64(round(v)))" }
        return String(format: "%.10g", v)
    }
}

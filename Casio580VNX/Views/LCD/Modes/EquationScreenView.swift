import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Equation Mode Screen (384x126)
public struct EquationScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            // Top Status Bar (Only in calculation/solving screens)
            if state.eqSimultRoots != nil || state.eqPolyResult != nil || state.eqSubChoice > 0 {
                miniStatusBar
            }
            
            if let roots = state.eqSimultRoots {
                simultResultView(roots: roots)
            } else if let poly = state.eqPolyResult {
                polyResultView(poly: poly)
            } else if state.eqType == 0 {
                typeSelectView
            } else if state.eqType == 1 {
                if state.eqSubChoice == 0 {
                    simultUnknownsPromptView
                } else {
                    simultCoeffsGridView
                }
            } else if state.eqType == 2 {
                if state.eqSubChoice == 0 {
                    polyDegreePromptView
                } else {
                    polyCoeffsGridView
                }
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
            Text("▲▼")
                .font(.system(size: 9, weight: .bold, design: .monospaced))
        }
        .frame(height: 14)
        .padding(.horizontal, 6)
        .padding(.top, 2)
    }
    
    // 1. Select Equation Type: 1: Simultaneous, 2: Polynomial
    private var typeSelectView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(state.isVietnamese ? "Phương trình / Hệ PT" : "Equation / Func")
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .padding(.bottom, 2)
            
            Text(state.isVietnamese ? "1: Hệ phương trình" : "1: Simul Equation")
                .font(.system(size: 12, weight: .medium, design: .monospaced))
            
            Text(state.isVietnamese ? "2: Phương trình đa thức" : "2: Polynomial")
                .font(.system(size: 12, weight: .medium, design: .monospaced))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
        .padding(.top, 10)
    }
    
    // 2. Simultaneous Unknowns Prompt (2 ~ 4)
    private var simultUnknownsPromptView: some View {
        VStack(spacing: 8) {
            Text(state.isVietnamese ? "Hệ phương trình" : "Simul Equation")
                .font(.system(size: 13, weight: .bold, design: .monospaced))
            
            Text(state.isVietnamese ? "Số lượng ẩn?" : "Number of Unknowns?")
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
        .padding(.top, 12)
    }
    
    // 3. Polynomial Degree Prompt (2 ~ 4)
    private var polyDegreePromptView: some View {
        VStack(spacing: 8) {
            Text(state.isVietnamese ? "Phương trình đa thức" : "Polynomial")
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
        .padding(.top, 12)
    }
    
    // 4. Simultaneous Matrix Coeff Grid
    private var simultCoeffsGridView: some View {
        VStack(spacing: 2) {
            // Header: an x + bn y = cn
            let n = state.eqSubChoice
            HStack {
                Text(n == 2 ? "{ ax + by = c" : (n == 3 ? "{ ax + by + cz = d" : "{ a x + ... = e"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                Spacer()
                Text("[\(state.eqCursorRow + 1),\(state.eqCursorCol + 1)]")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .padding(.horizontal, 6)
            
            // Grid Rows (up to 2 visible rows with scroll)
            VStack(spacing: 2) {
                ForEach(0..<min(state.eqSubChoice, 3), id: \.self) { r in
                    HStack(spacing: 2) {
                        Text("\(r + 1)")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .frame(width: 12)
                        
                        ForEach(0..<(n + 1), id: \.self) { c in
                            let isSelected = (state.eqCursorRow == r && state.eqCursorCol == c)
                            let val = (state.eqCoeffs.count > r && state.eqCoeffs[r].count > c) ? state.eqCoeffs[r][c] : 0.0
                            let displayTxt = (isSelected && !state.eqInputBuf.isEmpty) ? state.eqInputBuf : formatVal(val)
                            
                            Text(displayTxt)
                                .font(.system(size: 11, weight: .bold, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.horizontal, 3)
                                .frame(height: 18)
                                .background(isSelected ? Color.black : Color.clear)
                                .foregroundColor(isSelected ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
                                .cornerRadius(2)
                        }
                    }
                }
            }
            .padding(.horizontal, 4)
            
            Spacer()
            
            // Bottom Prompt row
            let curVal = (state.eqCoeffs.count > state.eqCursorRow && state.eqCoeffs[state.eqCursorRow].count > state.eqCursorCol) ? state.eqCoeffs[state.eqCursorRow][state.eqCursorCol] : 0.0
            let promptName = coeffName(row: state.eqCursorRow, col: state.eqCursorCol, total: n)
            HStack {
                Text("\(promptName) =")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Text(state.eqInputBuf.isEmpty ? formatVal(curVal) : state.eqInputBuf)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 3)
        }
    }
    
    // 5. Polynomial Coeffs Grid
    private var polyCoeffsGridView: some View {
        VStack(spacing: 3) {
            let deg = state.eqSubChoice
            HStack {
                Text(polyHeader(deg: deg))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 6)
            
            // Cells
            HStack(spacing: 3) {
                ForEach(0..<(deg + 1), id: \.self) { c in
                    let isSelected = (state.eqCursorCol == c)
                    let val = (state.eqCoeffs.count > 0 && state.eqCoeffs[0].count > c) ? state.eqCoeffs[0][c] : 0.0
                    let displayTxt = (isSelected && !state.eqInputBuf.isEmpty) ? state.eqInputBuf : formatVal(val)
                    
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
            
            // Bottom prompt
            let curVal = (state.eqCoeffs.count > 0 && state.eqCoeffs[0].count > state.eqCursorCol) ? state.eqCoeffs[0][state.eqCursorCol] : 0.0
            let pName = polyCoeffName(col: state.eqCursorCol)
            HStack {
                Text("\(pName) =")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Text(state.eqInputBuf.isEmpty ? formatVal(curVal) : state.eqInputBuf)
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 4)
        }
    }
    
    // 6. Simultaneous Results View
    private func simultResultView(roots: [String: Double]) -> some View {
        VStack(spacing: 4) {
            if let inf = roots["info"], inf == 999.0 {
                Text(state.isVietnamese ? "Vô số nghiệm" : "Infinite Solutions")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .padding(.top, 20)
            } else {
                let vars = ["x", "y", "z", "t"].prefix(state.eqSubChoice)
                let activeIdx = state.eqRootViewIdx % vars.count
                let activeVar = vars[activeIdx]
                let val = roots[activeVar] ?? 0.0
                
                HStack {
                    Text("\(activeVar) =")
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text(formatResultValue(val))
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 6)
            }
        }
    }
    
    // 7. Polynomial Results View
    private func polyResultView(poly: EquationSolver.PolynomialResult) -> some View {
        VStack(spacing: 2) {
            let totalItems = poly.roots.count + (poly.minMax != nil ? 2 : 0)
            let curIdx = state.eqRootViewIdx % max(1, totalItems)
            
            if curIdx < poly.roots.count {
                let r = poly.roots[curIdx]
                HStack {
                    Text("x\(curIdx + 1) =")
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    if abs(r.im) < 1e-9 {
                        Text(formatResultValue(r.re))
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                    } else {
                        let sign = r.im >= 0 ? "+" : "-"
                        Text("\(formatResultValue(r.re)) \(sign) \(formatResultValue(abs(r.im)))i")
                            .font(.system(size: 17, weight: .bold, design: .monospaced))
                    }
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 6)
            } else if let mm = poly.minMax {
                let isY = (curIdx == poly.roots.count + 1)
                HStack {
                    let title = mm.isMinimum ? (state.isVietnamese ? "Cực tiểu của y=ax²+bx+c" : "Min of y=ax²+bx+c") : (state.isVietnamese ? "Cực đại của y=ax²+bx+c" : "Max of y=ax²+bx+c")
                    Text(title)
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                    Spacer()
                }
                .padding(.horizontal, 8)
                
                HStack {
                    Text(isY ? "y =" : "x =")
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text(formatResultValue(isY ? mm.y : mm.x))
                        .font(.system(size: 19, weight: .bold, design: .monospaced))
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 6)
            }
        }
    }
    
    // Helpers
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
    
    private func coeffName(row: Int, col: Int, total: Int) -> String {
        let names = ["a", "b", "c", "d", "e"]
        let colLetter = (col < total) ? names[col] : names[total]
        return "\(colLetter)\(row + 1)"
    }
    
    private func polyCoeffName(col: Int) -> String {
        let letters = ["a", "b", "c", "d", "e"]
        return col < letters.count ? letters[col] : "c"
    }
    
    private func polyHeader(deg: Int) -> String {
        switch deg {
        case 2: return "ax² + bx + c = 0"
        case 3: return "ax³ + bx² + cx + d = 0"
        case 4: return "ax⁴ + bx³ + cx² + dx + e = 0"
        default: return "P(x) = 0"
        }
    }
}

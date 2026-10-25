import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Matrix Mode Screen (384x126)
public struct MatrixScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            if state.matrixStep == 0 {
                defineSelectView
            } else if state.matrixStep == 1 || state.matrixStep == 2 {
                dimensionPromptView
            } else if state.matrixStep == 3 {
                matrixEditorGridView
            } else {
                matrixCalculationView
            }
        }
        .frame(width: 384, height: 126)
        .foregroundColor(.black)
    }
    
    private var miniStatusBar: some View {
        HStack(spacing: 6) {
            Text("MAT")
                .font(.system(size: 9, weight: .bold, design: .monospaced))
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
    
    // 1. Define Select View: 1: MatA, 2: MatB, 3: MatC, 4: MatD
    private var defineSelectView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(state.isVietnamese ? "Định nghĩa Ma trận:" : "Define Matrix:")
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .padding(.bottom, 2)
            
            HStack(spacing: 24) {
                Text("1: MatA")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Text("2: MatB")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
            }
            HStack(spacing: 24) {
                Text("3: MatC")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Text("4: MatD")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
        .padding(.top, 6)
    }
    
    // 2. Dimension Prompt View (Rows 1~4, Cols 1~4)
    private var dimensionPromptView: some View {
        VStack(spacing: 6) {
            Text("\(state.activeMatrixName)")
                .font(.system(size: 13, weight: .bold, design: .monospaced))
            
            Text(state.matrixStep == 1 ? (state.isVietnamese ? "Số dòng? (Rows) 1 ~ 4" : "Number of Rows? 1 ~ 4") : (state.isVietnamese ? "Số cột? (Cols) 1 ~ 4" : "Number of Columns? 1 ~ 4"))
                .font(.system(size: 12, weight: .medium, design: .monospaced))
            
            Text(state.matrixStep == 1 ? "\(state.matrixNewRows)" : "\(state.matrixNewCols)")
                .font(.system(size: 15, weight: .bold, design: .monospaced))
                .padding(.vertical, 2)
                .padding(.horizontal, 16)
                .background(Color.black.opacity(0.08))
                .cornerRadius(3)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
    }
    
    // 3. Matrix Editor Grid
    private var matrixEditorGridView: some View {
        let mat = state.matrices[state.activeMatrixName] ?? CasioMatrix(rows: 2, cols: 2)
        return VStack(spacing: 2) {
            HStack {
                Text("\(state.activeMatrixName) \(mat.rows)x\(mat.cols)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Spacer()
                Text("[\(state.matrixCursorRow + 1),\(state.matrixCursorCol + 1)]")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .padding(.horizontal, 6)
            
            // Grid with brackets
            HStack(spacing: 2) {
                Text("[")
                    .font(.system(size: 26, weight: .light, design: .monospaced))
                
                VStack(spacing: 2) {
                    ForEach(0..<min(mat.rows, 3), id: \.self) { r in
                        HStack(spacing: 3) {
                            ForEach(0..<min(mat.cols, 4), id: \.self) { c in
                                let isSelected = (state.matrixCursorRow == r && state.matrixCursorCol == c)
                                let val = mat[r, c]
                                let displayTxt = (isSelected && !state.matrixInputBuf.isEmpty) ? state.matrixInputBuf : formatVal(val)
                                
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
                
                Text("]")
                    .font(.system(size: 26, weight: .light, design: .monospaced))
            }
            .padding(.horizontal, 4)
            
            Spacer()
            
            // Bottom prompt
            let curVal = mat[min(mat.rows - 1, state.matrixCursorRow), min(mat.cols - 1, state.matrixCursorCol)]
            HStack {
                Text("\(state.activeMatrixName)[\(state.matrixCursorRow + 1),\(state.matrixCursorCol + 1)] =")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text(state.matrixInputBuf.isEmpty ? formatVal(curVal) : state.matrixInputBuf)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
        }
    }
    
    // 4. Matrix Calculation View
    private var matrixCalculationView: some View {
        VStack(alignment: .leading, spacing: 2) {
            ScrollView(.horizontal, showsIndicators: false) {
                MathNodeSequenceView(
                    nodes: state.document.nodes,
                    cursorIndex: state.document.cursorIndex,
                    emptyPlaceholder: ""
                )
                .frame(minHeight: 40, alignment: .leading)
            }
            .padding(.horizontal, 8)
            
            Spacer()
            
            HStack {
                Spacer()
                if let res = state.currentResult {
                    Text(res.exactDisplay)
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 4)
        }
    }
    
    private func formatVal(_ v: Double) -> String {
        if abs(v - round(v)) < 1e-9 { return "\(Int64(round(v)))" }
        return String(format: "%g", v)
    }
}

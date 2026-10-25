import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Vector Mode Screen (384x126)
public struct VectorScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            if state.vectorStep == 0 {
                defineSelectView
            } else if state.vectorStep == 1 {
                dimensionPromptView
            } else if state.vectorStep == 2 {
                vectorEditorGridView
            } else {
                vectorCalculationView
            }
        }
        .frame(width: 384, height: 126)
        .foregroundColor(.black)
    }
    
    private var miniStatusBar: some View {
        HStack(spacing: 6) {
            Text("VCT")
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
    
    // 1. Define Select View: 1: VctA, 2: VctB, 3: VctC, 4: VctD
    private var defineSelectView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(state.isVietnamese ? "Định nghĩa Véctơ:" : "Define Vector:")
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .padding(.bottom, 2)
            
            HStack(spacing: 24) {
                Text("1: VctA")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Text("2: VctB")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
            }
            HStack(spacing: 24) {
                Text("3: VctC")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Text("4: VctD")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
        .padding(.top, 6)
    }
    
    // 2. Dimension Prompt View (2 ~ 3)
    private var dimensionPromptView: some View {
        VStack(spacing: 6) {
            Text("\(state.activeVectorName)")
                .font(.system(size: 13, weight: .bold, design: .monospaced))
            
            Text(state.isVietnamese ? "Kích thước? 2 ~ 3" : "Dimension? 2 ~ 3")
                .font(.system(size: 12, weight: .medium, design: .monospaced))
            
            Text("\(state.vectorNewDim)")
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
    
    // 3. Vector Editor Grid
    private var vectorEditorGridView: some View {
        let vct = state.vectors[state.activeVectorName] ?? CasioVector(dim: 3)
        return VStack(spacing: 4) {
            HStack {
                Text("\(state.activeVectorName) 1x\(vct.dim)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Spacer()
                Text("[\(state.vectorCursorIdx + 1)]")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .padding(.horizontal, 6)
            
            HStack(spacing: 3) {
                Text("[")
                    .font(.system(size: 26, weight: .light, design: .monospaced))
                
                ForEach(0..<vct.dim, id: \.self) { i in
                    let isSelected = (state.vectorCursorIdx == i)
                    let val = vct[i]
                    let displayTxt = (isSelected && !state.vectorInputBuf.isEmpty) ? state.vectorInputBuf : formatVal(val)
                    
                    Text(displayTxt)
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 4)
                        .frame(height: 22)
                        .background(isSelected ? Color.black : Color.clear)
                        .foregroundColor(isSelected ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
                        .cornerRadius(2)
                }
                
                Text("]")
                    .font(.system(size: 26, weight: .light, design: .monospaced))
            }
            .padding(.horizontal, 6)
            
            Spacer()
            
            // Bottom prompt
            let curVal = vct[min(vct.dim - 1, state.vectorCursorIdx)]
            HStack {
                Text("\(state.activeVectorName)[\(state.vectorCursorIdx + 1)] =")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text(state.vectorInputBuf.isEmpty ? formatVal(curVal) : state.vectorInputBuf)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
        }
    }
    
    // 4. Vector Calculation View
    private var vectorCalculationView: some View {
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

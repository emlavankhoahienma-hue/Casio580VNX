import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Statistics Mode Screen (384x126)
public struct StatisticsScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            if let sum = state.statSummary {
                summaryResultView(summary: sum)
            } else if state.statType == 0 {
                typeSelectView
            } else if state.statType == 1 {
                dataEditorTableView
            } else {
                statCalculationView
            }
        }
        .frame(width: 384, height: 126)
        .foregroundColor(.black)
    }
    
    private var miniStatusBar: some View {
        HStack(spacing: 6) {
            Text("STAT")
                .font(.system(size: 9, weight: .bold, design: .monospaced))
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
    
    // 1. Select Statistics Type
    private var typeSelectView: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text(state.isVietnamese ? "Thống kê (Statistics):" : "Select Stat Type:")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                Spacer()
                Text(state.statPage == 1 ? "1/2 ▼" : "2/2 ▲")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
            
            if state.statPage == 1 {
                Text("1: 1-Biến (1-Variable)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("2: y=a+bx")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("3: y=a+bx+cx²")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("4: y=a+b*ln(x)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
            } else {
                Text("1: y=a*e^(bx)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("2: y=a*b^x")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("3: y=a*x^b")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("4: y=a+b/x")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
    }
    
    // 2. Data Editor Table
    private var dataEditorTableView: some View {
        let is2Var = (state.statSubChoice >= 2)
        let total = max(1, state.statDataX.count)
        let curRow = state.statCursorRow
        let startRow = max(0, min(max(0, total - 3), curRow - 1))
        let endRow = min(total, startRow + 3)
        
        return VStack(spacing: 1) {
            // Header
            HStack(spacing: 0) {
                Text("")
                    .frame(width: 22)
                Text("X")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .frame(maxWidth: .infinity)
                if is2Var {
                    Text("Y")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .frame(maxWidth: .infinity)
                }
                Text("FREQ")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 14)
            .background(Color.black.opacity(0.08))
            
            // 3 Rows
            VStack(spacing: 1) {
                ForEach(startRow..<endRow, id: \.self) { r in
                    HStack(spacing: 0) {
                        Text("\(r + 1)")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .frame(width: 22, alignment: .center)
                        
                        // X cell
                        let isSelX = (state.statCursorRow == r && state.statCursorCol == 0)
                        let xVal = r < state.statDataX.count ? state.statDataX[r] : 0.0
                        let xTxt = (isSelX && !state.statInputBuf.isEmpty) ? state.statInputBuf : formatVal(xVal)
                        cellText(txt: xTxt, isSelected: isSelX)
                        
                        // Y cell (if 2-var)
                        if is2Var {
                            let isSelY = (state.statCursorRow == r && state.statCursorCol == 1)
                            let yVal = r < state.statDataY.count ? state.statDataY[r] : 0.0
                            let yTxt = (isSelY && !state.statInputBuf.isEmpty) ? state.statInputBuf : formatVal(yVal)
                            cellText(txt: yTxt, isSelected: isSelY)
                        }
                        
                        // FREQ cell
                        let freqCol = is2Var ? 2 : 1
                        let isSelF = (state.statCursorRow == r && state.statCursorCol == freqCol)
                        let fVal = r < state.statDataFreq.count ? state.statDataFreq[r] : 1
                        let fTxt = (isSelF && !state.statInputBuf.isEmpty) ? state.statInputBuf : "\(fVal)"
                        cellText(txt: fTxt, isSelected: isSelF)
                    }
                    .frame(height: 20)
                }
            }
            
            Spacer()
            
            // Bottom prompt
            let pLabel = promptColLabel(col: state.statCursorCol, is2Var: is2Var)
            HStack {
                Text("\(pLabel)\(state.statCursorRow + 1) =")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text(state.statInputBuf)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
        }
    }
    
    // 3. Summary Result Screen (Scrollable)
    private func summaryResultView(summary: StatisticsSummary) -> some View {
        let lines: [(label: String, val: Double)] = [
            ("x̄", summary.meanX),
            ("Σx", summary.sumX),
            ("Σx²", summary.sumX2),
            ("σ²x", pow(summary.sigmaX, 2)),
            ("σx", summary.sigmaX),
            ("sx", summary.sX),
            ("n", Double(summary.n)),
            ("min(x)", summary.minX),
            ("Q1", summary.q1),
            ("Med", summary.med),
            ("Q3", summary.q3),
            ("max(x)", summary.maxX)
        ]
        
        let startIdx = max(0, min(max(0, lines.count - 3), state.statSummaryScroll))
        let visibleLines = lines[startIdx..<min(lines.count, startIdx + 3)]
        
        return VStack(spacing: 2) {
            ForEach(Array(visibleLines), id: \.label) { item in
                HStack {
                    Text(item.label)
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                    Spacer()
                    Text(formatVal(item.val))
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                }
                .padding(.horizontal, 10)
                .frame(height: 26)
            }
            
            Spacer()
        }
        .padding(.top, 4)
    }
    
    // 4. Stat Calc View
    private var statCalculationView: some View {
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
    
    private func cellText(txt: String, isSelected: Bool) -> some View {
        Text(txt)
            .font(.system(size: 11, weight: .bold, design: .monospaced))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 6)
            .frame(height: 20)
            .background(isSelected ? Color.black : Color.clear)
            .foregroundColor(isSelected ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
    }
    
    private func promptColLabel(col: Int, is2Var: Bool) -> String {
        if col == 0 { return "X" }
        if is2Var && col == 1 { return "Y" }
        return "FREQ"
    }
    
    private func formatVal(_ v: Double) -> String {
        if abs(v - round(v)) < 1e-9 { return "\(Int64(round(v)))" }
        return String(format: "%.6g", v)
    }
}

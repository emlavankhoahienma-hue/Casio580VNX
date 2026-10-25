import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Table Mode Screen (384x126)
public struct TableScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            if state.tableStep == 0 {
                fxInputPromptView
            } else if state.tableStep >= 1 && state.tableStep <= 3 {
                tableRangePromptView
            } else {
                tableDataView
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
            if state.tableStep == 4 {
                Text("▲▼")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
            }
        }
        .frame(height: 14)
        .padding(.horizontal, 6)
        .padding(.top, 2)
    }
    
    // 1. f(x) Input View
    private var fxInputPromptView: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text("f(x) =")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    MathNodeSequenceView(
                        nodes: state.tableFxDoc.nodes,
                        cursorIndex: state.tableFxDoc.cursorIndex,
                        emptyPlaceholder: "□"
                    )
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 6)
            
            Spacer()
        }
    }
    
    // 2. Table Range Prompts: Start, End, Step
    private var tableRangePromptView: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(state.isVietnamese ? "Phạm vi bảng (Table Range):" : "Table Range:")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .padding(.horizontal, 8)
            
            VStack(spacing: 3) {
                rangeRow(label: state.isVietnamese ? "Bắt đầu? (Start)" : "Start?", step: 1, defaultVal: state.tableRangeStart)
                rangeRow(label: state.isVietnamese ? "Kết thúc? (End)" : "End?", step: 2, defaultVal: state.tableRangeEnd)
                rangeRow(label: state.isVietnamese ? "Bước? (Step)" : "Step?", step: 3, defaultVal: state.tableRangeStep)
            }
            .padding(.horizontal, 8)
            
            Spacer()
        }
    }
    
    private func rangeRow(label: String, step: Int, defaultVal: Double) -> some View {
        let isCurrent = (state.tableStep == step)
        let displayVal = isCurrent ? state.tableRangeInputBuf : formatVal(defaultVal)
        
        return HStack {
            Text(label)
                .font(.system(size: 11, weight: isCurrent ? .bold : .regular, design: .monospaced))
            Spacer()
            Text(displayVal)
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .padding(.horizontal, 6)
                .frame(width: 50, height: 18, alignment: .trailing)
                .background(isCurrent ? Color.black : Color.clear)
                .foregroundColor(isCurrent ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
                .cornerRadius(2)
        }
    }
    
    // 3. Table Data Grid
    private var tableDataView: some View {
        VStack(spacing: 1) {
            // Header: row #, x, f(x)
            HStack(spacing: 0) {
                Text("")
                    .frame(width: 24)
                Text("x")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .frame(maxWidth: .infinity)
                Text("f(x)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 14)
            .background(Color.black.opacity(0.06))
            
            // 3 visible rows
            let total = state.tableRows.count
            let startRow = max(0, min(max(0, total - 3), state.tableSelectedRow - 1))
            let endRow = min(total, startRow + 3)
            
            VStack(spacing: 1) {
                ForEach(startRow..<endRow, id: \.self) { r in
                    let isSelected = (state.tableSelectedRow == r)
                    let rowData = state.tableRows[r]
                    
                    HStack(spacing: 0) {
                        Text("\(r + 1)")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .frame(width: 24, alignment: .center)
                        
                        Text(formatVal(rowData.x))
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 8)
                        
                        let fxStr = rowData.fx != nil ? formatVal(rowData.fx!) : "ERROR"
                        Text(fxStr)
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 8)
                    }
                    .frame(height: 20)
                    .background(isSelected ? Color.black : Color.clear)
                    .foregroundColor(isSelected ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
                }
            }
            
            Spacer()
            
            // Bottom status line: selected cell full value
            if total > 0 && state.tableSelectedRow < total {
                let cur = state.tableRows[state.tableSelectedRow]
                let fxVal = cur.fx != nil ? formatVal(cur.fx!) : "ERROR"
                HStack {
                    Text("f(\(formatVal(cur.x))) = \(fxVal)")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                    Spacer()
                }
                .padding(.horizontal, 6)
                .padding(.bottom, 2)
            }
        }
    }
    
    private func formatVal(_ v: Double) -> String {
        if abs(v - round(v)) < 1e-9 { return "\(Int64(round(v)))" }
        return String(format: "%g", v)
    }
}

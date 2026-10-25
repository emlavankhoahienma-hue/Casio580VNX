import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Spreadsheet Mode Screen (384x126)
public struct SpreadsheetScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            // Spreadsheet Table Grid
            VStack(spacing: 1) {
                // Column Headers: A, B, C (3 visible at a time)
                let startCol = max(0, min(2, state.sheetCursorCol))
                HStack(spacing: 0) {
                    Text("")
                        .frame(width: 22)
                    ForEach(startCol..<(startCol + 3), id: \.self) { c in
                        let colLetter = String(UnicodeScalar(65 + c)!)
                        Text(colLetter)
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(height: 14)
                .background(Color.black.opacity(0.08))
                
                // 3 visible rows
                let startRow = max(1, min(43, state.sheetCursorRow - 1))
                ForEach(startRow..<(startRow + 3), id: \.self) { r in
                    HStack(spacing: 0) {
                        Text("\(r)")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .frame(width: 22, alignment: .center)
                        
                        ForEach(startCol..<(startCol + 3), id: \.self) { c in
                            let isSelected = (state.sheetCursorRow == r && state.sheetCursorCol == c)
                            let cellKey = "\(Character(UnicodeScalar(65 + c)!))\(r)"
                            let val = state.sheetCells[cellKey]
                            let displayTxt = (isSelected && !state.sheetInputBuf.isEmpty) ? state.sheetInputBuf : (val != nil ? formatVal(val!) : "")
                            
                            Text(displayTxt)
                                .font(.system(size: 11, weight: .bold, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.horizontal, 4)
                                .frame(height: 20)
                                .background(isSelected ? Color.black : Color.clear)
                                .foregroundColor(isSelected ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
                        }
                    }
                }
            }
            .padding(.horizontal, 2)
            
            Spacer()
            
            // Bottom line: Cell address and full value/formula
            let curColLetter = String(UnicodeScalar(65 + state.sheetCursorCol)!)
            let curCellKey = "\(curColLetter)\(state.sheetCursorRow)"
            let curVal = state.sheetCells[curCellKey]
            let promptVal = !state.sheetInputBuf.isEmpty ? state.sheetInputBuf : (curVal != nil ? formatVal(curVal!) : "0")
            
            HStack {
                Text("\(curCellKey) =")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Text(promptVal)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
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
    
    private func formatVal(_ v: Double) -> String {
        if abs(v - round(v)) < 1e-9 { return "\(Int64(round(v)))" }
        return String(format: "%g", v)
    }
}

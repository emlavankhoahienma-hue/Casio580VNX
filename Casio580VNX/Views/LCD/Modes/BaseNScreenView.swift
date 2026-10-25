import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Base-N Mode Screen (384x126)
public struct BaseNScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            VStack(alignment: .leading, spacing: 2) {
                // Input Line
                ScrollView(.horizontal, showsIndicators: false) {
                    MathNodeSequenceView(
                        nodes: state.document.nodes,
                        cursorIndex: state.document.cursorIndex,
                        emptyPlaceholder: ""
                    )
                    .frame(minHeight: 46, alignment: .leading)
                }
                .padding(.horizontal, 8)
                
                Spacer()
                
                // Result Display in Current Radix
                HStack {
                    Spacer()
                    if let res = state.currentResult {
                        Text(formatBaseValue(res.decimalValue, radix: state.baseNRadix))
                            .font(.system(size: 21, weight: .bold, design: .monospaced))
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 6)
            }
        }
        .frame(width: 384, height: 126)
        .foregroundColor(.black)
    }
    
    private var miniStatusBar: some View {
        HStack(spacing: 6) {
            Text(state.baseNRadix.rawValue)
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .padding(.horizontal, 2)
                .background(Color.black.opacity(0.12))
                .cornerRadius(2)
            
            Spacer()
            
            Text("▲▼")
                .font(.system(size: 9, weight: .bold, design: .monospaced))
        }
        .frame(height: 16)
        .padding(.horizontal, 8)
        .padding(.top, 2)
    }
    
    private func formatBaseValue(_ val: Double, radix: BaseNRadix) -> String {
        let intVal = Int64(val)
        switch radix {
        case .dec:
            return "\(intVal)"
        case .hex:
            let hexStr = String(intVal, radix: 16, uppercase: true)
            return hexStr
        case .bin:
            let binStr = String(intVal, radix: 2)
            // Group into 4 bits
            var grouped = ""
            let chars = Array(binStr)
            for (idx, ch) in chars.enumerated() {
                grouped.append(ch)
                if (chars.count - 1 - idx) % 4 == 0 && idx != chars.count - 1 {
                    grouped.append(" ")
                }
            }
            return grouped
        case .oct:
            return String(intVal, radix: 8)
        }
    }
}

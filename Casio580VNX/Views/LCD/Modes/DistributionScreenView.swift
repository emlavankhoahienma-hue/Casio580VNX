import SwiftUI

// MARK: - 1:1 Genuine Casio fx-580VN X Distribution Mode Screen (384x126)
public struct DistributionScreenView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            miniStatusBar
            
            if let p = state.distResult {
                resultView(p: p)
            } else if state.distType == 0 {
                typeSelectView
            } else {
                paramPromptView
            }
        }
        .frame(width: 384, height: 126)
        .foregroundColor(.black)
    }
    
    private var miniStatusBar: some View {
        HStack(spacing: 6) {
            Text("DIST")
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
    
    // 1. Select Distribution Type
    private var typeSelectView: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text(state.isVietnamese ? "Phân phối (Distribution):" : "Distribution:")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                Spacer()
                Text(state.distPage == 1 ? "1/2 ▼" : "2/2 ▲")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
            
            if state.distPage == 1 {
                Text("1: Normal PD")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("2: Normal CD")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("3: Inverse Normal")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("4: Binomial PD")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
            } else {
                Text("1: Binomial CD")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("2: Poisson PD")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Text("3: Poisson CD")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
    }
    
    // 2. Param Prompts
    private var paramPromptView: some View {
        let params = paramDefinitions(for: state.distSubChoice)
        return VStack(alignment: .leading, spacing: 3) {
            Text(distTitle(for: state.distSubChoice))
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .padding(.horizontal, 8)
            
            VStack(spacing: 3) {
                ForEach(0..<params.count, id: \.self) { idx in
                    let isCurrent = (state.distParamIndex == idx)
                    let pVal = (idx < state.distParams.count) ? state.distParams[idx] : 0.0
                    let displayVal = isCurrent ? (state.distInputBuf.isEmpty ? formatVal(pVal) : state.distInputBuf) : formatVal(pVal)
                    
                    HStack {
                        Text("\(params[idx]) :")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .frame(width: 40, alignment: .leading)
                        Spacer()
                        Text(displayVal)
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .padding(.horizontal, 6)
                            .frame(minWidth: 50, height: 18, alignment: .trailing)
                            .background(isCurrent ? Color.black : Color.clear)
                            .foregroundColor(isCurrent ? Color(red: 0.88, green: 0.94, blue: 0.88) : Color.black)
                            .cornerRadius(2)
                    }
                }
            }
            .padding(.horizontal, 8)
            
            Spacer()
        }
    }
    
    // 3. Result View
    private func resultView(p: Double) -> some View {
        VStack(spacing: 4) {
            HStack {
                Text(distTitle(for: state.distSubChoice))
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 8)
            
            HStack {
                Text("P =")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                Spacer()
            }
            .padding(.horizontal, 12)
            
            Spacer()
            
            HStack {
                Spacer()
                Text(String(format: "%.10g", p))
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
            }
            .padding(.horizontal, 14)
            .padding(.bottom, 6)
        }
    }
    
    private func paramDefinitions(for choice: Int) -> [String] {
        switch choice {
        case 1: return ["x", "σ", "μ"]
        case 2: return ["Lower", "Upper", "σ", "μ"]
        case 3: return ["Area", "σ", "μ"]
        case 4, 5: return ["x", "N", "p"]
        case 6, 7: return ["x", "λ"]
        default: return ["x"]
        }
    }
    
    private func distTitle(for choice: Int) -> String {
        switch choice {
        case 1: return "Normal PD"
        case 2: return "Normal CD"
        case 3: return "Inverse Normal"
        case 4: return "Binomial PD"
        case 5: return "Binomial CD"
        case 6: return "Poisson PD"
        case 7: return "Poisson CD"
        default: return "Distribution"
        }
    }
    
    private func formatVal(_ v: Double) -> String {
        if abs(v - round(v)) < 1e-9 { return "\(Int64(round(v)))" }
        return String(format: "%g", v)
    }
}

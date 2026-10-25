import SwiftUI

// MARK: - 1:1 Genuine ClassWiz LCD Option Screen (Embedded directly inside 192x63 LCD)
public struct OptionMenuView: View {
    @ObservedObject var state: CalculatorState
    let subCategory: OptionSubCategory?
    
    public init(state: CalculatorState, subCategory: OptionSubCategory? = nil) {
        self.state = state
        self.subCategory = subCategory
    }
    
    public var body: some View {
        ZStack {
            if let sub = subCategory {
                renderSubCategory(sub)
            } else {
                renderMainOptions()
            }
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 3)
    }
    
    @ViewBuilder
    private func renderMainOptions() -> some View {
        switch state.currentMode {
        case .calculate:
            VStack(alignment: .leading, spacing: 3) {
                Text(state.isVietnamese ? "TÙY CHỌN (OPTN)" : "OPTIONS (OPTN)")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.6))
                
                Button(action: { state.activeOverlay = .option(subCategory: .hyperbolic) }) {
                    Text("1: " + (state.isVietnamese ? "Hàm Hyperbolic" : "Hyperbolic Func"))
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                }
                Button(action: { state.activeOverlay = .option(subCategory: .angleUnit) }) {
                    Text("2: " + (state.isVietnamese ? "Đơn vị góc" : "Angle Unit"))
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                }
                Button(action: { state.activeOverlay = .option(subCategory: .engineerSymbol) }) {
                    Text("3: " + (state.isVietnamese ? "Ký hiệu KT" : "Engineer Symbol"))
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            
        case .complex:
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 12) {
                    Button(action: { state.document.insert(char: "i"); state.activeOverlay = .none }) {
                        Text("1: i")
                    }
                    Button(action: { state.document.insert(char: "∠"); state.activeOverlay = .none }) {
                        Text("2: ∠")
                    }
                    Button(action: { state.document.insert(char: "Conjg("); state.activeOverlay = .none }) {
                        Text("3: Conjg")
                    }
                }
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
                
                HStack(spacing: 12) {
                    Button(action: { state.document.insert(char: "▸r∠θ"); state.activeOverlay = .none }) {
                        Text("4: ▸r∠θ")
                    }
                    Button(action: { state.document.insert(char: "▸a+bi"); state.activeOverlay = .none }) {
                        Text("5: ▸a+bi")
                    }
                }
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
                
                Spacer()
            }
            
        case .matrix:
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 8) {
                    Text("1:Define")
                    Text("2:MatA")
                    Text("3:MatB")
                    Text("4:MatC")
                }
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
                
                HStack(spacing: 8) {
                    Text("5:MatD")
                    Text("6:MatAns")
                    Text("7:Det")
                    Text("8:Trn")
                }
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
                
                Spacer()
            }
            
        case .vector:
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 8) {
                    Text("1:Define")
                    Text("2:VctA")
                    Text("3:VctB")
                    Text("4:VctC")
                }
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
                
                HStack(spacing: 8) {
                    Text("5:VctD")
                    Text("6:VctAns")
                    Text("7:Dot (•)")
                }
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
                
                Spacer()
            }
            
        default:
            VStack(alignment: .leading, spacing: 4) {
                Text(state.isVietnamese ? "Không có tùy chọn phụ" : "No sub-options for mode")
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(.black)
                Text("[AC]: " + (state.isVietnamese ? "Quay lại" : "Back"))
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func renderSubCategory(_ sub: OptionSubCategory) -> some View {
        switch sub {
        case .hyperbolic:
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 12) {
                    Button(action: { state.document.insert(char: "sinh("); state.activeOverlay = .none }) { Text("1:sinh") }
                    Button(action: { state.document.insert(char: "cosh("); state.activeOverlay = .none }) { Text("2:cosh") }
                    Button(action: { state.document.insert(char: "tanh("); state.activeOverlay = .none }) { Text("3:tanh") }
                }
                HStack(spacing: 12) {
                    Button(action: { state.document.insert(char: "asinh("); state.activeOverlay = .none }) { Text("4:sinh⁻¹") }
                    Button(action: { state.document.insert(char: "acosh("); state.activeOverlay = .none }) { Text("5:cosh⁻¹") }
                    Button(action: { state.document.insert(char: "atanh("); state.activeOverlay = .none }) { Text("6:tanh⁻¹") }
                }
                Spacer()
            }
            .font(.system(size: 11, weight: .bold, design: .monospaced))
            .foregroundColor(.black)
            
        case .angleUnit:
            VStack(alignment: .leading, spacing: 3) {
                Button(action: { state.document.insert(char: "°"); state.activeOverlay = .none }) { Text("1: ° (Độ / Deg)") }
                Button(action: { state.document.insert(char: "r"); state.activeOverlay = .none }) { Text("2: r (Radian)") }
                Button(action: { state.document.insert(char: "g"); state.activeOverlay = .none }) { Text("3: g (Gradian)") }
                Spacer()
            }
            .font(.system(size: 11, weight: .bold, design: .monospaced))
            .foregroundColor(.black)
            
        case .engineerSymbol:
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 10) {
                    Text("1:m")
                    Text("2:μ")
                    Text("3:n")
                    Text("4:p")
                    Text("5:f")
                }
                HStack(spacing: 10) {
                    Text("6:k")
                    Text("7:M")
                    Text("8:G")
                    Text("9:T")
                }
                Spacer()
            }
            .font(.system(size: 11, weight: .bold, design: .monospaced))
            .foregroundColor(.black)
        }
    }
}

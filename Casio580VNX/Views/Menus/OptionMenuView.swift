import SwiftUI

// MARK: - 1:1 Genuine ClassWiz LCD Option Screen (Pixel-Perfect 384x126 Framebuffer)
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
        .frame(width: 384, height: 126)
    }
    
    @ViewBuilder
    private func renderMainOptions() -> some View {
        VStack(spacing: 0) {
            // Header
            ZStack {
                Color.black.opacity(0.88)
                HStack {
                    Text(state.isVietnamese ? "TÙY CHỌN (OPTN)" : "OPTIONS (OPTN)")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                    Spacer()
                    Text("[\(state.currentMode.titleEn)]")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                }
                .padding(.horizontal, 8)
            }
            .frame(height: 22)
            
            // Content
            Group {
                switch state.currentMode {
                case .calculate:
                    VStack(alignment: .leading, spacing: 3) {
                        Button(action: { state.activeOverlay = .option(subCategory: .hyperbolic) }) {
                            Text("1: " + (state.isVietnamese ? "Hàm Hyperbolic" : "Hyperbolic Func"))
                        }
                        Button(action: { state.activeOverlay = .option(subCategory: .angleUnit) }) {
                            Text("2: " + (state.isVietnamese ? "Đơn vị góc" : "Angle Unit"))
                        }
                        Button(action: { state.activeOverlay = .option(subCategory: .engineerSymbol) }) {
                            Text("3: " + (state.isVietnamese ? "Ký hiệu KT" : "Engineer Symbol"))
                        }
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .complex:
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 16) {
                            Button(action: { state.document.insert(char: "i"); state.activeOverlay = .none }) { Text("1: i") }
                            Button(action: { state.document.insert(char: "∠"); state.activeOverlay = .none }) { Text("2: ∠") }
                            Button(action: { state.document.insert(char: "Conjg("); state.activeOverlay = .none }) { Text("3: Conjg") }
                        }
                        HStack(spacing: 16) {
                            Button(action: { state.document.insert(char: "▸r∠θ"); state.activeOverlay = .none }) { Text("4: ▸r∠θ") }
                            Button(action: { state.document.insert(char: "▸a+bi"); state.activeOverlay = .none }) { Text("5: ▸a+bi") }
                        }
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .matrix:
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 10) {
                            Text("1:Define")
                            Text("2:MatA")
                            Text("3:MatB")
                            Text("4:MatC")
                        }
                        HStack(spacing: 10) {
                            Text("5:MatD")
                            Text("6:MatAns")
                            Text("7:Det")
                            Text("8:Trn")
                        }
                    }
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .vector:
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 10) {
                            Text("1:Define")
                            Text("2:VctA")
                            Text("3:VctB")
                            Text("4:VctC")
                        }
                        HStack(spacing: 10) {
                            Text("5:VctD")
                            Text("6:VctAns")
                            Text("7:Dot (•)")
                        }
                    }
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                default:
                    VStack(alignment: .leading, spacing: 3) {
                        Text(state.isVietnamese ? "Không có tùy chọn phụ" : "No sub-options")
                            .font(.system(size: 12, design: .monospaced))
                        Text("[AC]: " + (state.isVietnamese ? "Quay lại" : "Back"))
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                }
            }
            
            // Footer
            Rectangle()
                .fill(Color.black.opacity(0.2))
                .frame(height: 1)
                .padding(.horizontal, 6)
            
            HStack {
                Text(state.isVietnamese ? "1~8: Chọn" : "1~8: Select")
                    .font(.system(size: 10, design: .monospaced))
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Thoát" : "Cancel"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
            .padding(.horizontal, 8)
            .frame(height: 24)
        }
    }
    
    @ViewBuilder
    private func renderSubCategory(_ sub: OptionSubCategory) -> some View {
        VStack(spacing: 0) {
            ZStack {
                Color.black.opacity(0.88)
                let title: String = {
                    switch sub {
                    case .hyperbolic: return state.isVietnamese ? "HÀM HYPERBOLIC" : "HYPERBOLIC"
                    case .angleUnit: return state.isVietnamese ? "ĐƠN VỊ GÓC" : "ANGLE UNIT"
                    case .engineerSymbol: return state.isVietnamese ? "KÝ HIỆU KỸ THUẬT" : "ENG SYMBOLS"
                    }
                }()
                Text(title)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
            }
            .frame(height: 22)
            
            Group {
                switch sub {
                case .hyperbolic:
                    VStack(alignment: .leading, spacing: 4) {
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
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .angleUnit:
                    VStack(alignment: .leading, spacing: 4) {
                        Button(action: { state.document.insert(char: "°"); state.activeOverlay = .none }) { Text("1: ° (Độ / Deg)") }
                        Button(action: { state.document.insert(char: "r"); state.activeOverlay = .none }) { Text("2: r (Radian)") }
                        Button(action: { state.document.insert(char: "g"); state.activeOverlay = .none }) { Text("3: g (Gradian)") }
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .engineerSymbol:
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 12) {
                            Text("1:m")
                            Text("2:μ")
                            Text("3:n")
                            Text("4:p")
                            Text("5:f")
                        }
                        HStack(spacing: 12) {
                            Text("6:k")
                            Text("7:M")
                            Text("8:G")
                            Text("9:T")
                        }
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                }
            }
            
            // Footer
            HStack {
                Text(state.isVietnamese ? "Bấm số để chèn" : "Press number to insert")
                    .font(.system(size: 10, design: .monospaced))
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Thoát" : "Cancel"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
            .padding(.horizontal, 8)
            .frame(height: 24)
        }
    }
}

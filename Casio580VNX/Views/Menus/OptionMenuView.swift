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
                        Text("1: " + (state.isVietnamese ? "Hàm Hyperbolic" : "Hyperbolic Func"))
                        Text("2: " + (state.isVietnamese ? "Đơn vị góc" : "Angle Unit"))
                        Text("3: " + (state.isVietnamese ? "Ký hiệu KT" : "Engineer Symbol"))
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .complex:
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 16) {
                            Text("1: i")
                            Text("2: ∠")
                            Text("3: Conjg")
                        }
                        HStack(spacing: 16) {
                            Text("4: ▸r∠θ")
                            Text("5: ▸a+bi")
                        }
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .baseN:
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 16) {
                            Text("1: and")
                            Text("2: or")
                            Text("3: xor")
                        }
                        HStack(spacing: 16) {
                            Text("4: xnor")
                            Text("5: Not")
                            Text("6: Neg")
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
                    
                case .statistics:
                    VStack(alignment: .leading, spacing: 3) {
                        Text("1: " + (state.isVietnamese ? "Chọn dạng (Select Type)" : "Select Type"))
                        Text("2: " + (state.isVietnamese ? "Dữ liệu (Data)" : "Data Editor"))
                        Text("3: " + (state.isVietnamese ? "Tính 1-Biến (1-Var Calc)" : "1-Variable Calc"))
                        Text("4: " + (state.isVietnamese ? "Tính Thống kê (2-Var Calc)" : "2-Variable Calc"))
                    }
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .spreadsheet:
                    VStack(alignment: .leading, spacing: 3) {
                        Text("1: " + (state.isVietnamese ? "Điền công thức (Fill Formula)" : "Fill Formula"))
                        Text("2: " + (state.isVietnamese ? "Điền giá trị (Fill Value)" : "Fill Value"))
                        Text("3: " + (state.isVietnamese ? "Tạo dãy số (Generate)" : "Generate"))
                        Text("4: " + (state.isVietnamese ? "Tiện ích (Min/Max/Sum)" : "Min/Max/Sum"))
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
                            Text("1:sinh")
                            Text("2:cosh")
                            Text("3:tanh")
                        }
                        HStack(spacing: 12) {
                            Text("4:sinh⁻¹")
                            Text("5:cosh⁻¹")
                            Text("6:tanh⁻¹")
                        }
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .angleUnit:
                    VStack(alignment: .leading, spacing: 4) {
                        Text("1: ° (Độ / Deg)")
                        Text("2: r (Radian)")
                        Text("3: g (Gradian)")
                    }
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .frame(height: 78, alignment: .leading)
                    
                case .engineerSymbol:
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 14) {
                            Text("1: m (10⁻³)")
                            Text("2: μ (10⁻⁶)")
                            Text("3: n (10⁻⁹)")
                        }
                        HStack(spacing: 14) {
                            Text("4: k (10³)")
                            Text("5: M (10⁶)")
                            Text("6: G (10⁹)")
                        }
                    }
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
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
                Text(state.isVietnamese ? "1~6: Chọn" : "1~6: Select")
                    .font(.system(size: 10, design: .monospaced))
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Quay lại" : "Back"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
            .padding(.horizontal, 8)
            .frame(height: 24)
        }
    }
}

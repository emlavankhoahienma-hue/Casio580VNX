import SwiftUI

// MARK: - 1:1 Genuine ClassWiz LCD Setup Screen (Pixel-Perfect 384x126 Framebuffer)
public struct SetupMenuView: View {
    @ObservedObject var state: CalculatorState
    let page: Int
    let subCategory: SetupSubCategory?
    
    public init(state: CalculatorState, page: Int = 1, subCategory: SetupSubCategory? = nil) {
        self.state = state
        self.page = page
        self.subCategory = subCategory
    }
    
    public var body: some View {
        ZStack {
            if let sub = subCategory {
                renderSubCategory(sub)
            } else {
                renderPage(page)
            }
        }
        .frame(width: 384, height: 126)
    }
    
    @ViewBuilder
    private func renderPage(_ pageNum: Int) -> some View {
        VStack(spacing: 0) {
            // Header
            ZStack {
                Color.black.opacity(0.88)
                HStack {
                    Text(state.isVietnamese ? "CÀI ĐẶT (SETUP)" : "SETUP MENU")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                    Spacer()
                    Text("[\(pageNum)/4]")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                }
                .padding(.horizontal, 8)
            }
            .frame(height: 22)
            
            // 4 Items list
            VStack(alignment: .leading, spacing: 1) {
                let items = pageItems(for: pageNum)
                ForEach(Array(items.enumerated()), id: \.offset) { idx, title in
                    HStack {
                        Text("\(idx + 1):\(title)")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                        Spacer()
                        if idx == 0 && pageNum > 1 {
                            Text("▲")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(.black)
                        } else if idx == 3 && pageNum < 4 {
                            Text("▼")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(.black)
                        }
                    }
                    .frame(height: 18)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        handleTap(page: pageNum, index: idx + 1)
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .frame(height: 78)
            
            // Footer
            Rectangle()
                .fill(Color.black.opacity(0.2))
                .frame(height: 1)
                .padding(.horizontal, 6)
            
            HStack {
                Text("[▲][▼]: " + (state.isVietnamese ? "Trang" : "Page"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                Spacer()
                Text("1~4: " + (state.isVietnamese ? "Chọn" : "Select"))
                    .font(.system(size: 9, design: .monospaced))
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Thoát" : "Back"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
            .padding(.horizontal, 8)
            .frame(height: 24)
        }
    }
    
    private func pageItems(for p: Int) -> [String] {
        if state.isVietnamese {
            switch p {
            case 1: return ["Nhập/Xuất", "Đơn vị góc", "Định dạng số", "Ký hiệu KT"]
            case 2: return ["Dạng phân số", "Số phức", "Thống kê", "Bảng tính"]
            case 3: return ["PT / Hệ PT", "Bảng giá trị", "Dấu thập phân", "Dấu ngăn cách"]
            default: return ["Phông nhiều dòng", "Mã QR", "Ngôn ngữ", "Độ tương phản"]
            }
        } else {
            switch p {
            case 1: return ["Input/Output", "Angle Unit", "Number Format", "Engineer Symbol"]
            case 2: return ["Fraction Result", "Complex", "Statistics", "Spreadsheet"]
            case 3: return ["Equation/Func", "Table", "Decimal Mark", "Digit Separator"]
            default: return ["MultiLine Font", "QR Code", "Language", "Contrast"]
            }
        }
    }
    
    private func handleTap(page: Int, index: Int) {
        if page == 1 && index == 2 {
            state.activeOverlay = .setup(page: 1, subCategory: .angleUnit)
        } else if page == 4 && index == 3 {
            state.activeOverlay = .setup(page: 4, subCategory: .language)
        } else if page == 4 && index == 4 {
            state.activeOverlay = .setup(page: 4, subCategory: .contrast)
        }
    }
    
    @ViewBuilder
    private func renderSubCategory(_ sub: SetupSubCategory) -> some View {
        VStack(spacing: 0) {
            switch sub {
            case .angleUnit:
                ZStack {
                    Color.black.opacity(0.88)
                    Text(state.isVietnamese ? "ĐƠN VỊ GÓC" : "ANGLE UNIT")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                }
                .frame(height: 22)
                
                VStack(alignment: .leading, spacing: 4) {
                    Button(action: { state.angleUnit = .degree; state.activeOverlay = .none }) {
                        Text("1: Degree (°)" + (state.angleUnit == .degree ? "  ◄" : ""))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    }
                    Button(action: { state.angleUnit = .radian; state.activeOverlay = .none }) {
                        Text("2: Radian (r)" + (state.angleUnit == .radian ? "  ◄" : ""))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    }
                    Button(action: { state.angleUnit = .gradian; state.activeOverlay = .none }) {
                        Text("3: Gradian (g)" + (state.angleUnit == .gradian ? "  ◄" : ""))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 12)
                .frame(height: 78)
                
                Spacer()
                
            case .language:
                ZStack {
                    Color.black.opacity(0.88)
                    Text(state.isVietnamese ? "NGÔN NGỮ (LANGUAGE)" : "LANGUAGE")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                }
                .frame(height: 22)
                
                VStack(alignment: .leading, spacing: 6) {
                    Button(action: { state.isVietnamese = true; state.activeOverlay = .none }) {
                        Text("1: Tiếng Việt" + (state.isVietnamese ? "  ◄" : ""))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    }
                    Button(action: { state.isVietnamese = false; state.activeOverlay = .none }) {
                        Text("2: English" + (!state.isVietnamese ? "  ◄" : ""))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 12)
                .frame(height: 78)
                
                Spacer()
                
            case .contrast:
                ZStack {
                    Color.black.opacity(0.88)
                    Text(state.isVietnamese ? "ĐỘ TƯƠNG PHẢN (CONTRAST)" : "CONTRAST")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.88, green: 0.93, blue: 0.88))
                }
                .frame(height: 22)
                
                VStack(spacing: 8) {
                    HStack {
                        Text("◄ " + (state.isVietnamese ? "Nhạt" : "Light"))
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                        Spacer()
                        Text((state.isVietnamese ? "Đậm" : "Dark") + " ►")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    
                    // Contrast Bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.black, lineWidth: 1.5)
                                .frame(height: 14)
                            
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.black)
                                .frame(width: max(4, geo.size.width * CGFloat(state.contrast)), height: 11)
                                .padding(.horizontal, 1.5)
                        }
                    }
                    .frame(height: 14)
                    .padding(.horizontal, 16)
                }
                .frame(height: 78)
                
                Spacer()
            }
            
            // Sub-screen footer
            HStack {
                Text("[◄][►]: " + (state.isVietnamese ? "Chỉnh" : "Adj"))
                    .font(.system(size: 10, design: .monospaced))
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Thoát" : "Back"))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
            .padding(.horizontal, 8)
            .frame(height: 24)
        }
    }
}

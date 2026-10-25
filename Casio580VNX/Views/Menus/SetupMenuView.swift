import SwiftUI

// MARK: - 1:1 Genuine ClassWiz LCD Setup Screen (Embedded directly inside 192x63 LCD)
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
        .padding(.horizontal, 6)
        .padding(.vertical, 3)
    }
    
    @ViewBuilder
    private func renderPage(_ pageNum: Int) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            let items = pageItems(for: pageNum)
            
            ForEach(Array(items.enumerated()), id: \.offset) { idx, title in
                HStack {
                    Text("\(idx + 1):\(title)")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                    Spacer()
                    if idx == 0 && pageNum > 1 {
                        Text("▲")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    } else if idx == 3 && pageNum < 4 {
                        Text("▼")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    handleTap(page: pageNum, index: idx + 1)
                }
            }
            
            Spacer()
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
        switch sub {
        case .angleUnit:
            VStack(alignment: .leading, spacing: 3) {
                Text(state.isVietnamese ? "Đơn vị góc" : "Angle Unit")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
                
                Button(action: { state.angleUnit = .degree; state.activeOverlay = .none }) {
                    Text("1: Degree (°)")
                        .font(.system(size: 11, weight: state.angleUnit == .degree ? .bold : .medium, design: .monospaced))
                        .foregroundColor(.black)
                }
                Button(action: { state.angleUnit = .radian; state.activeOverlay = .none }) {
                    Text("2: Radian (r)")
                        .font(.system(size: 11, weight: state.angleUnit == .radian ? .bold : .medium, design: .monospaced))
                        .foregroundColor(.black)
                }
                Button(action: { state.angleUnit = .gradian; state.activeOverlay = .none }) {
                    Text("3: Gradian (g)")
                        .font(.system(size: 11, weight: state.angleUnit == .gradian ? .bold : .medium, design: .monospaced))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            
        case .language:
            VStack(alignment: .leading, spacing: 4) {
                Text(state.isVietnamese ? "Ngôn ngữ" : "Language")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
                
                Button(action: { state.isVietnamese = true; state.activeOverlay = .none }) {
                    Text("1: Tiếng Việt")
                        .font(.system(size: 11, weight: state.isVietnamese ? .bold : .medium, design: .monospaced))
                        .foregroundColor(.black)
                }
                Button(action: { state.isVietnamese = false; state.activeOverlay = .none }) {
                    Text("2: English")
                        .font(.system(size: 11, weight: !state.isVietnamese ? .bold : .medium, design: .monospaced))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            
        case .contrast:
            VStack(spacing: 6) {
                Text(state.isVietnamese ? "Độ tương phản (Contrast)" : "Contrast Adjustment")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                
                HStack {
                    Text("◄ " + (state.isVietnamese ? "Nhạt" : "Light"))
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                    Spacer()
                    Text((state.isVietnamese ? "Đậm" : "Dark") + " ►")
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                }
                .foregroundColor(.black)
                
                // Contrast Bar Indicator
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(height: 12)
                        
                        RoundedRectangle(cornerRadius: 1)
                            .fill(Color.black)
                            .frame(width: geo.size.width * CGFloat(state.contrast), height: 10)
                            .padding(.horizontal, 1)
                    }
                }
                .frame(height: 12)
                
                HStack {
                    Text("[◄][►]: " + (state.isVietnamese ? "Chỉnh" : "Adj"))
                        .font(.system(size: 9, design: .monospaced))
                    Spacer()
                    Text("[AC]: " + (state.isVietnamese ? "Xong" : "OK"))
                        .font(.system(size: 9, design: .monospaced))
                }
                .foregroundColor(Color.black.opacity(0.8))
            }
            .padding(.top, 4)
        }
    }
}

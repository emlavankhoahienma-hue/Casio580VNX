import SwiftUI

public struct SetupMenuView: View {
    @ObservedObject var state: CalculatorState
    let page: Int
    
    public init(state: CalculatorState, page: Int = 1) {
        self.state = state
        self.page = page
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.85)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { state.activeOverlay = .none }
            
            VStack(spacing: 12) {
                // Header with Page indicators
                HStack {
                    Text(state.isVietnamese ? "CÀI ĐẶT (SETUP) [\(page)/4]" : "SETUP [\(page)/4]")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: { state.activeOverlay = .none }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                VStack(spacing: 8) {
                    if page == 1 {
                        pageOneView
                    } else if page == 2 {
                        pageTwoView
                    } else if page == 3 {
                        pageThreeView
                    } else {
                        pageFourView
                    }
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                // Page Navigation Bar
                HStack {
                    Button(action: {
                        if page > 1 { state.activeOverlay = .setup(page: page - 1) }
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Trang trước")
                        }
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(page > 1 ? .yellow : .gray)
                    }
                    .disabled(page <= 1)
                    
                    Spacer()
                    
                    Button(action: {
                        if page < 4 { state.activeOverlay = .setup(page: page + 1) }
                    }) {
                        HStack {
                            Text("Trang sau")
                            Image(systemName: "chevron.right")
                        }
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(page < 4 ? .yellow : .gray)
                    }
                    .disabled(page >= 4)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .frame(maxWidth: 360, minHeight: 340)
            .background(Color(red: 0.14, green: 0.16, blue: 0.19))
            .cornerRadius(16)
            .shadow(radius: 20)
            .padding(16)
        }
    }
    
    // Page 1: Input/Output, Angle Unit, Number Format
    private var pageOneView: some View {
        VStack(spacing: 8) {
            setupRow(num: "1", title: state.isVietnamese ? "Đơn vị góc: Độ (Deg)" : "Angle Unit: Deg", isSelected: state.angleUnit == .degree) {
                state.angleUnit = .degree
                MathEvaluator.shared.angleUnit = .degree
            }
            setupRow(num: "2", title: state.isVietnamese ? "Đơn vị góc: Radian (Rad)" : "Angle Unit: Rad", isSelected: state.angleUnit == .radian) {
                state.angleUnit = .radian
                MathEvaluator.shared.angleUnit = .radian
            }
            setupRow(num: "3", title: state.isVietnamese ? "Đơn vị góc: Gradian (Gra)" : "Angle Unit: Gra", isSelected: state.angleUnit == .gradian) {
                state.angleUnit = .gradian
                MathEvaluator.shared.angleUnit = .gradian
            }
            setupRow(num: "4", title: state.isVietnamese ? "Định dạng số: Norm 1" : "Number Format: Norm 1", isSelected: MathEvaluator.shared.normMode == 1 && MathEvaluator.shared.fixDigits == nil) {
                MathEvaluator.shared.fixDigits = nil
                MathEvaluator.shared.sciDigits = nil
                MathEvaluator.shared.normMode = 1
            }
        }
    }
    
    // Page 2: Fraction format, Complex format, Stat frequency
    private var pageTwoView: some View {
        VStack(spacing: 8) {
            setupRow(num: "1", title: state.isVietnamese ? "Phân số: d/c (Tối giản)" : "Fraction: d/c", isSelected: true) {}
            setupRow(num: "2", title: state.isVietnamese ? "Phân số: ab/c (Hỗn số)" : "Fraction: ab/c", isSelected: false) {}
            setupRow(num: "3", title: state.isVietnamese ? "Số phức: a + bi (Đại số)" : "Complex: a + bi", isSelected: true) {}
            setupRow(num: "4", title: state.isVietnamese ? "Số phức: r ∠ θ (Lượng giác)" : "Complex: r ∠ θ", isSelected: false) {}
        }
    }
    
    // Page 3: Language, Decimal Separator
    private var pageThreeView: some View {
        VStack(spacing: 8) {
            setupRow(num: "1", title: "Ngôn ngữ: Tiếng Việt", isSelected: state.isVietnamese) {
                state.isVietnamese = true
            }
            setupRow(num: "2", title: "Language: English", isSelected: !state.isVietnamese) {
                state.isVietnamese = false
            }
            setupRow(num: "3", title: state.isVietnamese ? "Dấu thập phân: Chấm (.)" : "Decimal: Dot (.)", isSelected: true) {}
            setupRow(num: "4", title: state.isVietnamese ? "Dấu thập phân: Phẩy (,)" : "Decimal: Comma (,)", isSelected: false) {}
        }
    }
    
    // Page 4: LCD Contrast
    private var pageFourView: some View {
        VStack(spacing: 16) {
            Text(state.isVietnamese ? "ĐỘ TƯƠNG PHẢN MÀN HÌNH LCD" : "LCD CONTRAST")
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
            
            HStack {
                Text("Sáng")
                    .foregroundColor(.gray)
                    .font(.caption)
                Slider(value: $state.contrast, in: 0.1...0.9, step: 0.05)
                    .accentColor(.yellow)
                Text("Tối")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            
            // Preview box
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(white: state.contrast * 0.4 + 0.5))
                .frame(height: 50)
                .overlay(
                    Text("1234567890 √□")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(.black.opacity(0.85))
                )
        }
        .padding(.vertical, 10)
    }
    
    private func setupRow(num: String, title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
            state.activeOverlay = .none
        }) {
            HStack {
                Text("[\(num)]")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(.yellow)
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.yellow)
                        .font(.system(size: 12, weight: .bold))
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color(white: 0.2))
            .cornerRadius(8)
        }
    }
}

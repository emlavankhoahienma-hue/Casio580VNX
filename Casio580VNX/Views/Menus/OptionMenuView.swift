import SwiftUI

public struct OptionMenuView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.85)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { state.activeOverlay = .none }
            
            VStack(spacing: 12) {
                HStack {
                    Text(titleForCurrentMode)
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
                
                ScrollView {
                    VStack(spacing: 8) {
                        switch state.currentMode {
                        case .calculate:
                            calculateOptions
                        case .complex:
                            complexOptions
                        case .baseN:
                            baseNOptions
                        case .matrix:
                            matrixOptions
                        case .vector:
                            vectorOptions
                        default:
                            calculateOptions
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
            .frame(maxWidth: 360, maxHeight: 460)
            .background(Color(red: 0.14, green: 0.16, blue: 0.19))
            .cornerRadius(16)
            .shadow(radius: 20)
            .padding(16)
        }
    }
    
    private var titleForCurrentMode: String {
        state.isVietnamese ? "TÙY CHỌN (OPTION)" : "OPTIONS (OPTN)"
    }
    
    private var calculateOptions: some View {
        VStack(spacing: 6) {
            optRow(num: "1", title: "Hyperbolic (sinh, cosh, tanh)") {
                state.document.insert(char: "sinh(")
            }
            optRow(num: "2", title: state.isVietnamese ? "Đơn vị góc (° ' \")" : "Angle Unit (° ' \")") {
                state.document.insert(char: "°")
            }
            optRow(num: "3", title: "Ký hiệu kỹ thuật (ENG)") {
                state.document.insert(char: "E")
            }
            optRow(num: "4", title: "Ước chung lớn nhất (GCD)") {
                state.document.insert(char: "gcd(")
            }
            optRow(num: "5", title: "Bội chung nhỏ nhất (LCM)") {
                state.document.insert(char: "lcm(")
            }
            optRow(num: "6", title: "Số ngẫu nhiên (Ran#)") {
                state.document.insert(char: "Ran#")
            }
        }
    }
    
    private var complexOptions: some View {
        VStack(spacing: 6) {
            optRow(num: "1", title: "Argument / Góc lệch: Arg(z)") {
                state.document.insert(char: "Arg(")
            }
            optRow(num: "2", title: "Số phức liên hợp: Conjg(z)") {
                state.document.insert(char: "Conjg(")
            }
            optRow(num: "3", title: "Phần thực: ReP(z)") {
                state.document.insert(char: "ReP(")
            }
            optRow(num: "4", title: "Phần ảo: ImP(z)") {
                state.document.insert(char: "ImP(")
            }
            optRow(num: "5", title: "Đổi sang cực: ➔ r∠θ") {
                state.document.insert(char: "∠")
            }
        }
    }
    
    private var baseNOptions: some View {
        VStack(spacing: 6) {
            optRow(num: "1", title: "Phép VÀ (and)") { state.document.insert(char: " and ") }
            optRow(num: "2", title: "Phép HOẶC (or)") { state.document.insert(char: " or ") }
            optRow(num: "3", title: "Phép XOR (xor)") { state.document.insert(char: " xor ") }
            optRow(num: "4", title: "Phép XNOR (xnor)") { state.document.insert(char: " xnor ") }
            optRow(num: "5", title: "Phủ định (not)") { state.document.insert(char: "not(") }
            optRow(num: "6", title: "Đổi dấu (Neg)") { state.document.insert(char: "Neg(") }
        }
    }
    
    private var matrixOptions: some View {
        VStack(spacing: 6) {
            optRow(num: "1", title: "Ma trận MatA") { state.document.insert(char: "MatA") }
            optRow(num: "2", title: "Ma trận MatB") { state.document.insert(char: "MatB") }
            optRow(num: "3", title: "Ma trận MatC") { state.document.insert(char: "MatC") }
            optRow(num: "4", title: "Ma trận MatD") { state.document.insert(char: "MatD") }
            optRow(num: "5", title: "Định thức: Det(M)") { state.document.insert(char: "Det(") }
            optRow(num: "6", title: "Chuyển vị: Trn(M)") { state.document.insert(char: "Trn(") }
            optRow(num: "7", title: "Nghịch đảo: M⁻¹") { state.document.insert(char: "^-1") }
        }
    }
    
    private var vectorOptions: some View {
        VStack(spacing: 6) {
            optRow(num: "1", title: "Véctơ VctA") { state.document.insert(char: "VctA") }
            optRow(num: "2", title: "Véctơ VctB") { state.document.insert(char: "VctB") }
            optRow(num: "3", title: "Véctơ VctC") { state.document.insert(char: "VctC") }
            optRow(num: "4", title: "Véctơ VctD") { state.document.insert(char: "VctD") }
            optRow(num: "5", title: "Tích vô hướng (Dot)") { state.document.insert(char: " • ") }
            optRow(num: "6", title: "Góc giữa 2 véctơ (Angle)") { state.document.insert(char: "Angle(") }
            optRow(num: "7", title: "Véctơ đơn vị (UnitV)") { state.document.insert(char: "UnitV(") }
        }
    }
    
    private func optRow(num: String, title: String, action: @escaping () -> Void) -> some View {
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
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(white: 0.2))
            .cornerRadius(8)
        }
    }
}

// MARK: - Scientific Constants Picker View (SHIFT + 7 CONST)
public struct ConstantsPickerView: View {
    @ObservedObject var state: CalculatorState
    @State private var searchText = ""
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    var filtered: [ScientificConstant] {
        if searchText.isEmpty { return ConstantsData.all }
        return ConstantsData.all.filter {
            $0.symbol.localizedCaseInsensitiveContains(searchText) ||
            $0.nameVi.localizedCaseInsensitiveContains(searchText) ||
            $0.nameEn.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.85)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { state.activeOverlay = .none }
            
            VStack(spacing: 10) {
                HStack {
                    Text(state.isVietnamese ? "HẰNG SỐ KHOA HỌC (CONST)" : "SCIENTIFIC CONSTANTS")
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
                
                TextField(state.isVietnamese ? "Tìm ký hiệu hằng số..." : "Search constant...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 16)
                
                ScrollView {
                    LazyVStack(spacing: 6) {
                        ForEach(filtered) { c in
                            Button(action: {
                                state.document.insert(char: String(format: "%g", c.value))
                                state.activeOverlay = .none
                            }) {
                                HStack {
                                    Text(String(format: "%02d", c.id))
                                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                                        .foregroundColor(.yellow)
                                        .frame(width: 24)
                                    Text(c.symbol)
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(width: 44, alignment: .leading)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(state.isVietnamese ? c.nameVi : c.nameEn)
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(.white)
                                        Text(String(format: "%g %@", c.value, c.unit))
                                            .font(.system(size: 11, design: .monospaced))
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color(white: 0.2))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
            .frame(maxWidth: 380, maxHeight: 520)
            .background(Color(red: 0.14, green: 0.16, blue: 0.19))
            .cornerRadius(16)
            .shadow(radius: 20)
            .padding(16)
        }
    }
}

// MARK: - Unit Conversions Picker View (SHIFT + 8 CONV)
public struct ConversionsPickerView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.85)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { state.activeOverlay = .none }
            
            VStack(spacing: 10) {
                HStack {
                    Text(state.isVietnamese ? "ĐỔI ĐƠN VỊ (CONV) [40]" : "UNIT CONVERSIONS [40]")
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
                
                ScrollView {
                    LazyVStack(spacing: 6) {
                        ForEach(ConversionsData.all) { item in
                            Button(action: {
                                if let res = state.currentResult {
                                    let converted = item.convert(res.decimalValue)
                                    state.currentResult = EvaluationResult(
                                        decimalValue: converted,
                                        exactDisplay: MathEvaluator.shared.formatDecimal(converted),
                                        decimalDisplay: MathEvaluator.shared.formatDecimal(converted)
                                    )
                                }
                                state.activeOverlay = .none
                            }) {
                                HStack {
                                    Text(String(format: "%02d", item.id))
                                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                                        .foregroundColor(.yellow)
                                        .frame(width: 28)
                                    Text(item.title)
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(item.category)
                                        .font(.system(size: 11))
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color(white: 0.2))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
            .frame(maxWidth: 380, maxHeight: 520)
            .background(Color(red: 0.14, green: 0.16, blue: 0.19))
            .cornerRadius(16)
            .shadow(radius: 20)
            .padding(16)
        }
    }
}

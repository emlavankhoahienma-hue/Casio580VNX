import SwiftUI

// MARK: - 1:1 Genuine Casio ClassWiz LCD Display (384x126 Framebuffer)
public struct LCDView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        ZStack {
            // Authentic dot matrix LCD background texture (Emulator res 135)
            Image("lcd_bg")
                .resizable(resizingMode: .tile)
                .background(lcdColorTint)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.black.opacity(0.35), lineWidth: 1)
                )
            
            // Screen Content
            if let err = state.activeError {
                errorScreen(err)
            } else {
                switch state.activeOverlay {
                case .menu:
                    MenuGridView(state: state)
                case .setup(let page, let sub):
                    SetupMenuView(state: state, page: page, subCategory: sub)
                case .option(let sub):
                    OptionMenuView(state: state, subCategory: sub)
                case .constPicker(let cat):
                    constPickerScreen(category: cat)
                case .convPicker(let cat, let page):
                    convPickerScreen(category: cat, page: page)
                case .resetMenu(let step):
                    resetMenuScreen(step: step)
                case .solveScreen(let xVal, let lrVal):
                    solveScreen(xVal: xVal, lrVal: lrVal)
                case .calcPrompt(let varName, let curVal):
                    calcPromptScreen(varName: varName, curVal: curVal)
                case .none:
                    VStack(spacing: 0) {
                        // Top Status Bar (Only in normal calculation mode!)
                        statusBar
                            .frame(height: 18)
                            .padding(.horizontal, 8)
                            .padding(.top, 2)
                        
                        Divider()
                            .background(Color.black.opacity(0.12))
                            .padding(.horizontal, 6)
                        
                        // 2D Natural Math Textbook Calculation line & Result
                        normalCalculationScreen
                            .padding(.horizontal, 8)
                            .padding(.bottom, 4)
                    }
                }
            }
        }
        .frame(width: 384, height: 126)
    }
    
    // Tint color modified by Contrast setting
    private var lcdColorTint: Color {
        let base = 0.82 + (state.contrast - 0.5) * 0.12
        return Color(red: base * 0.96, green: base, blue: base * 0.92)
    }
    
    // Authentic Status Bar Indicators
    private var statusBar: some View {
        HStack(spacing: 5) {
            statusBadge(text: "S", isActive: state.isShiftActive)
            statusBadge(text: "A", isActive: state.isAlphaActive)
            statusBadge(text: "M", isActive: state.hasMemoryValue)
            statusBadge(text: "STO", isActive: state.isStoreActive)
            statusBadge(text: "√□/", isActive: true)
            
            Spacer()
            
            // Angle unit
            statusBadge(text: state.angleUnit.rawValue, isActive: true)
            
            if state.currentMode == .complex {
                statusBadge(text: "𝒊", isActive: true)
            }
            if state.currentMode == .matrix {
                statusBadge(text: "MAT", isActive: true)
            }
            if state.currentMode == .vector {
                statusBadge(text: "VCT", isActive: true)
            }
            if state.currentMode == .baseN {
                statusBadge(text: state.baseNRadix.rawValue, isActive: true)
            }
            
            if !state.history.isEmpty {
                Text("▲▼")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.85))
            }
        }
    }
    
    private func statusBadge(text: String, isActive: Bool) -> some View {
        Text(text)
            .font(.system(size: 10, weight: .bold, design: .monospaced))
            .foregroundColor(isActive ? Color.black : Color.black.opacity(0.12))
            .padding(.horizontal, 1)
    }
    
    // Normal Math Calculation Screen
    private var normalCalculationScreen: some View {
        VStack(alignment: .leading, spacing: 2) {
            // Natural Textbook 2D Formula line
            ScrollView(.horizontal, showsIndicators: false) {
                MathNodeSequenceView(
                    nodes: state.document.nodes,
                    cursorIndex: state.document.cursorIndex,
                    emptyPlaceholder: ""
                )
                .frame(minHeight: 46, alignment: .leading)
            }
            
            Spacer()
            
            // Result Display line (aligned bottom-right)
            HStack {
                Spacer()
                if let res = state.currentResult {
                    resultText(for: res)
                        .font(.system(size: 21, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.black.opacity(0.92))
                }
            }
        }
    }
    
    @ViewBuilder
    private func resultText(for res: EvaluationResult) -> some View {
        switch state.resultStyle {
        case .exact:
            if let rem = res.remainderDisplay {
                Text(rem)
            } else {
                Text(res.exactDisplay)
            }
        case .decimal:
            Text(res.decimalDisplay)
        case .dms:
            Text(res.dmsDisplay)
        case .primeFact:
            Text(res.primeFactDisplay ?? res.decimalDisplay)
        }
    }
    
    // Casio Error Screen
    private func errorScreen(_ err: CasioError) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(state.isVietnamese ? err.titleVi : err.titleEn)
                .font(.system(size: 15, weight: .bold, design: .monospaced))
                .foregroundColor(Color.black)
            
            Spacer()
            
            HStack {
                Text("[AC]")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Text(state.isVietnamese ? " :Hủy" : " :Cancel")
                    .font(.system(size: 12, design: .monospaced))
                
                Spacer()
                
                Text("[◄][►]")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Text(state.isVietnamese ? ":Đến" : ":Goto")
                    .font(.system(size: 12, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.85))
        }
        .padding(10)
    }
    
    // SOLVE Screen
    private func solveScreen(xVal: String, lrVal: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("x =")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                Spacer()
                Text(xVal)
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
            }
            HStack {
                Text("L - R =")
                    .font(.system(size: 13, design: .monospaced))
                Spacer()
                Text(lrVal)
                    .font(.system(size: 13, design: .monospaced))
            }
            Spacer()
            HStack {
                Text("[◄][►]: " + (state.isVietnamese ? "Quay lại" : "Back"))
                    .font(.system(size: 10, design: .monospaced))
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Thoát" : "Cancel"))
                    .font(.system(size: 10, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.7))
        }
        .padding(10)
    }
    
    // CALC Prompt Screen
    private func calcPromptScreen(varName: String, curVal: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("\(varName)?")
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
            
            HStack {
                Spacer()
                Text(curVal)
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 2, height: 16)
            }
            
            Spacer()
            
            HStack {
                Text("[=]: " + (state.isVietnamese ? "Tiếp" : "Next"))
                    .font(.system(size: 10, design: .monospaced))
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Hủy" : "Cancel"))
                    .font(.system(size: 10, design: .monospaced))
            }
            .foregroundColor(Color.black.opacity(0.7))
        }
        .padding(10)
    }
    
    // Scientific Constants Picker Screen
    @ViewBuilder
    private func constPickerScreen(category: Int?) -> some View {
        if let cat = category {
            let catName: String = {
                switch cat {
                case 1: return "Universal"
                case 2: return "Electromagnetic"
                case 3: return "Atomic & Nuclear"
                default: return "Physico-Chemical"
                }
            }()
            let matching = ConstantsData.all.filter {
                if cat == 1 { return $0.category == "Universal" }
                if cat == 2 { return $0.category == "Electromagnetic" }
                if cat == 3 { return $0.category == "Atomic & Nuclear" }
                return $0.category == "Physico-Chemical" || $0.category == "Adopted"
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(catName)
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.6))
                
                HStack(spacing: 12) {
                    ForEach(0..<min(4, matching.count), id: \.self) { idx in
                        let c = matching[idx]
                        Button(action: {
                            state.document.insert(char: c.symbol)
                            state.activeOverlay = .none
                        }) {
                            Text("\(idx + 1):\(c.symbol)")
                                .font(.system(size: 12, weight: .bold, design: .monospaced))
                                .foregroundColor(.black)
                        }
                    }
                }
                
                if matching.count > 4 {
                    HStack(spacing: 12) {
                        ForEach(4..<min(8, matching.count), id: \.self) { idx in
                            let c = matching[idx]
                            Button(action: {
                                state.document.insert(char: c.symbol)
                                state.activeOverlay = .none
                            }) {
                                Text("\(idx + 1):\(c.symbol)")
                                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Quay lại" : "Back"))
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
            }
            .padding(10)
        } else {
            VStack(alignment: .leading, spacing: 4) {
                Text(state.isVietnamese ? "HẰNG SỐ KHOA HỌC (CONST)" : "SCIENTIFIC CONST (CONST)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.6))
                
                HStack(spacing: 16) {
                    Button(action: { state.activeOverlay = .constPicker(category: 1) }) { Text("1:Universal") }
                    Button(action: { state.activeOverlay = .constPicker(category: 2) }) { Text("2:Electromag") }
                }
                HStack(spacing: 16) {
                    Button(action: { state.activeOverlay = .constPicker(category: 3) }) { Text("3:Atomic&Nuc") }
                    Button(action: { state.activeOverlay = .constPicker(category: 4) }) { Text("4:Phys-Chem") }
                }
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Hủy" : "Cancel"))
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
            }
            .font(.system(size: 12, weight: .bold, design: .monospaced))
            .foregroundColor(.black)
            .padding(10)
        }
    }
    
    // Unit Conversions Picker Screen
    @ViewBuilder
    private func convPickerScreen(category: Int?, page: Int) -> some View {
        if let cat = category {
            let cats = ["Length", "Area", "Volume", "Mass", "Power", "Pressure", "Energy", "Temperature"]
            let catName = (cat >= 1 && cat <= cats.count) ? cats[cat - 1] : "Length"
            let list = ConversionsData.all.filter { $0.category == catName }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(catName)
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.6))
                
                ForEach(0..<min(3, list.count), id: \.self) { idx in
                    let item = list[idx]
                    Button(action: {
                        if let res = state.currentResult {
                            let newVal = item.convert(res.decimalValue)
                            state.currentResult = EvaluationResult(
                                decimalValue: newVal,
                                exactDisplay: MathEvaluator.shared.formatDecimal(newVal),
                                decimalDisplay: MathEvaluator.shared.formatDecimal(newVal),
                                dmsDisplay: MathEvaluator.toDMSString(newVal)
                            )
                        } else {
                            state.document.insert(char: item.title)
                        }
                        state.activeOverlay = .none
                    }) {
                        Text("\(idx + 1): \(item.title)")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                    }
                }
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Quay lại" : "Back"))
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
            }
            .padding(10)
        } else {
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text(state.isVietnamese ? "ĐỔI ĐƠN VỊ (CONV)" : "CONVERSIONS (CONV)")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.black.opacity(0.6))
                    Spacer()
                    Text(page == 1 ? "▼" : "▲")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                }
                
                if page == 1 {
                    HStack(spacing: 16) {
                        Button(action: { state.activeOverlay = .convPicker(category: 1, page: 1) }) { Text("1:Length") }
                        Button(action: { state.activeOverlay = .convPicker(category: 2, page: 1) }) { Text("2:Area") }
                    }
                    HStack(spacing: 16) {
                        Button(action: { state.activeOverlay = .convPicker(category: 3, page: 1) }) { Text("3:Volume") }
                        Button(action: { state.activeOverlay = .convPicker(category: 4, page: 1) }) { Text("4:Mass") }
                    }
                } else {
                    HStack(spacing: 16) {
                        Button(action: { state.activeOverlay = .convPicker(category: 5, page: 2) }) { Text("1:Power") }
                        Button(action: { state.activeOverlay = .convPicker(category: 6, page: 2) }) { Text("2:Pressure") }
                    }
                    HStack(spacing: 16) {
                        Button(action: { state.activeOverlay = .convPicker(category: 7, page: 2) }) { Text("3:Energy") }
                        Button(action: { state.activeOverlay = .convPicker(category: 8, page: 2) }) { Text("4:Temp") }
                    }
                }
                Spacer()
                Text("[AC]: " + (state.isVietnamese ? "Hủy" : "Cancel"))
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
            }
            .font(.system(size: 12, weight: .bold, design: .monospaced))
            .foregroundColor(.black)
            .padding(10)
        }
    }
    
    // Reset Menu Screen
    @ViewBuilder
    private func resetMenuScreen(step: ResetStep) -> some View {
        switch step {
        case .initial:
            VStack(alignment: .leading, spacing: 4) {
                Text(state.isVietnamese ? "Khởi tạo? (Reset?)" : "Reset?")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.7))
                
                Button(action: { state.activeOverlay = .resetMenu(step: .completed) }) {
                    Text("1: " + (state.isVietnamese ? "Thiết lập (Setup Data)" : "Setup Data"))
                }
                Button(action: { state.activeOverlay = .resetMenu(step: .completed) }) {
                    Text("2: " + (state.isVietnamese ? "Bộ nhớ (Memory)" : "Memory"))
                }
                Button(action: { state.activeOverlay = .resetMenu(step: .confirmAll) }) {
                    Text("3: " + (state.isVietnamese ? "Tất cả (Initialize All)" : "Initialize All"))
                }
                Spacer()
            }
            .font(.system(size: 12, weight: .bold, design: .monospaced))
            .foregroundColor(.black)
            .padding(10)
            
        case .confirmAll:
            VStack(alignment: .leading, spacing: 4) {
                Text(state.isVietnamese ? "Khởi tạo tất cả?" : "Initialize All?")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack {
                    Text("[=]")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                    Text(state.isVietnamese ? " :Có (Yes)" : " :Yes")
                        .font(.system(size: 12, design: .monospaced))
                    
                    Spacer()
                    
                    Text("[AC]")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                    Text(state.isVietnamese ? " :Hủy (Cancel)" : " :Cancel")
                        .font(.system(size: 12, design: .monospaced))
                }
                .foregroundColor(Color.black.opacity(0.85))
            }
            .padding(10)
            
        case .completed:
            VStack(alignment: .leading, spacing: 4) {
                Text(state.isVietnamese ? "Đã khởi tạo xong (Reset All)" : "Reset Complete")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(state.isVietnamese ? "Bấm phím [AC]" : "Press [AC] key")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.85))
            }
            .padding(10)
        }
    }
}

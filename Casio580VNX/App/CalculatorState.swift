import Foundation
import SwiftUI
import Combine

public enum CalculatorMode: Int, CaseIterable, Identifiable {
    case calculate = 1
    case complex = 2
    case baseN = 3
    case matrix = 4
    case vector = 5
    case statistics = 6
    case distribution = 7
    case spreadsheet = 8
    case table = 9
    case equation = 10
    case inequality = 11
    case ratio = 12
    
    public var id: Int { rawValue }
    
    public var symbolText: String {
        switch self {
        case .equation: return "A"
        case .inequality: return "B"
        case .ratio: return "C"
        default: return "\(rawValue)"
        }
    }
    
    public var titleVi: String {
        switch self {
        case .calculate: return "1: Tính toán"
        case .complex: return "2: Số phức"
        case .baseN: return "3: Hệ cơ số N"
        case .matrix: return "4: Ma trận"
        case .vector: return "5: Véctơ"
        case .statistics: return "6: Thống kê"
        case .distribution: return "7: Phân phối"
        case .spreadsheet: return "8: Bảng tính"
        case .table: return "9: Bảng giá trị"
        case .equation: return "A: PT / Hệ PT"
        case .inequality: return "B: Bất PT"
        case .ratio: return "C: Tỷ lệ thức"
        }
    }
    
    public var titleEn: String {
        switch self {
        case .calculate: return "1: Calculate"
        case .complex: return "2: Complex"
        case .baseN: return "3: Base-N"
        case .matrix: return "4: Matrix"
        case .vector: return "5: Vector"
        case .statistics: return "6: Statistics"
        case .distribution: return "7: Distribution"
        case .spreadsheet: return "8: Spreadsheet"
        case .table: return "9: Table"
        case .equation: return "A: Equation/Func"
        case .inequality: return "B: Inequality"
        case .ratio: return "C: Ratio"
        }
    }
    
    public var iconAsset: String {
        "menu_icon_\(rawValue)"
    }
}

public enum BaseNRadix: String, CaseIterable {
    case dec = "DEC"
    case hex = "HEX"
    case bin = "BIN"
    case oct = "OCT"
}

public enum DisplayResultStyle {
    case exact
    case decimal
    case dms
    case primeFact
}

public enum SetupSubCategory: Equatable {
    case angleUnit
    case language
    case contrast
}

public enum OptionSubCategory: Equatable {
    case hyperbolic
    case angleUnit
    case engineerSymbol
}

public enum ResetStep: Equatable {
    case initial
    case confirmAll
    case completed
}

public enum ActiveOverlay: Equatable {
    case none
    case menu(highlightedMode: CalculatorMode)
    case setup(page: Int, subCategory: SetupSubCategory?)
    case option(subCategory: OptionSubCategory?)
    case constPicker(category: Int?)
    case convPicker(category: Int?, page: Int)
    case resetMenu(step: ResetStep)
    case calcPrompt(varName: String, enteredValue: String)
    case solveScreen(xVal: String, lrVal: String)
}

public class CalculatorState: ObservableObject {
    @Published public var currentMode: CalculatorMode = .calculate
    
    // Status indicators
    @Published public var isShiftActive: Bool = false
    @Published public var isAlphaActive: Bool = false
    @Published public var isStoreActive: Bool = false
    @Published public var isRecallActive: Bool = false
    @Published public var hasMemoryValue: Bool = false
    @Published public var angleUnit: MathEvaluator.AngleUnit = .degree
    @Published public var baseNRadix: BaseNRadix = .dec
    @Published public var isVietnamese: Bool = true
    @Published public var contrast: Double = 0.5 // 0.0 to 1.0
    
    // Mathematical document & result
    @Published public var document = MathDocument()
    @Published public var currentResult: EvaluationResult? = nil
    @Published public var resultStyle: DisplayResultStyle = .exact
    @Published public var activeError: CasioError? = nil
    @Published public var activeOverlay: ActiveOverlay = .none
    
    // Calculation history
    @Published public var history: [(doc: [MathNode], res: EvaluationResult)] = []
    @Published public var historyIndex: Int = -1
    
    // Matrices & Vectors storage
    @Published public var matrices: [String: CasioMatrix] = [
        "MatA": CasioMatrix(rows: 2, cols: 2),
        "MatB": CasioMatrix(rows: 2, cols: 2),
        "MatC": CasioMatrix(rows: 2, cols: 2),
        "MatD": CasioMatrix(rows: 2, cols: 2)
    ]
    @Published public var vectors: [String: CasioVector] = [
        "VctA": CasioVector(dim: 3),
        "VctB": CasioVector(dim: 3),
        "VctC": CasioVector(dim: 3),
        "VctD": CasioVector(dim: 3)
    ]
    
    // CALC mode prompt tracking
    private var calcVariablesNeeded: [String] = []
    private var calcCurrentIndex: Int = 0
    
    public init() {}
    
    // MARK: - Key Press Dispatcher
    public func handleKeyPress(key: CasioKey) {
        // Haptic feedback
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        // Error state handling
        if let err = activeError {
            if key == .ac {
                activeError = nil
            } else if key == .left || key == .right {
                activeError = nil
                if case .syntaxError(let idx) = err {
                    document.cursorIndex = min(document.nodes.count, max(0, idx))
                }
            }
            return
        }
        
        // If an overlay is active, handle overlay navigation
        if activeOverlay != .none {
            handleOverlayKey(key: key)
            return
        }
        
        // Handle SHIFT / ALPHA activation
        if key == .shift {
            isShiftActive.toggle()
            isAlphaActive = false
            return
        }
        if key == .alpha {
            isAlphaActive.toggle()
            isShiftActive = false
            return
        }
        
        // STO / RCL
        if isShiftActive && key == .sto { // RCL
            isRecallActive = true
            isShiftActive = false
            return
        }
        if key == .sto {
            isStoreActive = true
            return
        }
        
        // Mode & Setup keys
        if key == .menu {
            if isShiftActive {
                isShiftActive = false
                activeOverlay = .setup(page: 1, subCategory: nil)
            } else {
                activeOverlay = .menu(highlightedMode: currentMode)
            }
            return
        }
        if key == .on {
            resetCurrentScreen()
            return
        }
        if key == .optn {
            activeOverlay = .option(subCategory: nil)
            return
        }
        
        // CALC & SOLVE keys
        if key == .calc {
            if isShiftActive { // SHIFT + CALC = SOLVE
                isShiftActive = false
                triggerSolve()
            } else { // CALC
                triggerCalc()
            }
            return
        }
        
        // CONST & CONV & RESET keys
        if isShiftActive && key == .seven { // CONST
            isShiftActive = false
            activeOverlay = .constPicker(category: nil)
            return
        }
        if isShiftActive && key == .eight { // CONV
            isShiftActive = false
            activeOverlay = .convPicker(category: nil, page: 1)
            return
        }
        if isShiftActive && key == .nine { // RESET
            isShiftActive = false
            activeOverlay = .resetMenu(step: .initial)
            return
        }
        
        // FACT (SHIFT + ° ' '')
        if isShiftActive && key == .dms {
            isShiftActive = false
            if let res = currentResult, res.primeFactDisplay != nil {
                resultStyle = (resultStyle == .primeFact) ? .exact : .primeFact
            }
            return
        }
        
        // S<=>D Toggle
        if key == .sd {
            cycleResultStyle()
            return
        }
        
        // Directional keys (REPLAY D-Pad)
        if key == .left {
            document.moveLeft()
            return
        }
        if key == .right {
            document.moveRight()
            return
        }
        if key == .up {
            navigateHistory(offset: -1)
            return
        }
        if key == .down {
            navigateHistory(offset: 1)
            return
        }
        
        // AC / DEL
        if key == .ac {
            if isShiftActive { // OFF
                isShiftActive = false
                resetCurrentScreen()
            } else {
                document.clear()
                currentResult = nil
            }
            return
        }
        if key == .del {
            if isShiftActive { // INS (Insert mode toggle)
                isShiftActive = false
            } else {
                document.deleteBackward()
            }
            return
        }
        
        // Execute =
        if key == .equals {
            evaluateCurrentExpression()
            return
        }
        
        // Variable Assignment (when STO or RCL is active)
        if isStoreActive || isRecallActive {
            if let varName = key.variableName {
                if isStoreActive {
                    if let res = currentResult {
                        MathEvaluator.shared.variables[varName] = res.decimalValue
                        if varName == "M" { hasMemoryValue = res.decimalValue != 0 }
                    }
                    isStoreActive = false
                } else if isRecallActive {
                    document.insert(char: varName)
                    isRecallActive = false
                }
                return
            }
        }
        
        // General Node / Character Insertion
        insertFromKey(key: key)
        
        // Reset shift / alpha after one use
        isShiftActive = false
        isAlphaActive = false
    }
    
    private func insertFromKey(key: CasioKey) {
        if isShiftActive {
            switch key {
            case .fraction: // Hỗn số
                document.insertNode(.mixedFrac(whole: [], num: [], den: []))
            case .sqrt: // Căn bậc 3
                document.insertNode(.nRoot(n: [.char(symbol: "3")], radicand: []))
            case .power: // Căn bậc n
                document.insertNode(.nRoot(n: [], radicand: []))
            case .log: // 10^x
                document.insertNode(.power(base: [.char(symbol: "1", tag: ""), .char(symbol: "0", tag: "")], exp: []))
            case .ln: // e^x
                document.insertNode(.power(base: [.char(symbol: "e")], exp: []))
            case .integral: // d/dx
                document.insertNode(.derivative(expr: [], at: []))
            case .logBase: // Summation Σ
                document.insertNode(.sum(expr: [], lower: [], upper: []))
            case .xMinus1: // x!
                document.insert(char: "!")
            case .sin: document.insert(char: "asin(")
            case .cos: document.insert(char: "acos(")
            case .tan: document.insert(char: "atan(")
            case .hyp: document.insert(char: "asinh(")
            case .leftParen: document.insert(char: "%")
            case .rightParen: document.insert(char: ",")
            case .times: document.insert(char: "P") // nPr
            case .divide: document.insert(char: "C") // nCr
            case .plus: document.insert(char: "Pol(")
            case .minus: document.insert(char: "Rec(")
            case .exp: document.insert(char: "π")
            case .dot: document.insert(char: "Ran#")
            default: break
            }
            return
        }
        
        if isAlphaActive {
            if let varName = key.variableName {
                document.insert(char: varName)
                return
            }
            if key == .divide { // ÷R
                document.insert(char: "÷R")
                return
            }
            if key == .calc { // '=' in expression (for SOLVE)
                document.insert(char: "=")
                return
            }
            if key == .integral { // Product ∏
                document.insertNode(.product(expr: [], lower: [], upper: []))
                return
            }
            if key == .dot { // RanInt#
                document.insert(char: "RanInt#(")
                return
            }
            return
        }
        
        // Normal Key Presses
        switch key {
        case .zero: document.insert(char: "0")
        case .one: document.insert(char: "1")
        case .two: document.insert(char: "2")
        case .three: document.insert(char: "3")
        case .four: document.insert(char: "4")
        case .five: document.insert(char: "5")
        case .six: document.insert(char: "6")
        case .seven: document.insert(char: "7")
        case .eight: document.insert(char: "8")
        case .nine: document.insert(char: "9")
        case .dot: document.insert(char: ".")
        case .exp: document.insert(char: "×10^", tag: "pow10")
        case .ans: document.insert(char: "Ans")
            
        case .plus: document.insert(char: "+")
        case .minus: document.insert(char: "−")
        case .times: document.insert(char: "×")
        case .divide: document.insert(char: "÷")
            
        case .fraction: document.insertNode(.fraction(num: [], den: []))
        case .sqrt: document.insertNode(.sqrt(radicand: []))
        case .xSquared: document.insertNode(.power(base: [], exp: [.char(symbol: "2")]))
        case .power: document.insertNode(.power(base: [], exp: []))
        case .logBase: document.insertNode(.logBase(base: [], arg: []))
        case .log: document.insert(char: "log(")
        case .ln: document.insert(char: "ln(")
        case .integral: document.insertNode(.integral(expr: [], lower: [], upper: []))
        case .xMinus1: document.insert(char: "^-1")
            
        case .sin: document.insert(char: "sin(")
        case .cos: document.insert(char: "cos(")
        case .tan: document.insert(char: "tan(")
        case .hyp: document.insert(char: "sinh(")
        case .dms: document.insert(char: "°")
        case .neg: document.insert(char: "-")
        case .leftParen: document.insert(char: "(")
        case .rightParen: document.insert(char: ")")
        case .eng: document.insert(char: "E")
        case .mPlus:
            if let res = currentResult {
                MathEvaluator.shared.variables["M", default: 0.0] += res.decimalValue
                hasMemoryValue = MathEvaluator.shared.variables["M"] != 0
            }
        default: break
        }
    }
    
    // Evaluate current document
    public func evaluateCurrentExpression() {
        let res = MathEvaluator.shared.evaluate(document: document)
        currentResult = res
        if res.isError {
            activeError = res.error ?? .mathError
        } else {
            resultStyle = .exact
            history.append((doc: document.nodes, res: res))
            historyIndex = history.count
        }
    }
    
    // S<=>D cycle: Exact -> Decimal -> DMS -> PrimeFact (if available) -> Exact
    public func cycleResultStyle() {
        guard let res = currentResult else { return }
        switch resultStyle {
        case .exact:
            resultStyle = .decimal
        case .decimal:
            resultStyle = .dms
        case .dms:
            if res.primeFactDisplay != nil {
                resultStyle = .primeFact
            } else {
                resultStyle = .exact
            }
        case .primeFact:
            resultStyle = .exact
        }
    }
    
    // SOLVE Feature (SHIFT + CALC)
    private func triggerSolve() {
        let rawStr = document.toEvalString()
        guard !rawStr.isEmpty else { return }
        do {
            let solveRes = try EquationSolver.solveEquation(expression: rawStr, initialGuess: 0.0, evaluator: MathEvaluator.shared)
            let xStr = MathEvaluator.shared.formatDecimal(solveRes.x)
            let lrStr = String(format: "%g", solveRes.leftMinusRight)
            activeOverlay = .solveScreen(xVal: xStr, lrVal: lrStr)
        } catch let err as CasioError {
            activeError = err
        } catch {
            activeError = .cantSolve
        }
    }
    
    // CALC Feature
    private func triggerCalc() {
        let rawStr = document.toEvalString()
        let knownVars = ["A", "B", "C", "D", "E", "F", "x", "y"]
        calcVariablesNeeded = knownVars.filter { rawStr.contains($0) }
        guard !calcVariablesNeeded.isEmpty else {
            evaluateCurrentExpression()
            return
        }
        calcCurrentIndex = 0
        promptNextVariable()
    }
    
    private func promptNextVariable() {
        if calcCurrentIndex < calcVariablesNeeded.count {
            let v = calcVariablesNeeded[calcCurrentIndex]
            let curVal = String(format: "%g", MathEvaluator.shared.variables[v] ?? 0.0)
            activeOverlay = .calcPrompt(varName: v, enteredValue: curVal)
        } else {
            activeOverlay = .none
            evaluateCurrentExpression()
        }
    }
    
    public func submitCalcVariable(value: Double) {
        if calcCurrentIndex < calcVariablesNeeded.count {
            let v = calcVariablesNeeded[calcCurrentIndex]
            MathEvaluator.shared.variables[v] = value
            calcCurrentIndex += 1
            promptNextVariable()
        }
    }
    
    // MARK: - LCD Overlay Key Dispatcher (100% Genuine Casio Navigation)
    private func handleOverlayKey(key: CasioKey) {
        switch activeOverlay {
        case .menu(let highlighted):
            if key == .left {
                var prev = highlighted.rawValue - 1
                if prev < 1 { prev = 12 }
                activeOverlay = .menu(highlightedMode: CalculatorMode(rawValue: prev)!)
            } else if key == .right {
                var next = highlighted.rawValue + 1
                if next > 12 { next = 1 }
                activeOverlay = .menu(highlightedMode: CalculatorMode(rawValue: next)!)
            } else if key == .up {
                var up = highlighted.rawValue - 4
                if up < 1 { up += 12 }
                activeOverlay = .menu(highlightedMode: CalculatorMode(rawValue: up)!)
            } else if key == .down {
                var down = highlighted.rawValue + 4
                if down > 12 { down -= 12 }
                activeOverlay = .menu(highlightedMode: CalculatorMode(rawValue: down)!)
            } else if key == .equals {
                currentMode = highlighted
                activeOverlay = .none
                resetCurrentScreen()
            } else if let num = key.menuNumber, let newMode = CalculatorMode(rawValue: num) {
                currentMode = newMode
                activeOverlay = .none
                resetCurrentScreen()
            } else if key == .ac {
                activeOverlay = .none
            }
            
        case .setup(let page, let sub):
            if let s = sub {
                switch s {
                case .angleUnit:
                    if key == .one { angleUnit = .degree; activeOverlay = .none }
                    else if key == .two { angleUnit = .radian; activeOverlay = .none }
                    else if key == .three { angleUnit = .gradian; activeOverlay = .none }
                    else if key == .ac { activeOverlay = .setup(page: 1, subCategory: nil) }
                case .language:
                    if key == .one { isVietnamese = true; activeOverlay = .none }
                    else if key == .two { isVietnamese = false; activeOverlay = .none }
                    else if key == .ac { activeOverlay = .setup(page: 4, subCategory: nil) }
                case .contrast:
                    if key == .left { contrast = max(0.0, contrast - 0.08) }
                    else if key == .right { contrast = min(1.0, contrast + 0.08) }
                    else if key == .ac || key == .equals { activeOverlay = .none }
                }
            } else {
                if key == .down && page < 4 {
                    activeOverlay = .setup(page: page + 1, subCategory: nil)
                } else if key == .up && page > 1 {
                    activeOverlay = .setup(page: page - 1, subCategory: nil)
                } else if key == .one {
                    if page == 1 { activeOverlay = .setup(page: 1, subCategory: .angleUnit) }
                } else if key == .two {
                    if page == 1 { activeOverlay = .setup(page: 1, subCategory: .angleUnit) }
                } else if key == .three {
                    if page == 4 { activeOverlay = .setup(page: 4, subCategory: .language) }
                } else if key == .four {
                    if page == 4 { activeOverlay = .setup(page: 4, subCategory: .contrast) }
                } else if key == .ac {
                    activeOverlay = .none
                }
            }
            
        case .option(let sub):
            if let s = sub {
                switch s {
                case .hyperbolic:
                    if key == .one { document.insert(char: "sinh("); activeOverlay = .none }
                    else if key == .two { document.insert(char: "cosh("); activeOverlay = .none }
                    else if key == .three { document.insert(char: "tanh("); activeOverlay = .none }
                    else if key == .four { document.insert(char: "asinh("); activeOverlay = .none }
                    else if key == .five { document.insert(char: "acosh("); activeOverlay = .none }
                    else if key == .six { document.insert(char: "atanh("); activeOverlay = .none }
                    else if key == .ac { activeOverlay = .option(subCategory: nil) }
                case .angleUnit:
                    if key == .one { document.insert(char: "°"); activeOverlay = .none }
                    else if key == .two { document.insert(char: "r"); activeOverlay = .none }
                    else if key == .three { document.insert(char: "g"); activeOverlay = .none }
                    else if key == .ac { activeOverlay = .option(subCategory: nil) }
                case .engineerSymbol:
                    if key == .one { document.insert(char: "m"); activeOverlay = .none }
                    else if key == .two { document.insert(char: "μ"); activeOverlay = .none }
                    else if key == .three { document.insert(char: "k"); activeOverlay = .none }
                    else if key == .four { document.insert(char: "M"); activeOverlay = .none }
                    else if key == .ac { activeOverlay = .option(subCategory: nil) }
                }
            } else {
                if key == .one {
                    activeOverlay = .option(subCategory: .hyperbolic)
                } else if key == .two {
                    activeOverlay = .option(subCategory: .angleUnit)
                } else if key == .three {
                    activeOverlay = .option(subCategory: .engineerSymbol)
                } else if key == .ac {
                    activeOverlay = .none
                }
            }
            
        case .constPicker(let category):
            if let cat = category {
                if key == .ac {
                    activeOverlay = .constPicker(category: nil)
                } else if let num = key.menuNumber {
                    let matching = ConstantsData.all.filter {
                        if cat == 1 { return $0.category == "Universal" }
                        if cat == 2 { return $0.category == "Electromagnetic" }
                        if cat == 3 { return $0.category == "Atomic & Nuclear" }
                        return $0.category == "Physico-Chemical" || $0.category == "Adopted"
                    }
                    if num >= 1 && num <= matching.count {
                        let c = matching[num - 1]
                        document.insert(char: c.symbol)
                        activeOverlay = .none
                    }
                }
            } else {
                if key == .one { activeOverlay = .constPicker(category: 1) }
                else if key == .two { activeOverlay = .constPicker(category: 2) }
                else if key == .three { activeOverlay = .constPicker(category: 3) }
                else if key == .four { activeOverlay = .constPicker(category: 4) }
                else if key == .ac { activeOverlay = .none }
            }
            
        case .convPicker(let category, let page):
            if let cat = category {
                if key == .ac {
                    activeOverlay = .convPicker(category: nil, page: page)
                } else if let num = key.menuNumber {
                    let cats = ["Length", "Area", "Volume", "Mass", "Power", "Pressure", "Energy", "Temperature"]
                    let catName = (cat >= 1 && cat <= cats.count) ? cats[cat - 1] : "Length"
                    let list = ConversionsData.all.filter { $0.category == catName }
                    if num >= 1 && num <= list.count {
                        let conv = list[num - 1]
                        if let res = currentResult {
                            let newVal = conv.convert(res.decimalValue)
                            currentResult = EvaluationResult(
                                exactDisplay: MathEvaluator.shared.formatDecimal(newVal),
                                decimalDisplay: MathEvaluator.shared.formatDecimal(newVal),
                                decimalValue: newVal,
                                dmsDisplay: MathEvaluator.shared.formatDMS(newVal)
                            )
                        } else {
                            document.insert(char: conv.title)
                        }
                        activeOverlay = .none
                    }
                }
            } else {
                if key == .down && page < 2 {
                    activeOverlay = .convPicker(category: nil, page: page + 1)
                } else if key == .up && page > 1 {
                    activeOverlay = .convPicker(category: nil, page: page - 1)
                } else if let num = key.menuNumber {
                    let catIndex = (page - 1) * 4 + num
                    activeOverlay = .convPicker(category: catIndex, page: page)
                } else if key == .ac {
                    activeOverlay = .none
                }
            }
            
        case .resetMenu(let step):
            switch step {
            case .initial:
                if key == .one || key == .two {
                    activeOverlay = .resetMenu(step: .completed)
                } else if key == .three {
                    activeOverlay = .resetMenu(step: .confirmAll)
                } else if key == .ac {
                    activeOverlay = .none
                }
            case .confirmAll:
                if key == .equals {
                    resetCurrentScreen()
                    MathEvaluator.shared.variables.removeAll()
                    activeOverlay = .resetMenu(step: .completed)
                } else if key == .ac {
                    activeOverlay = .none
                }
            case .completed:
                if key == .ac {
                    activeOverlay = .none
                }
            }
            
        case .calcPrompt(let varName, let curVal):
            if key == .equals {
                if let v = Double(curVal) {
                    submitCalcVariable(value: v)
                } else {
                    submitCalcVariable(value: 0.0)
                }
            } else if key == .ac {
                activeOverlay = .none
            } else if let n = key.menuNumber {
                let updated = (curVal == "0") ? "\(n)" : curVal + "\(n)"
                activeOverlay = .calcPrompt(varName: varName, enteredValue: updated)
            } else if key == .dot {
                if !curVal.contains(".") {
                    activeOverlay = .calcPrompt(varName: varName, enteredValue: curVal + ".")
                }
            } else if key == .del {
                var updated = curVal
                if !updated.isEmpty { updated.removeLast() }
                if updated.isEmpty { updated = "0" }
                activeOverlay = .calcPrompt(varName: varName, enteredValue: updated)
            }
            
        case .solveScreen:
            if key == .ac || key == .equals || key == .left || key == .right {
                activeOverlay = .none
            }
        default:
            if key == .ac { activeOverlay = .none }
        }
    }
    
    private func navigateHistory(offset: Int) {
        guard !history.isEmpty else { return }
        let newIdx = historyIndex + offset
        if newIdx >= 0 && newIdx < history.count {
            historyIndex = newIdx
            document.nodes = history[newIdx].doc
            document.cursorIndex = document.nodes.count
            currentResult = history[newIdx].res
        }
    }
    
    public func resetCurrentScreen() {
        document.clear()
        currentResult = nil
        activeError = nil
        activeOverlay = .none
        isShiftActive = false
        isAlphaActive = false
        isStoreActive = false
        isRecallActive = false
    }
}

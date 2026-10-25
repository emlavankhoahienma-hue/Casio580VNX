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
    case equation = 9
    case inequality = 10
    case ratio = 11
    case table = 12
    
    public var id: Int { rawValue }
    
    public var symbolText: String {
        switch self {
        case .inequality: return "A"
        case .ratio: return "B"
        case .table: return "C"
        default: return "\(rawValue)"
        }
    }
    
    public var titleVi: String {
        switch self {
        case .calculate: return "1:Ptính thường"
        case .complex: return "2:Số phức"
        case .baseN: return "3:Hệ đếm cơ số"
        case .matrix: return "4:Ma trận"
        case .vector: return "5:Véctơ"
        case .statistics: return "6:Thống kê"
        case .distribution: return "7:Phân phối"
        case .spreadsheet: return "8:Bảng tính"
        case .equation: return "9:Ptrình/HệPtrình"
        case .inequality: return "A:Bất phương trình"
        case .ratio: return "B:Tỷ lệ thức"
        case .table: return "C:Bảng giá trị"
        }
    }
    
    public var titleEn: String {
        switch self {
        case .calculate: return "1:Calculate"
        case .complex: return "2:Complex"
        case .baseN: return "3:Base-N"
        case .matrix: return "4:Matrix"
        case .vector: return "5:Vector"
        case .statistics: return "6:Statistics"
        case .distribution: return "7:Distribution"
        case .spreadsheet: return "8:Spreadsheet"
        case .equation: return "9:Equation/Func"
        case .inequality: return "A:Inequality"
        case .ratio: return "B:Ratio"
        case .table: return "C:Table"
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
    
    // Mode 9: Equation Mode State
    @Published public var eqType: Int = 0 // 0: select (1: Simult, 2: Poly), 1: Simult, 2: Poly
    @Published public var eqSubChoice: Int = 0 // Simult: 2..4 unknowns. Poly: 2..4 degree.
    @Published public var eqCoeffs: [[Double]] = []
    @Published public var eqCursorRow: Int = 0
    @Published public var eqCursorCol: Int = 0
    @Published public var eqInputBuf: String = ""
    @Published public var eqSimultRoots: [String: Double]? = nil
    @Published public var eqPolyResult: EquationSolver.PolynomialResult? = nil
    @Published public var eqRootViewIdx: Int = 0
    
    // Mode 10: Inequality Mode State
    @Published public var ineqDegree: Int = 0 // 0: select (2..4), 2: Degree 2
    @Published public var ineqForm: Int = 0 // 1: >, 2: <, 3: >=, 4: <=
    @Published public var ineqCoeffs: [Double] = [1.0, 0.0, 0.0]
    @Published public var ineqCursorIdx: Int = 0
    @Published public var ineqInputBuf: String = ""
    @Published public var ineqResultStr: String? = nil
    
    // Mode 11: Ratio Mode State
    @Published public var ratioForm: Int = 0 // 0: select (1: A:B=X:D, 2: A:B=C:X)
    @Published public var ratioValues: [Double] = [0.0, 0.0, 0.0]
    @Published public var ratioCursorIdx: Int = 0
    @Published public var ratioInputBuf: String = ""
    @Published public var ratioResultX: Double? = nil
    
    // Mode 12: Table Mode State
    @Published public var tableStep: Int = 0 // 0: f(x), 1: range start, 2: range end, 3: range step, 4: display table
    @Published public var tableFxDoc = MathDocument()
    @Published public var tableRangeStart: Double = 1.0
    @Published public var tableRangeEnd: Double = 5.0
    @Published public var tableRangeStep: Double = 1.0
    @Published public var tableRangeInputBuf: String = ""
    @Published public var tableRows: [(x: Double, fx: Double?)] = []
    @Published public var tableSelectedRow: Int = 0
    
    // Mode 8: Spreadsheet State
    @Published public var sheetCursorRow: Int = 1
    @Published public var sheetCursorCol: Int = 0 // 0: A, 1: B, 2: C, 3: D, 4: E
    @Published public var sheetCells: [String: Double] = [:]
    @Published public var sheetInputBuf: String = ""
    
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
    
    // Mode 4: Matrix State
    @Published public var matrixStep: Int = 0 // 0: define select, 1: rows prompt, 2: cols prompt, 3: editor grid, 4: calc
    @Published public var activeMatrixName: String = "MatA"
    @Published public var matrixNewRows: Int = 2
    @Published public var matrixNewCols: Int = 2
    @Published public var matrixCursorRow: Int = 0
    @Published public var matrixCursorCol: Int = 0
    @Published public var matrixInputBuf: String = ""
    
    // Mode 5: Vector State
    @Published public var vectorStep: Int = 0 // 0: define select, 1: dim prompt, 2: editor grid, 3: calc
    @Published public var activeVectorName: String = "VctA"
    @Published public var vectorNewDim: Int = 3
    @Published public var vectorCursorIdx: Int = 0
    @Published public var vectorInputBuf: String = ""
    
    // Mode 6: Statistics State
    @Published public var statType: Int = 0 // 0: select type, 1: data editor, 2: calc/summary
    @Published public var statPage: Int = 1 // 1 or 2
    @Published public var statSubChoice: Int = 1 // 1: 1-Var, 2: y=a+bx, etc.
    @Published public var statDataX: [Double] = [0.0]
    @Published public var statDataY: [Double] = [0.0]
    @Published public var statDataFreq: [Int] = [1]
    @Published public var statCursorRow: Int = 0
    @Published public var statCursorCol: Int = 0
    @Published public var statInputBuf: String = ""
    @Published public var statSummary: StatisticsSummary? = nil
    @Published public var statSummaryScroll: Int = 0
    
    // Mode 7: Distribution State
    @Published public var distType: Int = 0 // 0: select, 1: params prompt, 2: result
    @Published public var distPage: Int = 1 // 1 or 2
    @Published public var distSubChoice: Int = 1 // 1..7
    @Published public var distParamIndex: Int = 0
    @Published public var distParams: [Double] = [0.0, 1.0, 0.0]
    @Published public var distInputBuf: String = ""
    @Published public var distResult: Double? = nil
    
    // CALC mode prompt tracking
    private var calcVariablesNeeded: [String] = []
    private var calcCurrentIndex: Int = 0
    
    public init() {}
    
    // MARK: - Key Press Dispatcher
    public func handleKeyPress(key: CasioKey) {
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
        
        // If inside a dedicated mode form (Equation, Inequality, Ratio, Table, Spreadsheet), route keys
        if handleDedicatedModeKey(key: key) {
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
        
        // Base-N Quick Radix Switching
        if currentMode == .baseN {
            if key == .xSquared { baseNRadix = .dec; return }
            if key == .power { baseNRadix = .hex; return }
            if key == .log { baseNRadix = .bin; return }
            if key == .ln { baseNRadix = .oct; return }
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
            if isShiftActive { // INS
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
        
        isShiftActive = false
        isAlphaActive = false
    }
    
    // MARK: - Dedicated Mode Key Handling
    private func handleDedicatedModeKey(key: CasioKey) -> Bool {
        switch currentMode {
        case .equation:
            return handleEquationKey(key: key)
        case .inequality:
            return handleInequalityKey(key: key)
        case .ratio:
            return handleRatioKey(key: key)
        case .table:
            return handleTableKey(key: key)
        case .spreadsheet:
            return handleSpreadsheetKey(key: key)
        case .matrix:
            return handleMatrixKey(key: key)
        case .vector:
            return handleVectorKey(key: key)
        case .statistics:
            return handleStatisticsKey(key: key)
        case .distribution:
            return handleDistributionKey(key: key)
        case .baseN:
            return handleBaseNKey(key: key)
        default:
            return false
        }
    }
    
    // Equation Mode Key Handler
    private func handleEquationKey(key: CasioKey) -> Bool {
        if eqSimultRoots != nil || eqPolyResult != nil {
            if key == .up {
                eqRootViewIdx = max(0, eqRootViewIdx - 1)
                return true
            }
            if key == .down {
                eqRootViewIdx += 1
                return true
            }
            if key == .ac || key == .equals {
                eqSimultRoots = nil
                eqPolyResult = nil
                return true
            }
        }
        
        if eqType == 0 {
            if key == .one { eqType = 1; eqSubChoice = 0; return true }
            if key == .two { eqType = 2; eqSubChoice = 0; return true }
            if key == .ac { activeOverlay = .menu(highlightedMode: .equation); return true }
            return true
        }
        
        if eqType == 1 && eqSubChoice == 0 {
            if key == .two { eqSubChoice = 2; initSimult(n: 2); return true }
            if key == .three { eqSubChoice = 3; initSimult(n: 3); return true }
            if key == .four { eqSubChoice = 4; initSimult(n: 4); return true }
            if key == .ac { eqType = 0; return true }
            return true
        }
        
        if eqType == 2 && eqSubChoice == 0 {
            if key == .two { eqSubChoice = 2; initPoly(deg: 2); return true }
            if key == .three { eqSubChoice = 3; initPoly(deg: 3); return true }
            if key == .four { eqSubChoice = 4; initPoly(deg: 4); return true }
            if key == .ac { eqType = 0; return true }
            return true
        }
        
        // Coeff Input
        if let num = key.menuNumber, num <= 9 {
            eqInputBuf += "\(num)"
            return true
        }
        if key == .zero { eqInputBuf += "0"; return true }
        if key == .dot && !eqInputBuf.contains(".") { eqInputBuf += "."; return true }
        if key == .minus && eqInputBuf.isEmpty { eqInputBuf = "-"; return true }
        if key == .del { if !eqInputBuf.isEmpty { eqInputBuf.removeLast() }; return true }
        if key == .ac { eqInputBuf = ""; return true }
        
        if key == .equals {
            if !eqInputBuf.isEmpty, let val = Double(eqInputBuf) {
                if eqType == 1 {
                    eqCoeffs[eqCursorRow][eqCursorCol] = val
                } else {
                    eqCoeffs[0][eqCursorCol] = val
                }
                eqInputBuf = ""
            }
            
            // Advance cursor
            if eqType == 1 {
                eqCursorCol += 1
                if eqCursorCol > eqSubChoice {
                    eqCursorCol = 0
                    eqCursorRow += 1
                    if eqCursorRow >= eqSubChoice {
                        eqCursorRow = eqSubChoice - 1
                        eqCursorCol = eqSubChoice
                        solveCurrentEquation()
                    }
                }
            } else {
                eqCursorCol += 1
                if eqCursorCol > eqSubChoice {
                    eqCursorCol = eqSubChoice
                    solveCurrentEquation()
                }
            }
            return true
        }
        
        // Arrow navigation
        if key == .left { eqCursorCol = max(0, eqCursorCol - 1); return true }
        if key == .right {
            let maxCol = eqType == 1 ? eqSubChoice : eqSubChoice
            eqCursorCol = min(maxCol, eqCursorCol + 1)
            return true
        }
        if key == .up && eqType == 1 { eqCursorRow = max(0, eqCursorRow - 1); return true }
        if key == .down && eqType == 1 { eqCursorRow = min(eqSubChoice - 1, eqCursorRow + 1); return true }
        
        return false
    }
    
    // Inequality Mode Key Handler
    private func handleInequalityKey(key: CasioKey) -> Bool {
        if ineqResultStr != nil {
            if key == .ac || key == .equals { ineqResultStr = nil; return true }
        }
        if ineqDegree == 0 {
            if key == .two { ineqDegree = 2; ineqForm = 0; return true }
            if key == .ac { activeOverlay = .menu(highlightedMode: .inequality); return true }
            return true
        }
        if ineqForm == 0 {
            if let n = key.menuNumber, n >= 1 && n <= 4 {
                ineqForm = n
                ineqCoeffs = [1.0, 0.0, 0.0]
                ineqCursorIdx = 0
                ineqInputBuf = ""
                return true
            }
            if key == .ac { ineqDegree = 0; return true }
            return true
        }
        // Coeff Input
        if let num = key.menuNumber, num <= 9 { ineqInputBuf += "\(num)"; return true }
        if key == .zero { ineqInputBuf += "0"; return true }
        if key == .dot && !ineqInputBuf.contains(".") { ineqInputBuf += "."; return true }
        if key == .minus && ineqInputBuf.isEmpty { ineqInputBuf = "-"; return true }
        if key == .del { if !ineqInputBuf.isEmpty { ineqInputBuf.removeLast() }; return true }
        if key == .ac { ineqInputBuf = ""; return true }
        
        if key == .equals {
            if !ineqInputBuf.isEmpty, let v = Double(ineqInputBuf) {
                ineqCoeffs[ineqCursorIdx] = v
                ineqInputBuf = ""
            }
            ineqCursorIdx += 1
            if ineqCursorIdx >= 3 {
                ineqCursorIdx = 2
                solveCurrentInequality()
            }
            return true
        }
        if key == .left { ineqCursorIdx = max(0, ineqCursorIdx - 1); return true }
        if key == .right { ineqCursorIdx = min(2, ineqCursorIdx + 1); return true }
        return false
    }
    
    // Ratio Mode Key Handler
    private func handleRatioKey(key: CasioKey) -> Bool {
        if ratioResultX != nil {
            if key == .ac || key == .equals { ratioResultX = nil; return true }
        }
        if ratioForm == 0 {
            if key == .one { ratioForm = 1; ratioValues = [1.0, 1.0, 1.0]; ratioCursorIdx = 0; return true }
            if key == .two { ratioForm = 2; ratioValues = [1.0, 1.0, 1.0]; ratioCursorIdx = 0; return true }
            if key == .ac { activeOverlay = .menu(highlightedMode: .ratio); return true }
            return true
        }
        if let num = key.menuNumber, num <= 9 { ratioInputBuf += "\(num)"; return true }
        if key == .zero { ratioInputBuf += "0"; return true }
        if key == .dot && !ratioInputBuf.contains(".") { ratioInputBuf += "."; return true }
        if key == .minus && ratioInputBuf.isEmpty { ratioInputBuf = "-"; return true }
        if key == .del { if !ratioInputBuf.isEmpty { ratioInputBuf.removeLast() }; return true }
        if key == .ac { ratioInputBuf = ""; return true }
        
        if key == .equals {
            if !ratioInputBuf.isEmpty, let v = Double(ratioInputBuf) {
                ratioValues[ratioCursorIdx] = v
                ratioInputBuf = ""
            }
            ratioCursorIdx += 1
            if ratioCursorIdx >= 3 {
                ratioCursorIdx = 2
                solveCurrentRatio()
            }
            return true
        }
        if key == .left { ratioCursorIdx = max(0, ratioCursorIdx - 1); return true }
        if key == .right { ratioCursorIdx = min(2, ratioCursorIdx + 1); return true }
        return false
    }
    
    // Table Mode Key Handler
    private func handleTableKey(key: CasioKey) -> Bool {
        if tableStep == 4 { // Display Table
            if key == .up { tableSelectedRow = max(0, tableSelectedRow - 1); return true }
            if key == .down { tableSelectedRow = min(max(0, tableRows.count - 1), tableSelectedRow + 1); return true }
            if key == .ac { tableStep = 0; return true }
            return true
        }
        if tableStep == 0 { // Input f(x)
            if key == .equals {
                tableStep = 1
                tableRangeInputBuf = "1"
                return true
            }
            if key == .ac { tableFxDoc.clear(); return true }
            return false // Let natural math insertion happen into tableFxDoc
        }
        if tableStep >= 1 && tableStep <= 3 { // Range Start, End, Step
            if let num = key.menuNumber, num <= 9 { tableRangeInputBuf += "\(num)"; return true }
            if key == .zero { tableRangeInputBuf += "0"; return true }
            if key == .dot && !tableRangeInputBuf.contains(".") { tableRangeInputBuf += "."; return true }
            if key == .minus && tableRangeInputBuf.isEmpty { tableRangeInputBuf = "-"; return true }
            if key == .del { if !tableRangeInputBuf.isEmpty { tableRangeInputBuf.removeLast() }; return true }
            
            if key == .equals {
                if let v = Double(tableRangeInputBuf) {
                    if tableStep == 1 { tableRangeStart = v; tableStep = 2; tableRangeInputBuf = "5" }
                    else if tableStep == 2 { tableRangeEnd = v; tableStep = 3; tableRangeInputBuf = "1" }
                    else if tableStep == 3 { tableRangeStep = v; computeTable() }
                }
                return true
            }
            if key == .ac { tableStep = 0; return true }
            return true
        }
        return false
    }
    
    // Spreadsheet Mode Key Handler
    private func handleSpreadsheetKey(key: CasioKey) -> Bool {
        if key == .up { sheetCursorRow = max(1, sheetCursorRow - 1); return true }
        if key == .down { sheetCursorRow = min(45, sheetCursorRow + 1); return true }
        if key == .left { sheetCursorCol = max(0, sheetCursorCol - 1); return true }
        if key == .right { sheetCursorCol = min(4, sheetCursorCol + 1); return true }
        
        let cellKey = "\(Character(UnicodeScalar(65 + sheetCursorCol)!))\(sheetCursorRow)"
        if let num = key.menuNumber, num <= 9 { sheetInputBuf += "\(num)"; return true }
        if key == .zero { sheetInputBuf += "0"; return true }
        if key == .dot && !sheetInputBuf.contains(".") { sheetInputBuf += "."; return true }
        if key == .minus && sheetInputBuf.isEmpty { sheetInputBuf = "-"; return true }
        if key == .del { if !sheetInputBuf.isEmpty { sheetInputBuf.removeLast() }; return true }
        if key == .equals {
            if !sheetInputBuf.isEmpty, let v = Double(sheetInputBuf) {
                sheetCells[cellKey] = v
                sheetInputBuf = ""
            }
            sheetCursorRow = min(45, sheetCursorRow + 1)
            return true
        }
        if key == .ac { sheetInputBuf = ""; return true }
        return false
    }
    
    // MARK: - Matrix Mode Key Handler
    private func handleMatrixKey(key: CasioKey) -> Bool {
        if matrixStep == 0 { // Select Matrix
            if let n = key.menuNumber, n >= 1 && n <= 4 {
                activeMatrixName = ["MatA", "MatB", "MatC", "MatD"][n - 1]
                matrixStep = 1
                matrixNewRows = 2
                return true
            }
            if key == .ac { activeOverlay = .menu(highlightedMode: .matrix); return true }
            return true
        }
        if matrixStep == 1 { // Rows Prompt
            if let n = key.menuNumber, n >= 1 && n <= 4 {
                matrixNewRows = n
                matrixStep = 2
                matrixNewCols = 2
                return true
            }
            if key == .ac { matrixStep = 0; return true }
            return true
        }
        if matrixStep == 2 { // Cols Prompt
            if let n = key.menuNumber, n >= 1 && n <= 4 {
                matrixNewCols = n
                matrices[activeMatrixName] = CasioMatrix(rows: matrixNewRows, cols: matrixNewCols)
                matrixStep = 3
                matrixCursorRow = 0
                matrixCursorCol = 0
                matrixInputBuf = ""
                return true
            }
            if key == .ac { matrixStep = 1; return true }
            return true
        }
        if matrixStep == 3 { // Grid Editor
            if let num = key.menuNumber, num <= 9 { matrixInputBuf += "\(num)"; return true }
            if key == .zero { matrixInputBuf += "0"; return true }
            if key == .dot && !matrixInputBuf.contains(".") { matrixInputBuf += "."; return true }
            if key == .minus && matrixInputBuf.isEmpty { matrixInputBuf = "-"; return true }
            if key == .del { if !matrixInputBuf.isEmpty { matrixInputBuf.removeLast() }; return true }
            if key == .ac {
                matrixStep = 4 // Exit editor to calculation line
                matrixInputBuf = ""
                return true
            }
            if key == .equals {
                if !matrixInputBuf.isEmpty, let val = Double(matrixInputBuf) {
                    matrices[activeMatrixName]?[matrixCursorRow, matrixCursorCol] = val
                    matrixInputBuf = ""
                }
                let cols = matrices[activeMatrixName]?.cols ?? 2
                let rows = matrices[activeMatrixName]?.rows ?? 2
                matrixCursorCol += 1
                if matrixCursorCol >= cols {
                    matrixCursorCol = 0
                    matrixCursorRow += 1
                    if matrixCursorRow >= rows {
                        matrixCursorRow = rows - 1
                        matrixCursorCol = cols - 1
                    }
                }
                return true
            }
            if key == .left { matrixCursorCol = max(0, matrixCursorCol - 1); return true }
            if key == .right {
                let maxCol = (matrices[activeMatrixName]?.cols ?? 2) - 1
                matrixCursorCol = min(maxCol, matrixCursorCol + 1)
                return true
            }
            if key == .up { matrixCursorRow = max(0, matrixCursorRow - 1); return true }
            if key == .down {
                let maxRow = (matrices[activeMatrixName]?.rows ?? 2) - 1
                matrixCursorRow = min(maxRow, matrixCursorRow + 1)
                return true
            }
            return true
        }
        if matrixStep == 4 {
            return false // Allow math input in calculation mode
        }
        return false
    }

    // MARK: - Vector Mode Key Handler
    private func handleVectorKey(key: CasioKey) -> Bool {
        if vectorStep == 0 { // Select Vector
            if let n = key.menuNumber, n >= 1 && n <= 4 {
                activeVectorName = ["VctA", "VctB", "VctC", "VctD"][n - 1]
                vectorStep = 1
                vectorNewDim = 3
                return true
            }
            if key == .ac { activeOverlay = .menu(highlightedMode: .vector); return true }
            return true
        }
        if vectorStep == 1 { // Dim Prompt (2~3)
            if let n = key.menuNumber, n >= 2 && n <= 3 {
                vectorNewDim = n
                vectors[activeVectorName] = CasioVector(dim: vectorNewDim)
                vectorStep = 2
                vectorCursorIdx = 0
                vectorInputBuf = ""
                return true
            }
            if key == .ac { vectorStep = 0; return true }
            return true
        }
        if vectorStep == 2 { // Grid Editor
            if let num = key.menuNumber, num <= 9 { vectorInputBuf += "\(num)"; return true }
            if key == .zero { vectorInputBuf += "0"; return true }
            if key == .dot && !vectorInputBuf.contains(".") { vectorInputBuf += "."; return true }
            if key == .minus && vectorInputBuf.isEmpty { vectorInputBuf = "-"; return true }
            if key == .del { if !vectorInputBuf.isEmpty { vectorInputBuf.removeLast() }; return true }
            if key == .ac {
                vectorStep = 3 // Exit editor to vector calc line
                vectorInputBuf = ""
                return true
            }
            if key == .equals {
                if !vectorInputBuf.isEmpty, let val = Double(vectorInputBuf) {
                    vectors[activeVectorName]?[vectorCursorIdx] = val
                    vectorInputBuf = ""
                }
                let dim = vectors[activeVectorName]?.dim ?? 3
                vectorCursorIdx = min(dim - 1, vectorCursorIdx + 1)
                return true
            }
            if key == .left { vectorCursorIdx = max(0, vectorCursorIdx - 1); return true }
            if key == .right {
                let maxIdx = (vectors[activeVectorName]?.dim ?? 3) - 1
                vectorCursorIdx = min(maxIdx, vectorCursorIdx + 1)
                return true
            }
            return true
        }
        if vectorStep == 3 {
            return false // standard calc line
        }
        return false
    }

    // MARK: - Statistics Mode Key Handler
    private func handleStatisticsKey(key: CasioKey) -> Bool {
        if statSummary != nil {
            if key == .up { statSummaryScroll = max(0, statSummaryScroll - 1); return true }
            if key == .down { statSummaryScroll += 1; return true }
            if key == .ac || key == .equals { statSummary = nil; return true }
            return true
        }
        if statType == 0 { // Select Type
            if key == .down { statPage = 2; return true }
            if key == .up { statPage = 1; return true }
            if let n = key.menuNumber, n >= 1 && n <= 4 {
                statSubChoice = (statPage == 1) ? n : (n + 4)
                statDataX = [0.0]
                statDataY = [0.0]
                statDataFreq = [1]
                statCursorRow = 0
                statCursorCol = 0
                statInputBuf = ""
                statType = 1 // editor
                return true
            }
            if key == .ac { activeOverlay = .menu(highlightedMode: .statistics); return true }
            return true
        }
        if statType == 1 { // Data Editor
            if let num = key.menuNumber, num <= 9 { statInputBuf += "\(num)"; return true }
            if key == .zero { statInputBuf += "0"; return true }
            if key == .dot && !statInputBuf.contains(".") { statInputBuf += "."; return true }
            if key == .minus && statInputBuf.isEmpty { statInputBuf = "-"; return true }
            if key == .del { if !statInputBuf.isEmpty { statInputBuf.removeLast() }; return true }
            if key == .ac {
                statType = 2 // stat calc line
                statInputBuf = ""
                return true
            }
            if key == .equals {
                if !statInputBuf.isEmpty, let val = Double(statInputBuf) {
                    let is2Var = (statSubChoice >= 2)
                    let freqCol = is2Var ? 2 : 1
                    if statCursorCol == 0 {
                        statDataX[statCursorRow] = val
                    } else if is2Var && statCursorCol == 1 {
                        statDataY[statCursorRow] = val
                    } else if statCursorCol == freqCol {
                        statDataFreq[statCursorRow] = max(1, Int(val))
                    }
                    statInputBuf = ""
                }
                // Advance row
                statCursorRow += 1
                if statCursorRow >= statDataX.count {
                    statDataX.append(0.0)
                    statDataY.append(0.0)
                    statDataFreq.append(1)
                }
                return true
            }
            if key == .up { statCursorRow = max(0, statCursorRow - 1); return true }
            if key == .down { statCursorRow = min(statDataX.count - 1, statCursorRow + 1); return true }
            if key == .left { statCursorCol = max(0, statCursorCol - 1); return true }
            if key == .right {
                let maxCol = (statSubChoice >= 2) ? 2 : 1
                statCursorCol = min(maxCol, statCursorCol + 1)
                return true
            }
            return true
        }
        if statType == 2 { // Stat Calc Line
            return false // Allows natural math or OPTN
        }
        return false
    }

    // MARK: - Distribution Mode Key Handler
    private func handleDistributionKey(key: CasioKey) -> Bool {
        if distResult != nil {
            if key == .ac || key == .equals { distResult = nil; return true }
            return true
        }
        if distType == 0 { // Select
            if key == .down { distPage = 2; return true }
            if key == .up { distPage = 1; return true }
            if let n = key.menuNumber, n >= 1 && n <= 4 {
                distSubChoice = (distPage == 1) ? n : (n + 4)
                if distSubChoice > 7 { return true }
                distType = 1
                distParamIndex = 0
                distInputBuf = ""
                switch distSubChoice {
                case 1: distParams = [0.0, 1.0, 0.0] // x, sigma, mu
                case 2: distParams = [-1.0, 1.0, 1.0, 0.0] // lower, upper, sigma, mu
                case 3: distParams = [0.5, 1.0, 0.0] // area, sigma, mu
                case 4, 5: distParams = [2.0, 5.0, 0.5] // x, N, p
                case 6, 7: distParams = [2.0, 2.0] // x, lambda
                default: distParams = [0.0]
                }
                return true
            }
            if key == .ac { activeOverlay = .menu(highlightedMode: .distribution); return true }
            return true
        }
        if distType == 1 { // Params Prompt
            if let num = key.menuNumber, num <= 9 { distInputBuf += "\(num)"; return true }
            if key == .zero { distInputBuf += "0"; return true }
            if key == .dot && !distInputBuf.contains(".") { distInputBuf += "."; return true }
            if key == .minus && distInputBuf.isEmpty { distInputBuf = "-"; return true }
            if key == .del { if !distInputBuf.isEmpty { distInputBuf.removeLast() }; return true }
            if key == .ac { distType = 0; return true }
            if key == .equals {
                if !distInputBuf.isEmpty, let val = Double(distInputBuf) {
                    if distParamIndex < distParams.count {
                        distParams[distParamIndex] = val
                    }
                    distInputBuf = ""
                }
                distParamIndex += 1
                if distParamIndex >= distParams.count {
                    distParamIndex = distParams.count - 1
                    calculateDistribution()
                }
                return true
            }
            if key == .up { distParamIndex = max(0, distParamIndex - 1); return true }
            if key == .down { distParamIndex = min(distParams.count - 1, distParamIndex + 1); return true }
            return true
        }
        return false
    }

    private func calculateDistribution() {
        do {
            switch distSubChoice {
            case 1: // Normal PD
                distResult = try StatisticsEngine.normalPD(x: distParams[0], mean: distParams[2], sigma: distParams[1])
            case 2: // Normal CD
                distResult = try StatisticsEngine.normalCD(lower: distParams[0], upper: distParams[1], mean: distParams[3], sigma: distParams[2])
            case 3: // Inverse Normal
                distResult = try StatisticsEngine.inverseNormal(area: distParams[0], mean: distParams[2], sigma: distParams[1])
            case 4: // Binomial PD
                distResult = try StatisticsEngine.binomialPD(x: Int(distParams[0]), n: Int(distParams[1]), p: distParams[2])
            case 5: // Binomial CD
                distResult = try StatisticsEngine.binomialCD(x: Int(distParams[0]), n: Int(distParams[1]), p: distParams[2])
            case 6: // Poisson PD
                distResult = try StatisticsEngine.poissonPD(x: Int(distParams[0]), lambda: distParams[1])
            case 7: // Poisson CD
                distResult = try StatisticsEngine.poissonCD(x: Int(distParams[0]), lambda: distParams[1])
            default:
                distResult = 0.0
            }
        } catch {
            activeError = .mathError
        }
    }

    // MARK: - Base-N Mode Key Handler
    private func handleBaseNKey(key: CasioKey) -> Bool {
        // Quick Radix Switching
        if key == .xSquared { baseNRadix = .dec; return true }
        if key == .power { baseNRadix = .hex; return true }
        if key == .log { baseNRadix = .bin; return true }
        if key == .ln { baseNRadix = .oct; return true }
        
        // Hex digit inputs
        if key == .neg { document.insert(char: "A"); return true }
        if key == .dms { document.insert(char: "B"); return true }
        if key == .xMinus1 { document.insert(char: "C"); return true }
        if key == .sin { document.insert(char: "D"); return true }
        if key == .cos { document.insert(char: "E"); return true }
        if key == .tan { document.insert(char: "F"); return true }
        
        return false // let normal keys work
    }
    
    // MARK: - Mathematical Solvers Integration
    public func initSimult(n: Int) {
        eqCoeffs = Array(repeating: Array(repeating: 0.0, count: n + 1), count: n)
        eqCursorRow = 0
        eqCursorCol = 0
        eqInputBuf = ""
        eqSimultRoots = nil
        eqRootViewIdx = 0
    }
    
    public func initPoly(deg: Int) {
        eqCoeffs = [Array(repeating: 0.0, count: deg + 1)]
        eqCursorRow = 0
        eqCursorCol = 0
        eqInputBuf = ""
        eqPolyResult = nil
        eqRootViewIdx = 0
    }
    
    public func solveCurrentEquation() {
        if eqType == 1 { // Simult
            let n = eqSubChoice
            var a = [[Double]]()
            var b = [Double]()
            for i in 0..<n {
                a.append(Array(eqCoeffs[i][0..<n]))
                b.append(eqCoeffs[i][n])
            }
            let res = EquationSolver.solveSimultaneous(matrix: a, constants: b)
            switch res {
            case .unique(let sols):
                eqSimultRoots = sols
            case .infiniteSolutions:
                eqSimultRoots = ["x": 0.0, "info": 999.0]
            case .noSolution:
                eqSimultRoots = nil
                activeError = .cantSolve
            }
        } else if eqType == 2 { // Poly
            let deg = eqSubChoice
            let c = eqCoeffs[0]
            do {
                if deg == 2 {
                    eqPolyResult = try EquationSolver.solveQuadratic(a: c[0], b: c[1], c: c[2])
                } else if deg == 3 {
                    eqPolyResult = try EquationSolver.solveCubic(a: c[0], b: c[1], c: c[2], d: c[3])
                } else if deg == 4 {
                    eqPolyResult = try EquationSolver.solveQuartic(a: c[0], b: c[1], c: c[2], d: c[3], e: c[4])
                }
            } catch {
                activeError = .mathError
            }
        }
    }
    
    public func solveCurrentInequality() {
        let type: EquationSolver.InequalityType = {
            switch ineqForm {
            case 1: return .gt
            case 2: return .lt
            case 3: return .ge
            default: return .le
            }
        }()
        do {
            ineqResultStr = try EquationSolver.solveQuadraticInequality(
                a: ineqCoeffs[0],
                b: ineqCoeffs[1],
                c: ineqCoeffs[2],
                type: type
            )
        } catch {
            activeError = .mathError
        }
    }
    
    public func solveCurrentRatio() {
        do {
            if ratioForm == 1 {
                ratioResultX = try EquationSolver.solveRatio(a: ratioValues[0], b: ratioValues[1], c: nil, d: ratioValues[2], findXAt: 1)
            } else {
                ratioResultX = try EquationSolver.solveRatio(a: ratioValues[0], b: ratioValues[1], c: ratioValues[2], d: nil, findXAt: 2)
            }
        } catch {
            activeError = .mathError
        }
    }
    
    public func computeTable() {
        tableRows = []
        let fStr = tableFxDoc.toEvalString()
        var cur = tableRangeStart
        let end = tableRangeEnd
        let step = max(0.0001, abs(tableRangeStep))
        
        while cur <= end + 1e-9 {
            var fxVal: Double? = nil
            if !fStr.isEmpty {
                MathEvaluator.shared.variables["x"] = cur
                if let r = try? MathEvaluator.shared.evaluateExpression(fStr) {
                    fxVal = r
                }
            }
            tableRows.append((x: cur, fx: fxVal))
            cur += step
            if tableRows.count >= 50 { break }
        }
        tableSelectedRow = 0
        tableStep = 4 // display table
    }
    
    private func insertFromKey(key: CasioKey) {
        let targetDoc = (currentMode == .table && tableStep == 0) ? tableFxDoc : document
        
        if isShiftActive {
            switch key {
            case .fraction: targetDoc.insertNode(.mixedFrac(whole: [], num: [], den: []))
            case .sqrt: targetDoc.insertNode(.nRoot(n: [.char(symbol: "3")], radicand: []))
            case .power: targetDoc.insertNode(.nRoot(n: [], radicand: []))
            case .log: targetDoc.insertNode(.power(base: [.char(symbol: "1", tag: ""), .char(symbol: "0", tag: "")], exp: []))
            case .ln: targetDoc.insertNode(.power(base: [.char(symbol: "e")], exp: []))
            case .integral: targetDoc.insertNode(.derivative(expr: [], at: []))
            case .logBase: targetDoc.insertNode(.sum(expr: [], lower: [], upper: []))
            case .xMinus1: targetDoc.insert(char: "!")
            case .sin: targetDoc.insert(char: "asin(")
            case .cos: targetDoc.insert(char: "acos(")
            case .tan: targetDoc.insert(char: "atan(")
            case .hyp: targetDoc.insert(char: "asinh(")
            case .leftParen: targetDoc.insert(char: "%")
            case .rightParen: targetDoc.insert(char: ",")
            case .times: targetDoc.insert(char: "P")
            case .divide: targetDoc.insert(char: "C")
            case .plus: targetDoc.insert(char: "Pol(")
            case .minus: targetDoc.insert(char: "Rec(")
            case .exp: targetDoc.insert(char: "π")
            case .dot: targetDoc.insert(char: "Ran#")
            default: break
            }
            return
        }
        
        if isAlphaActive {
            if let varName = key.variableName {
                targetDoc.insert(char: varName)
                return
            }
            if key == .divide { targetDoc.insert(char: "÷R"); return }
            if key == .calc { targetDoc.insert(char: "="); return }
            if key == .integral { targetDoc.insertNode(.product(expr: [], lower: [], upper: [])); return }
            if key == .dot { targetDoc.insert(char: "RanInt#("); return }
            return
        }
        
        // Normal Key Presses
        switch key {
        case .zero: targetDoc.insert(char: "0")
        case .one: targetDoc.insert(char: "1")
        case .two: targetDoc.insert(char: "2")
        case .three: targetDoc.insert(char: "3")
        case .four: targetDoc.insert(char: "4")
        case .five: targetDoc.insert(char: "5")
        case .six: targetDoc.insert(char: "6")
        case .seven: targetDoc.insert(char: "7")
        case .eight: targetDoc.insert(char: "8")
        case .nine: targetDoc.insert(char: "9")
        case .dot: targetDoc.insert(char: ".")
        case .exp: targetDoc.insert(char: "×10^", tag: "pow10")
        case .ans: targetDoc.insert(char: "Ans")
            
        case .plus: targetDoc.insert(char: "+")
        case .minus: targetDoc.insert(char: "−")
        case .times: targetDoc.insert(char: "×")
        case .divide: targetDoc.insert(char: "÷")
            
        case .fraction: targetDoc.insertNode(.fraction(num: [], den: []))
        case .sqrt: targetDoc.insertNode(.sqrt(radicand: []))
        case .xSquared: targetDoc.insertNode(.power(base: [], exp: [.char(symbol: "2")]))
        case .power: targetDoc.insertNode(.power(base: [], exp: []))
        case .logBase: targetDoc.insertNode(.logBase(base: [], arg: []))
        case .log: targetDoc.insert(char: "log(")
        case .ln: targetDoc.insert(char: "ln(")
        case .integral: targetDoc.insertNode(.integral(expr: [], lower: [], upper: []))
        case .xMinus1: targetDoc.insert(char: "^-1")
            
        case .sin: targetDoc.insert(char: "sin(")
        case .cos: targetDoc.insert(char: "cos(")
        case .tan: targetDoc.insert(char: "tan(")
        case .hyp: targetDoc.insert(char: "sinh(")
        case .dms: targetDoc.insert(char: "°")
        case .neg: targetDoc.insert(char: "-")
        case .leftParen: targetDoc.insert(char: "(")
        case .rightParen: targetDoc.insert(char: ")")
        case .eng: targetDoc.insert(char: currentMode == .complex ? "i" : "E")
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
    
    // S<=>D cycle: Exact -> Decimal -> DMS -> PrimeFact -> Exact
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
                switch currentMode {
                case .calculate:
                    if key == .one { activeOverlay = .option(subCategory: .hyperbolic) }
                    else if key == .two { activeOverlay = .option(subCategory: .angleUnit) }
                    else if key == .three { activeOverlay = .option(subCategory: .engineerSymbol) }
                    else if key == .ac { activeOverlay = .none }
                case .complex:
                    if key == .one { document.insert(char: "i"); activeOverlay = .none }
                    else if key == .two { document.insert(char: "∠"); activeOverlay = .none }
                    else if key == .three { document.insert(char: "Conjg("); activeOverlay = .none }
                    else if key == .four { document.insert(char: "▸r∠θ"); activeOverlay = .none }
                    else if key == .five { document.insert(char: "▸a+bi"); activeOverlay = .none }
                    else if key == .ac { activeOverlay = .none }
                case .baseN:
                    if key == .one { document.insert(char: " and "); activeOverlay = .none }
                    else if key == .two { document.insert(char: " or "); activeOverlay = .none }
                    else if key == .three { document.insert(char: " xor "); activeOverlay = .none }
                    else if key == .four { document.insert(char: " xnor "); activeOverlay = .none }
                    else if key == .five { document.insert(char: "Not("); activeOverlay = .none }
                    else if key == .six { document.insert(char: "Neg("); activeOverlay = .none }
                    else if key == .ac { activeOverlay = .none }
                case .matrix:
                    if key == .one { matrixStep = 0; activeOverlay = .none }
                    else if key == .two { document.insert(char: "MatA"); activeOverlay = .none }
                    else if key == .three { document.insert(char: "MatB"); activeOverlay = .none }
                    else if key == .four { document.insert(char: "MatC"); activeOverlay = .none }
                    else if key == .five { document.insert(char: "MatD"); activeOverlay = .none }
                    else if key == .six { document.insert(char: "MatAns"); activeOverlay = .none }
                    else if key == .seven { document.insert(char: "Det("); activeOverlay = .none }
                    else if key == .eight { document.insert(char: "Trn("); activeOverlay = .none }
                    else if key == .ac { activeOverlay = .none }
                case .vector:
                    if key == .one { vectorStep = 0; activeOverlay = .none }
                    else if key == .two { document.insert(char: "VctA"); activeOverlay = .none }
                    else if key == .three { document.insert(char: "VctB"); activeOverlay = .none }
                    else if key == .four { document.insert(char: "VctC"); activeOverlay = .none }
                    else if key == .five { document.insert(char: "VctD"); activeOverlay = .none }
                    else if key == .six { document.insert(char: "VctAns"); activeOverlay = .none }
                    else if key == .seven { document.insert(char: " • "); activeOverlay = .none }
                    else if key == .ac { activeOverlay = .none }
                case .statistics:
                    if key == .one { statType = 0; statPage = 1; activeOverlay = .none }
                    else if key == .two { statType = 1; activeOverlay = .none }
                    else if key == .three {
                        statSummary = StatisticsEngine.compute1Var(data: statDataX, frequencies: statDataFreq)
                        statSummaryScroll = 0
                        activeOverlay = .none
                    }
                    else if key == .four {
                        statSummary = StatisticsEngine.computeLinearRegression(x: statDataX, y: statDataY)
                        statSummaryScroll = 0
                        activeOverlay = .none
                    }
                    else if key == .ac { activeOverlay = .none }
                default:
                    if key == .ac { activeOverlay = .none }
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
                                decimalValue: newVal,
                                exactDisplay: MathEvaluator.shared.formatDecimal(newVal),
                                decimalDisplay: MathEvaluator.shared.formatDecimal(newVal),
                                dmsDisplay: MathEvaluator.toDMSString(newVal)
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
        
        // Reset dedicated mode states
        eqType = 0
        eqSubChoice = 0
        eqCoeffs = []
        eqCursorRow = 0
        eqCursorCol = 0
        eqInputBuf = ""
        eqSimultRoots = nil
        eqPolyResult = nil
        eqRootViewIdx = 0
        
        ineqDegree = 0
        ineqForm = 0
        ineqCoeffs = [1.0, 0.0, 0.0]
        ineqCursorIdx = 0
        ineqInputBuf = ""
        ineqResultStr = nil
        
        ratioForm = 0
        ratioValues = [1.0, 1.0, 1.0]
        ratioCursorIdx = 0
        ratioInputBuf = ""
        ratioResultX = nil
        
        tableStep = 0
        tableFxDoc.clear()
        tableRows = []
        tableSelectedRow = 0
        
        matrixStep = 0
        matrixInputBuf = ""
        matrixCursorRow = 0
        matrixCursorCol = 0
        
        vectorStep = 0
        vectorInputBuf = ""
        vectorCursorIdx = 0
        
        statType = 0
        statPage = 1
        statSummary = nil
        statSummaryScroll = 0
        statInputBuf = ""
        
        distType = 0
        distPage = 1
        distResult = nil
        distInputBuf = ""
    }
}

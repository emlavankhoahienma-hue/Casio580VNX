import Foundation
import SwiftUI

// MARK: - Casio Error Definitions
public enum CasioError: Error, Equatable {
    case mathError           // Lỗi phép tính (chia cho 0, log số âm, căn âm trong R...)
    case syntaxError(index: Int) // Lỗi cú pháp kèm vị trí để [◄][►] nhảy tới
    case argumentError       // Lỗi miền giá trị
    case cantSolve           // Không giải được (SOLVE)
    case rangeError          // Phạm vi lỗi (vượt quá 10^100 hoặc tràn chỉ số)
    
    public var titleVi: String {
        switch self {
        case .mathError: return "Lỗi phép tính"
        case .syntaxError: return "Lỗi cú pháp"
        case .argumentError: return "Lỗi đối số"
        case .cantSolve: return "Không giải được"
        case .rangeError: return "Phạm vi lỗi"
        }
    }
    
    public var titleEn: String {
        switch self {
        case .mathError: return "Math ERROR"
        case .syntaxError: return "Syntax ERROR"
        case .argumentError: return "Argument ERROR"
        case .cantSolve: return "Can't Solve"
        case .rangeError: return "Range ERROR"
        }
    }
}

// MARK: - MathNode AST for Natural Textbook 2D Display
public indirect enum MathNode: Equatable, Hashable, Identifiable {
    public var id: String {
        switch self {
        case .char(let s, _): return "char_\(s)_\(UUID().uuidString.prefix(6))"
        case .fraction(let n, let d): return "frac_\(n.count)_\(d.count)_\(UUID().uuidString.prefix(6))"
        case .mixedFrac(let w, let n, let d): return "mixed_\(w.count)_\(n.count)_\(d.count)_\(UUID().uuidString.prefix(6))"
        case .sqrt(let r): return "sqrt_\(r.count)_\(UUID().uuidString.prefix(6))"
        case .nRoot(let n, let r): return "nroot_\(n.count)_\(r.count)_\(UUID().uuidString.prefix(6))"
        case .power(let b, let e): return "pow_\(b.count)_\(e.count)_\(UUID().uuidString.prefix(6))"
        case .logBase(let b, let a): return "logbase_\(b.count)_\(a.count)_\(UUID().uuidString.prefix(6))"
        case .derivative(let e, let a): return "deriv_\(e.count)_\(a.count)_\(UUID().uuidString.prefix(6))"
        case .integral(let e, let l, let u): return "int_\(e.count)_\(l.count)_\(u.count)_\(UUID().uuidString.prefix(6))"
        case .sum(let e, let l, let u): return "sum_\(e.count)_\(l.count)_\(u.count)_\(UUID().uuidString.prefix(6))"
        case .product(let e, let l, let u): return "prod_\(e.count)_\(l.count)_\(u.count)_\(UUID().uuidString.prefix(6))"
        case .abs(let e): return "abs_\(e.count)_\(UUID().uuidString.prefix(6))"
        }
    }
    
    case char(symbol: String, tag: String = "")
    case fraction(num: [MathNode], den: [MathNode])
    case mixedFrac(whole: [MathNode], num: [MathNode], den: [MathNode])
    case sqrt(radicand: [MathNode])
    case nRoot(n: [MathNode], radicand: [MathNode])
    case power(base: [MathNode], exp: [MathNode])
    case logBase(base: [MathNode], arg: [MathNode])
    case derivative(expr: [MathNode], at: [MathNode])
    case integral(expr: [MathNode], lower: [MathNode], upper: [MathNode])
    case sum(expr: [MathNode], lower: [MathNode], upper: [MathNode])
    case product(expr: [MathNode], lower: [MathNode], upper: [MathNode])
    case abs(expr: [MathNode])
}

// MARK: - Slot Locator & Cursor Model
public struct CursorLocation: Equatable {
    // path is an array of indices: slot indices and node indices
    public var path: [Int] = [0] // index in root node array
    
    public init(path: [Int] = [0]) {
        self.path = path
    }
}

// MARK: - MathNode Document Container
public class MathDocument: ObservableObject, Equatable {
    public static func == (lhs: MathDocument, rhs: MathDocument) -> Bool {
        lhs.nodes == rhs.nodes && lhs.cursorIndex == rhs.cursorIndex
    }
    
    @Published public var nodes: [MathNode] = []
    @Published public var cursorIndex: Int = 0 // Position in top-level or active slot
    
    public init(nodes: [MathNode] = []) {
        self.nodes = nodes
        self.cursorIndex = nodes.count
    }
    
    public func clear() {
        nodes.removeAll()
        cursorIndex = 0
    }
    
    public func insert(char: String, tag: String = "") {
        let node = MathNode.char(symbol: char, tag: tag)
        if cursorIndex >= 0 && cursorIndex <= nodes.count {
            nodes.insert(node, at: cursorIndex)
            cursorIndex += 1
        } else {
            nodes.append(node)
            cursorIndex = nodes.count
        }
    }
    
    public func insertNode(_ node: MathNode) {
        if cursorIndex >= 0 && cursorIndex <= nodes.count {
            nodes.insert(node, at: cursorIndex)
            cursorIndex += 1
        } else {
            nodes.append(node)
            cursorIndex = nodes.count
        }
    }
    
    public func deleteBackward() {
        guard cursorIndex > 0 && cursorIndex <= nodes.count else { return }
        nodes.remove(at: cursorIndex - 1)
        cursorIndex -= 1
    }
    
    public func moveLeft() {
        if cursorIndex > 0 {
            cursorIndex -= 1
        }
    }
    
    public func moveRight() {
        if cursorIndex < nodes.count {
            cursorIndex += 1
        }
    }
    
    public func moveHome() {
        cursorIndex = 0
    }
    
    public func moveEnd() {
        cursorIndex = nodes.count
    }
    
    // Converts AST to linear evaluation string
    public func toEvalString() -> String {
        return MathDocument.nodesToEval(nodes)
    }
    
    public static func nodesToEval(_ list: [MathNode]) -> String {
        var res = ""
        for n in list {
            switch n {
            case .char(let s, let tag):
                if tag == "pow10" {
                    res += "*10^"
                } else if s == "×" {
                    res += "*"
                } else if s == "÷" {
                    res += "/"
                } else if s == "−" {
                    res += "-"
                } else if s == "π" {
                    res += "\(Double.pi)"
                } else if s == "e" {
                    res += "\(M_E)"
                } else if s == "Ans" {
                    res += "Ans"
                } else {
                    res += s
                }
            case .fraction(let num, let den):
                res += "((\(nodesToEval(num)))/(\(nodesToEval(den))))"
            case .mixedFrac(let whole, let num, let den):
                res += "(\(nodesToEval(whole))+((\(nodesToEval(num)))/(\(nodesToEval(den)))))"
            case .sqrt(let r):
                res += "sqrt(\(nodesToEval(r)))"
            case .nRoot(let n, let r):
                res += "nroot(\(nodesToEval(n)),\(nodesToEval(r)))"
            case .power(let b, let e):
                res += "((\(nodesToEval(b)))^(\(nodesToEval(e))))"
            case .logBase(let b, let a):
                res += "logbase(\(nodesToEval(b)),\(nodesToEval(a)))"
            case .derivative(let e, let a):
                res += "deriv(\(nodesToEval(e)),\(nodesToEval(a)))"
            case .integral(let e, let l, let u):
                res += "integ(\(nodesToEval(e)),\(nodesToEval(l)),\(nodesToEval(u)))"
            case .sum(let e, let l, let u):
                res += "summation(\(nodesToEval(e)),\(nodesToEval(l)),\(nodesToEval(u)))"
            case .product(let e, let l, let u):
                res += "product(\(nodesToEval(e)),\(nodesToEval(l)),\(nodesToEval(u)))"
            case .abs(let e):
                res += "abs(\(nodesToEval(e)))"
            }
        }
        return res
    }
}

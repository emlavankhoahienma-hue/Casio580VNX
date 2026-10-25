import Foundation

public struct EvaluationResult: Equatable {
    public var decimalValue: Double
    public var exactDisplay: String
    public var decimalDisplay: String
    public var dmsDisplay: String
    public var primeFactDisplay: String?
    public var remainderDisplay: String? // for ÷R: "Q=..., R=..."
    public var isError: Bool = false
    public var error: CasioError? = nil
    
    public init(
        decimalValue: Double,
        exactDisplay: String,
        decimalDisplay: String,
        dmsDisplay: String = "",
        primeFactDisplay: String? = nil,
        remainderDisplay: String? = nil,
        isError: Bool = false,
        error: CasioError? = nil
    ) {
        self.decimalValue = decimalValue
        self.exactDisplay = exactDisplay
        self.decimalDisplay = decimalDisplay
        self.dmsDisplay = dmsDisplay
        self.primeFactDisplay = primeFactDisplay
        self.remainderDisplay = remainderDisplay
        self.isError = isError
        self.error = error
    }
}

public class MathEvaluator {
    public static let shared = MathEvaluator()
    
    public enum AngleUnit: String, CaseIterable {
        case degree = "D"
        case radian = "R"
        case gradian = "G"
    }
    
    public var angleUnit: AngleUnit = .degree
    public var fixDigits: Int? = nil // nil = Norm, 0-9 = Fix
    public var sciDigits: Int? = nil // nil = Norm, 0-9 = Sci
    public var normMode: Int = 1     // Norm 1 or Norm 2
    
    // Variables storage (A, B, C, D, E, F, x, y, M, Ans, PreAns)
    public var variables: [String: Double] = [
        "A": 0.0, "B": 0.0, "C": 0.0, "D": 0.0, "E": 0.0, "F": 0.0,
        "x": 0.0, "y": 0.0, "M": 0.0, "Ans": 0.0, "PreAns": 0.0
    ]
    
    public init() {}
    
    // Convert angle to radians for swift standard math functions
    public func toRadians(_ angle: Double) -> Double {
        switch angleUnit {
        case .degree: return angle * .pi / 180.0
        case .radian: return angle
        case .gradian: return angle * .pi / 200.0
        }
    }
    
    // Convert radians back to current angle unit
    public func fromRadians(_ rad: Double) -> Double {
        switch angleUnit {
        case .degree: return rad * 180.0 / .pi
        case .radian: return rad
        case .gradian: return rad * 200.0 / .pi
        }
    }
    
    // GCD helper
    public static func gcd(_ a: Int64, _ b: Int64) -> Int64 {
        var x = abs(a)
        var y = abs(b)
        while y != 0 {
            let t = y
            y = x % y
            x = t
        }
        return x
    }
    
    // Convert decimal to simplified fraction (exact form)
    public static func toFractionString(_ value: Double, maxDenominator: Int64 = 10000) -> String? {
        if value.isNaN || value.isInfinite { return nil }
        if abs(value) < 1e-11 { return "0" }
        if abs(value - round(value)) < 1e-9 {
            return String(Int64(round(value)))
        }
        
        let sign = value < 0 ? "-" : ""
        let v = abs(value)
        
        var bestNum: Int64 = 1
        var bestDen: Int64 = 1
        var minDiff: Double = 1.0
        
        for d in 1...maxDenominator {
            let n = round(v * Double(d))
            let diff = abs(v - n / Double(d))
            if diff < 1e-9 {
                let g = gcd(Int64(n), Int64(d))
                return "\(sign)\(Int64(n) / g)/\(Int64(d) / g)"
            }
            if diff < minDiff {
                minDiff = diff
                bestNum = Int64(n)
                bestDen = Int64(d)
            }
        }
        
        if minDiff < 1e-7 {
            let g = gcd(bestNum, bestDen)
            return "\(sign)\(bestNum / g)/\(bestDen / g)"
        }
        return nil
    }
    
    // Convert to DMS (Degrees, Minutes, Seconds)
    public func formatDMS(_ val: Double) -> String {
        MathEvaluator.toDMSString(val)
    }
    public static func toDMSString(_ val: Double) -> String {
        let isNeg = val < 0
        let absVal = abs(val)
        let deg = Int(absVal)
        let remMinutes = (absVal - Double(deg)) * 60.0
        let minutes = Int(remMinutes)
        let seconds = (remMinutes - Double(minutes)) * 60.0
        let sign = isNeg ? "-" : ""
        return String(format: "%@%d°%d'%0.2f\"", sign, deg, minutes, seconds)
    }
    
    // Prime Factorization (SHIFT + FACT)
    public static func primeFactorization(_ val: Double) -> String? {
        guard val > 1 && val <= 9999999999 && floor(val) == val else { return nil }
        var n = Int64(val)
        var factors: [Int64: Int] = [:]
        
        var d: Int64 = 2
        while d * d <= n {
            while n % d == 0 {
                factors[d, default: 0] += 1
                n /= d
            }
            d += (d == 2 ? 1 : 2)
        }
        if n > 1 {
            factors[n, default: 0] += 1
        }
        
        let sortedKeys = factors.keys.sorted()
        let factorStrings = sortedKeys.map { base in
            let power = factors[base]!
            return power > 1 ? "\(base)^\(power)" : "\(base)"
        }
        return factorStrings.joined(separator: " × ")
    }
    
    // Format decimal according to Fix, Sci, Norm
    public func formatDecimal(_ val: Double) -> String {
        if val.isNaN { return "Math ERROR" }
        if val.isInfinite { return val > 0 ? "∞" : "-∞" }
        if abs(val) < 1e-12 { return "0" }
        
        if let fix = fixDigits {
            return String(format: "%0.\(fix)f", val)
        }
        
        if let sci = sciDigits {
            let formatted = String(format: "%0.\(sci)e", val)
            return formatted.replacingOccurrences(of: "e", with: " ×10^")
        }
        
        // Norm 1 / Norm 2
        let absVal = abs(val)
        let lowerBound = (normMode == 1) ? 1e-2 : 1e-9
        if absVal >= 1e10 || absVal < lowerBound {
            let formatted = String(format: "%0.9e", val)
            return formatted.replacingOccurrences(of: "e+", with: " ×10^").replacingOccurrences(of: "e-", with: " ×10^-")
        } else {
            // Trim trailing zeroes
            var str = String(format: "%0.10f", val)
            while str.contains(".") && (str.hasSuffix("0") || str.hasSuffix(".")) {
                str.removeLast()
            }
            return str
        }
    }
    
    // Main evaluate method from MathDocument
    public func evaluate(document: MathDocument) -> EvaluationResult {
        let rawStr = document.toEvalString()
        if rawStr.trimmingCharacters(in: .whitespaces).isEmpty {
            return EvaluationResult(decimalValue: 0, exactDisplay: "0", decimalDisplay: "0")
        }
        
        // Check for ÷R pattern (Quotient with remainder)
        if rawStr.contains("÷R") || rawStr.contains("//R") {
            let parts = rawStr.components(separatedBy: "÷R")
            if parts.count == 2, let a = evaluateString(parts[0]), let b = evaluateString(parts[1]) {
                if b == 0 {
                    return EvaluationResult(decimalValue: 0, exactDisplay: "Math ERROR", decimalDisplay: "Math ERROR", isError: true, error: .mathError)
                }
                let q = Int64(a / b)
                let r = Int64(a.truncatingRemainder(dividingBy: b))
                let remStr = "Q = \(q), R = \(r)"
                return EvaluationResult(decimalValue: a / b, exactDisplay: remStr, decimalDisplay: formatDecimal(a / b), remainderDisplay: remStr)
            }
        }
        
        do {
            let val = try evaluateExpression(rawStr)
            variables["PreAns"] = variables["Ans"]
            variables["Ans"] = val
            
            let decDisplay = formatDecimal(val)
            let exactDisplay = MathEvaluator.toFractionString(val) ?? decDisplay
            let dmsDisplay = MathEvaluator.toDMSString(val)
            let primeFact = MathEvaluator.primeFactorization(val)
            
            return EvaluationResult(
                decimalValue: val,
                exactDisplay: exactDisplay,
                decimalDisplay: decDisplay,
                dmsDisplay: dmsDisplay,
                primeFactDisplay: primeFact
            )
        } catch let err as CasioError {
            return EvaluationResult(decimalValue: 0, exactDisplay: err.titleVi, decimalDisplay: err.titleVi, isError: true, error: err)
        } catch {
            return EvaluationResult(decimalValue: 0, exactDisplay: "Math ERROR", decimalDisplay: "Math ERROR", isError: true, error: .mathError)
        }
    }
    
    public func evaluateString(_ expr: String) -> Double? {
        do {
            return try evaluateExpression(expr)
        } catch {
            return nil
        }
    }
    
    // Tokenizer & Recursive Descent Parser
    public func evaluateExpression(_ expr: String) throws -> Double {
        var clean = expr.replacingOccurrences(of: " ", with: "")
        
        // Handle specialized functions:
        // deriv(f(x), x0)
        if clean.hasPrefix("deriv(") && clean.hasSuffix(")") {
            return try evaluateDerivative(clean)
        }
        // integ(f(x), a, b)
        if clean.hasPrefix("integ(") && clean.hasSuffix(")") {
            return try evaluateIntegral(clean)
        }
        // summation(f(x), a, b)
        if clean.hasPrefix("summation(") && clean.hasSuffix(")") {
            return try evaluateSummation(clean)
        }
        // product(f(x), a, b)
        if clean.hasPrefix("product(") && clean.hasSuffix(")") {
            return try evaluateProduct(clean)
        }
        
        // Substitute variables
        for (varName, varVal) in variables {
            clean = clean.replacingOccurrences(of: varName, with: "(\(varVal))")
        }
        
        let parser = ExpressionParser(text: clean, evaluator: self)
        return try parser.parse()
    }
    
    // Calculus: Numerical Derivative
    private func evaluateDerivative(_ text: String) throws -> Double {
        // format: deriv(expr, atVal)
        let inner = String(text.dropFirst(6).dropLast(1))
        let parts = splitTopLevel(inner, separator: ",")
        guard parts.count == 2 else { throw CasioError.syntaxError(index: 0) }
        
        let expr = parts[0]
        let x0 = try evaluateExpression(parts[1])
        let h = 1e-6
        
        let savedX = variables["x"] ?? 0.0
        defer { variables["x"] = savedX }
        
        variables["x"] = x0 + h
        let fPlus = try evaluateExpression(expr)
        
        variables["x"] = x0 - h
        let fMinus = try evaluateExpression(expr)
        
        let deriv = (fPlus - fMinus) / (2.0 * h)
        if deriv.isNaN || deriv.isInfinite { throw CasioError.mathError }
        return deriv
    }
    
    // Calculus: Numerical Definite Integral (Simpson's composite 3/8 rule)
    private func evaluateIntegral(_ text: String) throws -> Double {
        let inner = String(text.dropFirst(6).dropLast(1))
        let parts = splitTopLevel(inner, separator: ",")
        guard parts.count == 3 else { throw CasioError.syntaxError(index: 0) }
        
        let expr = parts[0]
        let a = try evaluateExpression(parts[1])
        let b = try evaluateExpression(parts[2])
        if a == b { return 0.0 }
        
        let savedX = variables["x"] ?? 0.0
        defer { variables["x"] = savedX }
        
        let n = 120 // steps
        let h = (b - a) / Double(n)
        var sum = 0.0
        
        variables["x"] = a
        sum += try evaluateExpression(expr)
        variables["x"] = b
        sum += try evaluateExpression(expr)
        
        for i in 1..<n {
            variables["x"] = a + Double(i) * h
            let val = try evaluateExpression(expr)
            sum += (i % 2 == 0) ? 2.0 * val : 4.0 * val
        }
        
        let res = sum * h / 3.0
        if res.isNaN || res.isInfinite { throw CasioError.mathError }
        return res
    }
    
    // Summation Σ
    private func evaluateSummation(_ text: String) throws -> Double {
        let inner = String(text.dropFirst(10).dropLast(1))
        let parts = splitTopLevel(inner, separator: ",")
        guard parts.count == 3 else { throw CasioError.syntaxError(index: 0) }
        
        let expr = parts[0]
        let a = Int(try evaluateExpression(parts[1]))
        let b = Int(try evaluateExpression(parts[2]))
        guard a <= b, (b - a) <= 10000 else { throw CasioError.argumentError }
        
        let savedX = variables["x"] ?? 0.0
        defer { variables["x"] = savedX }
        
        var total = 0.0
        for i in a...b {
            variables["x"] = Double(i)
            total += try evaluateExpression(expr)
        }
        return total
    }
    
    // Product ∏
    private func evaluateProduct(_ text: String) throws -> Double {
        let inner = String(text.dropFirst(8).dropLast(1))
        let parts = splitTopLevel(inner, separator: ",")
        guard parts.count == 3 else { throw CasioError.syntaxError(index: 0) }
        
        let expr = parts[0]
        let a = Int(try evaluateExpression(parts[1]))
        let b = Int(try evaluateExpression(parts[2]))
        guard a <= b, (b - a) <= 1000 else { throw CasioError.argumentError }
        
        let savedX = variables["x"] ?? 0.0
        defer { variables["x"] = savedX }
        
        var total = 1.0
        for i in a...b {
            variables["x"] = Double(i)
            total *= try evaluateExpression(expr)
        }
        return total
    }
    
    private func splitTopLevel(_ str: String, separator: Character) -> [String] {
        var res: [String] = []
        var current = ""
        var depth = 0
        for ch in str {
            if ch == "(" { depth += 1 }
            else if ch == ")" { depth -= 1 }
            
            if ch == separator && depth == 0 {
                res.append(current)
                current = ""
            } else {
                current.append(ch)
            }
        }
        res.append(current)
        return res
    }
}

// MARK: - Mathematical Expression Parser
class ExpressionParser {
    let text: String
    var index: String.Index
    let evaluator: MathEvaluator
    
    init(text: String, evaluator: MathEvaluator) {
        self.text = text
        self.index = text.startIndex
        self.evaluator = evaluator
    }
    
    func parse() throws -> Double {
        let val = try parseAddSub()
        if index != text.endIndex {
            throw CasioError.syntaxError(index: text.distance(from: text.startIndex, to: index))
        }
        return val
    }
    
    private func peek() -> Character? {
        return index < text.endIndex ? text[index] : nil
    }
    
    private func advance() {
        if index < text.endIndex {
            index = text.index(after: index)
        }
    }
    
    private func match(_ str: String) -> Bool {
        let remaining = text[index...]
        if remaining.hasPrefix(str) {
            index = text.index(index, offsetBy: str.count)
            return true
        }
        return false
    }
    
    // Add & Subtract
    private func parseAddSub() throws -> Double {
        var left = try parseMulDiv()
        while let ch = peek(), ch == "+" || ch == "-" {
            advance()
            let right = try parseMulDiv()
            if ch == "+" {
                left += right
            } else {
                left -= right
            }
        }
        return left
    }
    
    // Multiply, Divide, Modulo, nPr, nCr
    private func parseMulDiv() throws -> Double {
        var left = try parsePower()
        while let ch = peek(), ch == "*" || ch == "/" || ch == "P" || ch == "C" || ch == "%" {
            advance()
            let right = try parsePower()
            if ch == "*" {
                left *= right
            } else if ch == "/" {
                if right == 0 { throw CasioError.mathError }
                left /= right
            } else if ch == "P" { // nPr
                left = try permutation(n: left, r: right)
            } else if ch == "C" { // nCr
                left = try combination(n: left, r: right)
            } else if ch == "%" {
                left = left * (right / 100.0)
            }
        }
        return left
    }
    
    // Power (right-associative: 2^3^2 = 2^9)
    private func parsePower() throws -> Double {
        var base = try parseUnary()
        if peek() == "^" {
            advance()
            let exp = try parsePower()
            let res = pow(base, exp)
            if res.isNaN || res.isInfinite { throw CasioError.mathError }
            base = res
        }
        return base
    }
    
    // Unary plus/minus and Factorial
    private func parseUnary() throws -> Double {
        if peek() == "+" {
            advance()
            return try parseUnary()
        }
        if peek() == "-" {
            advance()
            return -1.0 * (try parseUnary())
        }
        
        var val = try parsePrimary()
        
        // Postfix operators like ! (factorial) or ° (degrees)
        while let ch = peek(), ch == "!" || ch == "°" {
            advance()
            if ch == "!" {
                val = try factorial(val)
            } else if ch == "°" {
                val = evaluator.toRadians(val)
            }
        }
        return val
    }
    
    // Primary: numbers, parentheses, functions
    private func parsePrimary() throws -> Double {
        if peek() == "(" {
            advance()
            let res = try parseAddSub()
            if peek() == ")" {
                advance()
            } else {
                throw CasioError.syntaxError(index: text.distance(from: text.startIndex, to: index))
            }
            return res
        }
        
        // Functions
        if match("sin(") {
            let arg = try parseAddSub()
            try expect(")")
            return sin(evaluator.toRadians(arg))
        }
        if match("cos(") {
            let arg = try parseAddSub()
            try expect(")")
            return cos(evaluator.toRadians(arg))
        }
        if match("tan(") {
            let arg = try parseAddSub()
            try expect(")")
            let rad = evaluator.toRadians(arg)
            let c = cos(rad)
            if abs(c) < 1e-12 { throw CasioError.mathError }
            return tan(rad)
        }
        if match("asin(") || match("sin^-1(") {
            let arg = try parseAddSub()
            try expect(")")
            if arg < -1.0 || arg > 1.0 { throw CasioError.mathError }
            return evaluator.fromRadians(asin(arg))
        }
        if match("acos(") || match("cos^-1(") {
            let arg = try parseAddSub()
            try expect(")")
            if arg < -1.0 || arg > 1.0 { throw CasioError.mathError }
            return evaluator.fromRadians(acos(arg))
        }
        if match("atan(") || match("tan^-1(") {
            let arg = try parseAddSub()
            try expect(")")
            return evaluator.fromRadians(atan(arg))
        }
        if match("sinh(") {
            let arg = try parseAddSub()
            try expect(")")
            return sinh(arg)
        }
        if match("cosh(") {
            let arg = try parseAddSub()
            try expect(")")
            return cosh(arg)
        }
        if match("tanh(") {
            let arg = try parseAddSub()
            try expect(")")
            return tanh(arg)
        }
        if match("asinh(") || match("sinh^-1(") {
            let arg = try parseAddSub()
            try expect(")")
            return asinh(arg)
        }
        if match("acosh(") || match("cosh^-1(") {
            let arg = try parseAddSub()
            try expect(")")
            if arg < 1.0 { throw CasioError.mathError }
            return acosh(arg)
        }
        if match("atanh(") || match("tanh^-1(") {
            let arg = try parseAddSub()
            try expect(")")
            if arg <= -1.0 || arg >= 1.0 { throw CasioError.mathError }
            return atanh(arg)
        }
        if match("sqrt(") {
            let arg = try parseAddSub()
            try expect(")")
            if arg < 0 { throw CasioError.mathError }
            return sqrt(arg)
        }
        if match("nroot(") {
            let n = try parseAddSub()
            try expect(",")
            let r = try parseAddSub()
            try expect(")")
            if r < 0 && Int(n) % 2 == 0 { throw CasioError.mathError }
            return pow(r, 1.0 / n)
        }
        if match("log(") {
            let arg = try parseAddSub()
            try expect(")")
            if arg <= 0 { throw CasioError.mathError }
            return log10(arg)
        }
        if match("ln(") {
            let arg = try parseAddSub()
            try expect(")")
            if arg <= 0 { throw CasioError.mathError }
            return log(arg)
        }
        if match("logbase(") {
            let base = try parseAddSub()
            try expect(",")
            let arg = try parseAddSub()
            try expect(")")
            if base <= 0 || base == 1 || arg <= 0 { throw CasioError.mathError }
            return log(arg) / log(base)
        }
        if match("abs(") {
            let arg = try parseAddSub()
            try expect(")")
            return abs(arg)
        }
        
        // Number literal
        let numStart = index
        var hasDot = false
        while let ch = peek(), ch.isNumber || ch == "." {
            if ch == "." {
                if hasDot { break }
                hasDot = true
            }
            advance()
        }
        
        if numStart < index {
            let numStr = String(text[numStart..<index])
            if let val = Double(numStr) {
                return val
            }
        }
        
        throw CasioError.syntaxError(index: text.distance(from: text.startIndex, to: index))
    }
    
    private func expect(_ str: String) throws {
        if !match(str) {
            throw CasioError.syntaxError(index: text.distance(from: text.startIndex, to: index))
        }
    }
    
    private func factorial(_ n: Double) throws -> Double {
        if n < 0 || floor(n) != n || n > 69 { throw CasioError.mathError }
        let k = Int(n)
        if k == 0 || k == 1 { return 1.0 }
        var res = 1.0
        for i in 2...k {
            res *= Double(i)
        }
        return res
    }
    
    private func permutation(n: Double, r: Double) throws -> Double {
        if n < 0 || r < 0 || r > n || floor(n) != n || floor(r) != r { throw CasioError.mathError }
        let num = try factorial(n)
        let den = try factorial(n - r)
        return num / den
    }
    
    private func combination(n: Double, r: Double) throws -> Double {
        if n < 0 || r < 0 || r > n || floor(n) != n || floor(r) != r { throw CasioError.mathError }
        let num = try factorial(n)
        let den = (try factorial(r)) * (try factorial(n - r))
        return num / den
    }
}

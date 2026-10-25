import Foundation

public struct ComplexNumber: Equatable, Hashable {
    public var real: Double
    public var imag: Double
    
    public init(real: Double, imag: Double = 0.0) {
        self.real = real
        self.imag = imag
    }
    
    public var magnitude: Double { sqrt(real * real + imag * imag) }
    public var argument: Double { atan2(imag, real) }
    
    public func display(unit: MathEvaluator.AngleUnit = .degree) -> String {
        if abs(imag) < 1e-10 {
            return String(format: "%g", real)
        }
        if abs(real) < 1e-10 {
            return abs(imag - 1.0) < 1e-10 ? "i" : (abs(imag + 1.0) < 1e-10 ? "-i" : String(format: "%gi", imag))
        }
        let sign = imag >= 0 ? "+" : "-"
        let absImg = abs(imag)
        let imgStr = abs(absImg - 1.0) < 1e-10 ? "i" : String(format: "%gi", absImg)
        return String(format: "%g %@ %@", real, sign, imgStr)
    }
    
    public func polarDisplay(unit: MathEvaluator.AngleUnit = .degree) -> String {
        let r = magnitude
        var theta = argument
        if unit == .degree { theta = theta * 180.0 / .pi }
        else if unit == .gradian { theta = theta * 200.0 / .pi }
        return String(format: "%g ∠ %g", r, theta)
    }
}

public class EquationSolver {
    public static let shared = EquationSolver()
    
    // MARK: - Simultaneous Linear Equations (2, 3, 4 Unknowns)
    public enum SimultaneousResult {
        case unique(solutions: [String: Double])
        case infiniteSolutions
        case noSolution
    }
    
    public static func solveSimultaneous(matrix a: [[Double]], constants b: [Double]) -> SimultaneousResult {
        let n = a.count
        guard n == b.count && n >= 2 && n <= 4 else { return .noSolution }
        
        var aug = [[Double]]()
        for i in 0..<n {
            aug.append(a[i] + [b[i]])
        }
        
        // Gaussian elimination with partial pivoting
        for i in 0..<n {
            var pivotRow = i
            var maxVal = abs(aug[i][i])
            for k in (i + 1)..<n {
                if abs(aug[k][i]) > maxVal {
                    maxVal = abs(aug[k][i])
                    pivotRow = k
                }
            }
            
            if maxVal < 1e-12 {
                // Check consistency
                var hasContradiction = false
                for r in i..<n {
                    let allZeros = aug[r][0..<n].allSatisfy { abs($0) < 1e-12 }
                    if allZeros && abs(aug[r][n]) > 1e-12 {
                        hasContradiction = true
                        break
                    }
                }
                return hasContradiction ? .noSolution : .infiniteSolutions
            }
            
            if pivotRow != i {
                aug.swapAt(i, pivotRow)
            }
            
            let pivot = aug[i][i]
            for j in i...n {
                aug[i][j] /= pivot
            }
            
            for k in 0..<n {
                if k != i {
                    let factor = aug[k][i]
                    for j in i...n {
                        aug[k][j] -= factor * aug[i][j]
                    }
                }
            }
        }
        
        var res: [String: Double] = [:]
        let varNames = ["x", "y", "z", "t"]
        for i in 0..<n {
            res[varNames[i]] = aug[i][n]
        }
        return .unique(solutions: res)
    }
    
    // MARK: - Polynomial Equations (Degree 2, 3, 4)
    public struct PolynomialResult {
        public var roots: [ComplexNumber]
        // For degree 2: Vertex
        public var vertexX: Double? = nil
        public var vertexY: Double? = nil
        public var isMinimum: Bool? = nil
    }
    
    // Degree 2: ax^2 + bx + c = 0
    public static func solveQuadratic(a: Double, b: Double, c: Double) throws -> PolynomialResult {
        if abs(a) < 1e-12 { throw CasioError.mathError }
        let delta = b * b - 4.0 * a * c
        var roots: [ComplexNumber] = []
        
        if delta > 1e-12 {
            let x1 = (-b + sqrt(delta)) / (2.0 * a)
            let x2 = (-b - sqrt(delta)) / (2.0 * a)
            roots = [ComplexNumber(real: x1), ComplexNumber(real: x2)]
        } else if abs(delta) <= 1e-12 {
            let x0 = -b / (2.0 * a)
            roots = [ComplexNumber(real: x0)]
        } else {
            let realPart = -b / (2.0 * a)
            let imgPart = sqrt(-delta) / (2.0 * a)
            roots = [
                ComplexNumber(real: realPart, imag: abs(imgPart)),
                ComplexNumber(real: realPart, imag: -abs(imgPart))
            ]
        }
        
        let vx = -b / (2.0 * a)
        let vy = c - (b * b) / (4.0 * a)
        let isMin = a > 0
        
        return PolynomialResult(roots: roots, vertexX: vx, vertexY: vy, isMinimum: isMin)
    }
    
    // Degree 3: ax^3 + bx^2 + cx + d = 0
    public static func solveCubic(a: Double, b: Double, c: Double, d: Double) throws -> PolynomialResult {
        if abs(a) < 1e-12 { throw CasioError.mathError }
        // Cardano's method
        let p = (3.0 * a * c - b * b) / (3.0 * a * a)
        let q = (2.0 * b * b * b - 9.0 * a * b * c + 27.0 * a * a * d) / (27.0 * a * a * a)
        let shift = b / (3.0 * a)
        
        let disc = (q * q / 4.0) + (p * p * p / 27.0)
        var roots: [ComplexNumber] = []
        
        if disc > 1e-12 {
            let u3 = -q / 2.0 + sqrt(disc)
            let v3 = -q / 2.0 - sqrt(disc)
            let u = u3 >= 0 ? pow(u3, 1.0 / 3.0) : -pow(-u3, 1.0 / 3.0)
            let v = v3 >= 0 ? pow(v3, 1.0 / 3.0) : -pow(-v3, 1.0 / 3.0)
            
            let r1 = u + v - shift
            let realPart = -(u + v) / 2.0 - shift
            let imgPart = (u - v) * sqrt(3.0) / 2.0
            
            roots = [
                ComplexNumber(real: r1),
                ComplexNumber(real: realPart, imag: abs(imgPart)),
                ComplexNumber(real: realPart, imag: -abs(imgPart))
            ]
        } else if abs(disc) <= 1e-12 {
            let u = q >= 0 ? -pow(q / 2.0, 1.0 / 3.0) : pow(-q / 2.0, 1.0 / 3.0)
            let r1 = 2.0 * u - shift
            let r2 = -u - shift
            roots = [ComplexNumber(real: r1), ComplexNumber(real: r2)]
        } else {
            // Three real roots (Casus irreducibilis)
            let r = sqrt(-p * p * p / 27.0)
            let phi = acos(-q / (2.0 * r))
            let m = 2.0 * pow(r, 1.0 / 3.0)
            
            let r1 = m * cos(phi / 3.0) - shift
            let r2 = m * cos((phi + 2.0 * .pi) / 3.0) - shift
            let r3 = m * cos((phi + 4.0 * .pi) / 3.0) - shift
            roots = [ComplexNumber(real: r1), ComplexNumber(real: r2), ComplexNumber(real: r3)]
        }
        
        return PolynomialResult(roots: roots)
    }
    
    // Degree 4: ax^4 + bx^3 + cx^2 + dx + e = 0
    public static func solveQuartic(a: Double, b: Double, c: Double, d: Double, e: Double) throws -> PolynomialResult {
        if abs(a) < 1e-12 { throw CasioError.mathError }
        // Durand-Kerner numerical root finder for degree 4
        let p3 = b / a
        let p2 = c / a
        let p1 = d / a
        let p0 = e / a
        
        // Initial roots approximations
        var z: [(r: Double, i: Double)] = [
            (0.4, 0.9), (-0.4, 0.9), (-0.9, -0.4), (0.9, -0.4)
        ]
        
        for _ in 0..<100 {
            for i in 0..<4 {
                let zi = z[i]
                // Compute P(zi)
                let pz = evalQuartic(zi, p3: p3, p2: p2, p1: p1, p0: p0)
                // Compute prod (zi - zj)
                var prod = (r: 1.0, i: 0.0)
                for j in 0..<4 {
                    if i != j {
                        let diff = (r: zi.r - z[j].r, i: zi.i - z[j].i)
                        prod = cMul(prod, diff)
                    }
                }
                let delta = cDiv(pz, prod)
                z[i] = (r: zi.r - delta.r, i: zi.i - delta.i)
            }
        }
        
        let roots = z.map { c -> ComplexNumber in
            let re = abs(c.r) < 1e-10 ? 0.0 : c.r
            let im = abs(c.i) < 1e-10 ? 0.0 : c.i
            return ComplexNumber(real: re, imag: im)
        }
        return PolynomialResult(roots: roots)
    }
    
    private static func cMul(_ a: (r: Double, i: Double), _ b: (r: Double, i: Double)) -> (r: Double, i: Double) {
        return (r: a.r * b.r - a.i * b.i, i: a.r * b.i + a.i * b.r)
    }
    
    private static func cDiv(_ a: (r: Double, i: Double), _ b: (r: Double, i: Double)) -> (r: Double, i: Double) {
        let den = b.r * b.r + b.i * b.i
        return (r: (a.r * b.r + a.i * b.i) / den, i: (a.i * b.r - a.r * b.i) / den)
    }
    
    private static func evalQuartic(_ z: (r: Double, i: Double), p3: Double, p2: Double, p1: Double, p0: Double) -> (r: Double, i: Double) {
        // z^4 + p3 z^3 + p2 z^2 + p1 z + p0
        let z2 = cMul(z, z)
        let z3 = cMul(z2, z)
        let z4 = cMul(z2, z2)
        return (
            r: z4.r + p3 * z3.r + p2 * z2.r + p1 * z.r + p0,
            i: z4.i + p3 * z3.i + p2 * z2.i + p1 * z.i
        )
    }
    
    // MARK: - Inequalities (Bất phương trình bậc 2)
    public enum InequalityType: String {
        case gt = ">"
        case lt = "<"
        case ge = "≥"
        case le = "≤"
    }
    
    public static func solveQuadraticInequality(a: Double, b: Double, c: Double, type: InequalityType) throws -> String {
        let res = try solveQuadratic(a: a, b: b, c: c)
        let realRoots = res.roots.filter { abs($0.imag) < 1e-9 }.map { $0.real }.sorted()
        
        let leadPos = a > 0
        if realRoots.count == 2 {
            let r1 = String(format: "%g", realRoots[0])
            let r2 = String(format: "%g", realRoots[1])
            switch type {
            case .gt:
                return leadPos ? "x < \(r1) , \(r2) < x" : "\(r1) < x < \(r2)"
            case .ge:
                return leadPos ? "x ≤ \(r1) , \(r2) ≤ x" : "\(r1) ≤ x ≤ \(r2)"
            case .lt:
                return leadPos ? "\(r1) < x < \(r2)" : "x < \(r1) , \(r2) < x"
            case .le:
                return leadPos ? "\(r1) ≤ x ≤ \(r2)" : "x ≤ \(r1) , \(r2) ≤ x"
            }
        } else if realRoots.count == 1 {
            let r0 = String(format: "%g", realRoots[0])
            switch type {
            case .gt: return leadPos ? "Tất cả thực trừ \(r0)" : "Vô nghiệm"
            case .ge: return leadPos ? "Tất cả số thực" : "x = \(r0)"
            case .lt: return leadPos ? "Vô nghiệm" : "Tất cả thực trừ \(r0)"
            case .le: return leadPos ? "x = \(r0)" : "Tất cả số thực"
            }
        } else {
            // No real roots
            switch type {
            case .gt, .ge: return leadPos ? "Tất cả số thực" : "Vô nghiệm"
            case .lt, .le: return leadPos ? "Vô nghiệm" : "Tất cả số thực"
            }
        }
    }
    
    // MARK: - Ratio (Tỷ lệ thức)
    public static func solveRatio(a: Double, b: Double, c: Double?, d: Double?, findXAt: Int) throws -> Double {
        if findXAt == 1 { // A : B = X : D => X = A * D / B
            guard let d = d, abs(b) > 1e-12 else { throw CasioError.mathError }
            return a * d / b
        } else { // A : B = C : X => X = B * C / A
            guard let c = c, abs(a) > 1e-12 else { throw CasioError.mathError }
            return b * c / a
        }
    }
    
    // MARK: - Numerical SOLVE (Newton-Raphson)
    public struct SolveResult {
        public var x: Double
        public var leftMinusRight: Double
    }
    
    public static func solveEquation(
        expression: String,
        initialGuess: Double = 0.0,
        evaluator: MathEvaluator = .shared
    ) throws -> SolveResult {
        // Equation may contain '='
        var leftExpr = expression
        var rightExpr = "0"
        if expression.contains("=") {
            let parts = expression.components(separatedBy: "=")
            leftExpr = parts[0]
            rightExpr = parts[1]
        }
        
        let f: (Double) throws -> Double = { xVal in
            evaluator.variables["x"] = xVal
            let left = try evaluator.evaluateExpression(leftExpr)
            let right = try evaluator.evaluateExpression(rightExpr)
            return left - right
        }
        
        var x = initialGuess
        let h = 1e-5
        let maxIter = 100
        let tol = 1e-9
        
        for _ in 0..<maxIter {
            let fx = try f(x)
            if abs(fx) < tol {
                return SolveResult(x: x, leftMinusRight: fx)
            }
            let fxh = try f(x + h)
            let df = (fxh - fx) / h
            if abs(df) < 1e-12 {
                x += 0.1 // perturb
                continue
            }
            let nextX = x - fx / df
            if abs(nextX - x) < tol {
                let finalRes = try f(nextX)
                return SolveResult(x: nextX, leftMinusRight: finalRes)
            }
            x = nextX
        }
        
        // Final attempt
        let res = try f(x)
        if abs(res) < 1e-4 {
            return SolveResult(x: x, leftMinusRight: res)
        }
        throw CasioError.cantSolve
    }
}

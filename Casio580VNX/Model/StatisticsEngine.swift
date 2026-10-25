import Foundation

public struct StatisticsSummary {
    public var n: Int = 0
    public var meanX: Double = 0.0
    public var sumX: Double = 0.0
    public var sumX2: Double = 0.0
    public var sigmaX: Double = 0.0 // population std dev
    public var sX: Double = 0.0     // sample std dev
    public var minX: Double = 0.0
    public var q1: Double = 0.0
    public var med: Double = 0.0
    public var q3: Double = 0.0
    public var maxX: Double = 0.0
    
    // For 2-Variable regressions:
    public var meanY: Double? = nil
    public var sumY: Double? = nil
    public var sumY2: Double? = nil
    public var sumXY: Double? = nil
    public var a: Double? = nil     // regression const
    public var b: Double? = nil     // regression coeff
    public var c: Double? = nil     // for quadratic regression
    public var r: Double? = nil     // correlation coefficient
}

public class StatisticsEngine {
    public static let shared = StatisticsEngine()
    
    // MARK: - 1-Variable Statistics
    public static func compute1Var(data: [Double], frequencies: [Int]? = nil) -> StatisticsSummary {
        var expanded: [Double] = []
        if let freqs = frequencies, freqs.count == data.count {
            for (val, freq) in zip(data, freqs) {
                expanded.append(contentsOf: Array(repeating: val, count: max(1, freq)))
            }
        } else {
            expanded = data
        }
        
        let n = expanded.count
        guard n > 0 else { return StatisticsSummary() }
        let sorted = expanded.sorted()
        
        let sumX = sorted.reduce(0.0, +)
        let meanX = sumX / Double(n)
        let sumX2 = sorted.reduce(0.0) { $0 + $1 * $1 }
        
        let variancePop = sorted.reduce(0.0) { $0 + pow($1 - meanX, 2) } / Double(n)
        let sigmaX = sqrt(variancePop)
        let sX = n > 1 ? sqrt(sorted.reduce(0.0) { $0 + pow($1 - meanX, 2) } / Double(n - 1)) : 0.0
        
        let minX = sorted.first ?? 0.0
        let maxX = sorted.last ?? 0.0
        let med = percentile(sorted, p: 0.5)
        let q1 = percentile(sorted, p: 0.25)
        let q3 = percentile(sorted, p: 0.75)
        
        return StatisticsSummary(
            n: n,
            meanX: meanX,
            sumX: sumX,
            sumX2: sumX2,
            sigmaX: sigmaX,
            sX: sX,
            minX: minX,
            q1: q1,
            med: med,
            q3: q3,
            maxX: maxX
        )
    }
    
    private static func percentile(_ sorted: [Double], p: Double) -> Double {
        if sorted.isEmpty { return 0.0 }
        let idx = p * Double(sorted.count - 1)
        let lower = Int(floor(idx))
        let upper = Int(ceil(idx))
        if lower == upper { return sorted[lower] }
        return sorted[lower] + (sorted[upper] - sorted[lower]) * (idx - Double(lower))
    }
    
    // MARK: - 2-Variable Linear Regression (y = a + bx)
    public static func computeLinearRegression(x: [Double], y: [Double]) -> StatisticsSummary? {
        let n = min(x.count, y.count)
        guard n >= 2 else { return nil }
        
        let sumX = x.prefix(n).reduce(0.0, +)
        let sumY = y.prefix(n).reduce(0.0, +)
        let meanX = sumX / Double(n)
        let meanY = sumY / Double(n)
        
        var sxx = 0.0
        var syy = 0.0
        var sxy = 0.0
        for i in 0..<n {
            let dx = x[i] - meanX
            let dy = y[i] - meanY
            sxx += dx * dx
            syy += dy * dy
            sxy += dx * dy
        }
        guard sxx > 1e-12 else { return nil }
        
        let b = sxy / sxx
        let a = meanY - b * meanX
        let r = (sxx > 0 && syy > 0) ? (sxy / sqrt(sxx * syy)) : 0.0
        
        var summary = compute1Var(data: Array(x.prefix(n)))
        summary.meanY = meanY
        summary.sumY = sumY
        summary.sumXY = zip(x.prefix(n), y.prefix(n)).reduce(0.0) { $0 + $1.0 * $1.1 }
        summary.a = a
        summary.b = b
        summary.r = r
        return summary
    }
    
    // MARK: - Mode 7: Distributions
    public static func normalPD(x: Double, mean: Double = 0.0, sigma: Double = 1.0) throws -> Double {
        if sigma <= 0 { throw CasioError.mathError }
        let coef = 1.0 / (sigma * sqrt(2.0 * .pi))
        let exponent = -pow(x - mean, 2) / (2.0 * sigma * sigma)
        return coef * exp(exponent)
    }
    
    public static func normalCD(lower: Double, upper: Double, mean: Double = 0.0, sigma: Double = 1.0) throws -> Double {
        if sigma <= 0 { throw CasioError.mathError }
        let cdf: (Double) -> Double = { z in
            0.5 * (1.0 + erf((z - mean) / (sigma * sqrt(2.0))))
        }
        return cdf(upper) - cdf(lower)
    }
    
    public static func inverseNormal(area: Double, mean: Double = 0.0, sigma: Double = 1.0) throws -> Double {
        if area <= 0.0 || area >= 1.0 || sigma <= 0 { throw CasioError.mathError }
        // Rational approximation for inverse normal CDF (Beasley-Springer-Moro)
        let p = area
        let t = sqrt(-2.0 * log(p < 0.5 ? p : 1.0 - p))
        let c0 = 2.515517
        let c1 = 0.802853
        let c2 = 0.010328
        let d1 = 1.432788
        let d2 = 0.189269
        let d3 = 0.001308
        var z = t - ((c2 * t + c1) * t + c0) / (((d3 * t + d2) * t + d1) * t + 1.0)
        if p < 0.5 { z = -z }
        return mean + z * sigma
    }
    
    public static func binomialPD(x: Int, n: Int, p: Double) throws -> Double {
        if x < 0 || x > n || p < 0.0 || p > 1.0 { throw CasioError.mathError }
        // nCx * p^x * (1-p)^(n-x)
        var nCx = 1.0
        for i in 1...max(1, x) {
            if x == 0 { break }
            nCx = nCx * Double(n - i + 1) / Double(i)
        }
        return nCx * pow(p, Double(x)) * pow(1.0 - p, Double(n - x))
    }
    
    public static func poissonPD(x: Int, lambda: Double) throws -> Double {
        if x < 0 || lambda <= 0 { throw CasioError.mathError }
        var fact = 1.0
        if x > 1 {
            for i in 2...x { fact *= Double(i) }
        }
        return (pow(lambda, Double(x)) * exp(-lambda)) / fact
    }
    
    public static func binomialCD(x: Int, n: Int, p: Double) throws -> Double {
        var sum = 0.0
        for k in 0...max(0, x) {
            sum += try binomialPD(x: k, n: n, p: p)
        }
        return min(1.0, sum)
    }
    
    public static func poissonCD(x: Int, lambda: Double) throws -> Double {
        var sum = 0.0
        for k in 0...max(0, x) {
            sum += try poissonPD(x: k, lambda: lambda)
        }
        return min(1.0, sum)
    }
    
    // MARK: - Mode 8: Table Generation
    public struct TableRow: Identifiable {
        public var id: Int
        public var x: Double
        public var fx: Double?
        public var gx: Double?
    }
    
    public static func generateTable(
        fExpr: String,
        gExpr: String? = nil,
        start: Double,
        end: Double,
        step: Double,
        evaluator: MathEvaluator = .shared
    ) throws -> [TableRow] {
        if step <= 0 || end < start { throw CasioError.argumentError }
        var rows: [TableRow] = []
        var curX = start
        var idx = 1
        
        let savedX = evaluator.variables["x"] ?? 0.0
        defer { evaluator.variables["x"] = savedX }
        
        while curX <= end + 1e-9 {
            evaluator.variables["x"] = curX
            let fVal = try? evaluator.evaluateExpression(fExpr)
            var gVal: Double? = nil
            if let g = gExpr, !g.isEmpty {
                gVal = try? evaluator.evaluateExpression(g)
            }
            rows.append(TableRow(id: idx, x: curX, fx: fVal, gx: gVal))
            curX += step
            idx += 1
            if rows.count > 100 { break } // Limit to 100 table rows
        }
        return rows
    }
}

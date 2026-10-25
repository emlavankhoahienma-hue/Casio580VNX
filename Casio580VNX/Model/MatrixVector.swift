import Foundation

// MARK: - Matrix Engine (Mode 4: Matrix)
public struct CasioMatrix: Equatable, Hashable {
    public var rows: Int
    public var cols: Int
    public var data: [[Double]] // rows x cols
    
    public init(rows: Int = 3, cols: Int = 3, fill: Double = 0.0) {
        self.rows = max(1, min(4, rows))
        self.cols = max(1, min(4, cols))
        self.data = Array(repeating: Array(repeating: fill, count: self.cols), count: self.rows)
    }
    
    public init(data: [[Double]]) {
        self.rows = data.count
        self.cols = data.first?.count ?? 0
        self.data = data
    }
    
    public subscript(r: Int, c: Int) -> Double {
        get { data[r][c] }
        set { data[r][c] = newValue }
    }
    
    // Matrix addition
    public static func + (lhs: CasioMatrix, rhs: CasioMatrix) throws -> CasioMatrix {
        guard lhs.rows == rhs.rows && lhs.cols == rhs.cols else { throw CasioError.mathError }
        var res = CasioMatrix(rows: lhs.rows, cols: lhs.cols)
        for r in 0..<lhs.rows {
            for c in 0..<lhs.cols {
                res[r, c] = lhs[r, c] + rhs[r, c]
            }
        }
        return res
    }
    
    // Matrix subtraction
    public static func - (lhs: CasioMatrix, rhs: CasioMatrix) throws -> CasioMatrix {
        guard lhs.rows == rhs.rows && lhs.cols == rhs.cols else { throw CasioError.mathError }
        var res = CasioMatrix(rows: lhs.rows, cols: lhs.cols)
        for r in 0..<lhs.rows {
            for c in 0..<lhs.cols {
                res[r, c] = lhs[r, c] - rhs[r, c]
            }
        }
        return res
    }
    
    // Matrix multiplication
    public static func * (lhs: CasioMatrix, rhs: CasioMatrix) throws -> CasioMatrix {
        guard lhs.cols == rhs.rows else { throw CasioError.mathError }
        var res = CasioMatrix(rows: lhs.rows, cols: rhs.cols)
        for r in 0..<lhs.rows {
            for c in 0..<rhs.cols {
                var sum = 0.0
                for k in 0..<lhs.cols {
                    sum += lhs[r, k] * rhs[k, c]
                }
                res[r, c] = sum
            }
        }
        return res
    }
    
    // Scalar multiplication
    public static func * (lhs: Double, rhs: CasioMatrix) -> CasioMatrix {
        var res = CasioMatrix(rows: rhs.rows, cols: rhs.cols)
        for r in 0..<rhs.rows {
            for c in 0..<rhs.cols {
                res[r, c] = lhs * rhs[r, c]
            }
        }
        return res
    }
    
    // Transpose (Trn)
    public func transpose() -> CasioMatrix {
        var res = CasioMatrix(rows: cols, cols: rows)
        for r in 0..<rows {
            for c in 0..<cols {
                res[c, r] = self[r, c]
            }
        }
        return res
    }
    
    // Determinant (Det)
    public func determinant() throws -> Double {
        guard rows == cols else { throw CasioError.mathError }
        return try calcDet(data)
    }
    
    private func calcDet(_ m: [[Double]]) throws -> Double {
        let n = m.count
        if n == 1 { return m[0][0] }
        if n == 2 {
            return m[0][0] * m[1][1] - m[0][1] * m[1][0]
        }
        if n == 3 {
            return m[0][0] * (m[1][1]*m[2][2] - m[1][2]*m[2][1])
                 - m[0][1] * (m[1][0]*m[2][2] - m[1][2]*m[2][0])
                 + m[0][2] * (m[1][0]*m[2][1] - m[1][1]*m[2][0])
        }
        // 4x4 determinant via Laplace expansion
        var det = 0.0
        for j in 0..<n {
            let minor = getMinor(m, row: 0, col: j)
            let sign = (j % 2 == 0) ? 1.0 : -1.0
            det += sign * m[0][j] * (try calcDet(minor))
        }
        return det
    }
    
    private func getMinor(_ m: [[Double]], row: Int, col: Int) -> [[Double]] {
        var res: [[Double]] = []
        for r in 0..<m.count {
            if r == row { continue }
            var rowData: [Double] = []
            for c in 0..<m[r].count {
                if c == col { continue }
                rowData.append(m[r][c])
            }
            res.append(rowData)
        }
        return res
    }
    
    // Inverse (M^-1) via Gauss-Jordan elimination
    public func inverse() throws -> CasioMatrix {
        guard rows == cols else { throw CasioError.mathError }
        let det = try determinant()
        if abs(det) < 1e-12 { throw CasioError.mathError }
        
        let n = rows
        var a = data
        var inv = Array(repeating: Array(repeating: 0.0, count: n), count: n)
        for i in 0..<n { inv[i][i] = 1.0 }
        
        for i in 0..<n {
            var pivot = a[i][i]
            var pivotRow = i
            for k in (i + 1)..<n {
                if abs(a[k][i]) > abs(pivot) {
                    pivot = a[k][i]
                    pivotRow = k
                }
            }
            if abs(pivot) < 1e-12 { throw CasioError.mathError }
            
            // Swap
            if pivotRow != i {
                a.swapAt(i, pivotRow)
                inv.swapAt(i, pivotRow)
            }
            
            let div = a[i][i]
            for j in 0..<n {
                a[i][j] /= div
                inv[i][j] /= div
            }
            
            for k in 0..<n {
                if k != i {
                    let factor = a[k][i]
                    for j in 0..<n {
                        a[k][j] -= factor * a[i][j]
                        inv[k][j] -= factor * inv[i][j]
                    }
                }
            }
        }
        return CasioMatrix(data: inv)
    }
}

// MARK: - Vector Engine (Mode 5: Vector)
public struct CasioVector: Equatable, Hashable {
    public var dim: Int // 2 or 3
    public var components: [Double] // [x, y] or [x, y, z]
    
    public init(dim: Int = 3, components: [Double] = [0, 0, 0]) {
        self.dim = max(2, min(3, dim))
        if components.count >= self.dim {
            self.components = Array(components.prefix(self.dim))
        } else {
            self.components = components + Array(repeating: 0.0, count: self.dim - components.count)
        }
    }
    
    public var x: Double { get { components[0] } set { components[0] = newValue } }
    public var y: Double { get { components[1] } set { components[1] = newValue } }
    public var z: Double { get { components.count > 2 ? components[2] : 0.0 } set { if components.count > 2 { components[2] = newValue } } }
    
    public subscript(index: Int) -> Double {
        get { components[index] }
        set { components[index] = newValue }
    }
    
    public var norm: Double {
        sqrt(components.reduce(0.0) { $0 + $1 * $1 })
    }
    
    // Dot product (Dot)
    public static func dot(_ lhs: CasioVector, _ rhs: CasioVector) throws -> Double {
        guard lhs.dim == rhs.dim else { throw CasioError.mathError }
        var sum = 0.0
        for i in 0..<lhs.dim {
            sum += lhs.components[i] * rhs.components[i]
        }
        return sum
    }
    
    // Cross product (Cross)
    public static func cross(_ lhs: CasioVector, _ rhs: CasioVector) throws -> CasioVector {
        guard lhs.dim == 3 && rhs.dim == 3 else { throw CasioError.mathError }
        let cx = lhs.y * rhs.z - lhs.z * rhs.y
        let cy = lhs.z * rhs.x - lhs.x * rhs.z
        let cz = lhs.x * rhs.y - lhs.y * rhs.x
        return CasioVector(dim: 3, components: [cx, cy, cz])
    }
    
    // Angle between two vectors (in degrees, radians or gradian)
    public static func angle(_ lhs: CasioVector, _ rhs: CasioVector, unit: MathEvaluator.AngleUnit = .degree) throws -> Double {
        guard lhs.dim == rhs.dim else { throw CasioError.mathError }
        let d = try dot(lhs, rhs)
        let mag = lhs.norm * rhs.norm
        if abs(mag) < 1e-12 { throw CasioError.mathError }
        var cosTheta = d / mag
        cosTheta = max(-1.0, min(1.0, cosTheta))
        let rad = acos(cosTheta)
        switch unit {
        case .degree: return rad * 180.0 / .pi
        case .radian: return rad
        case .gradian: return rad * 200.0 / .pi
        }
    }
    
    // Unit Vector (UnitV)
    public func unitVector() throws -> CasioVector {
        let n = norm
        if abs(n) < 1e-12 { throw CasioError.mathError }
        return CasioVector(dim: dim, components: components.map { $0 / n })
    }
}

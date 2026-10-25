import SwiftUI

// MARK: - Casio Key Enumeration & Metadata
public enum CasioKey: String, CaseIterable, Identifiable {
    public var id: String { rawValue }
    
    // Top Row
    case shift = "SHIFT"
    case alpha = "ALPHA"
    case up = "UP"
    case down = "DOWN"
    case left = "LEFT"
    case right = "RIGHT"
    case menu = "MENU"
    case on = "ON"
    
    // Function Row 1
    case optn = "OPTN"
    case calc = "CALC"
    case integral = "∫dx"
    case xMinus1 = "x⁻¹"
    case logBase = "log_■"
    case ln = "ln"
    
    // Function Row 2
    case neg = "(-)"
    case dms = "° ' \""
    case xVar = "x"
    case sin = "sin"
    case cos = "cos"
    case tan = "tan"
    case hyp = "hyp"
    
    // Function Row 3
    case fraction = "a b/c"
    case sqrt = "√"
    case xSquared = "x²"
    case power = "x^■"
    case log = "log"
    
    // Function Row 4
    case sto = "STO"
    case eng = "ENG"
    case leftParen = "("
    case rightParen = ")"
    case sd = "S<=>D"
    case mPlus = "M+"
    
    // Numpad Row 1
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case del = "DEL"
    case ac = "AC"
    
    // Numpad Row 2
    case four = "4"
    case five = "5"
    case six = "6"
    case times = "×"
    case divide = "÷"
    
    // Numpad Row 3
    case one = "1"
    case two = "2"
    case three = "3"
    case plus = "+"
    case minus = "−"
    
    // Bottom Row
    case zero = "0"
    case dot = "•"
    case exp = "×10ˣ"
    case ans = "Ans"
    case equals = "="
    
    // Labels & Colors
    public var mainLabel: String {
        switch self {
        case .shift: return "SHIFT"
        case .alpha: return "ALPHA"
        case .menu: return "MENU"
        case .on: return "ON"
        case .optn: return "OPTN"
        case .calc: return "CALC"
        case .integral: return "∫dx"
        case .xMinus1: return "x⁻¹"
        case .logBase: return "log_■"
        case .ln: return "ln"
        case .neg: return "(-)"
        case .dms: return "° ' \""
        case .xVar: return "x"
        case .sin: return "sin"
        case .cos: return "cos"
        case .tan: return "tan"
        case .hyp: return "hyp"
        case .fraction: return "믐"
        case .sqrt: return "√■"
        case .xSquared: return "x²"
        case .power: return "x^■"
        case .log: return "log"
        case .sto: return "STO"
        case .eng: return "ENG"
        case .leftParen: return "("
        case .rightParen: return ")"
        case .sd: return "S<=>D"
        case .mPlus: return "M+"
        case .del: return "DEL"
        case .ac: return "AC"
        case .times: return "×"
        case .divide: return "÷"
        case .plus: return "+"
        case .minus: return "−"
        case .exp: return "×10ˣ"
        case .ans: return "Ans"
        case .equals: return "="
        case .dot: return "•"
        default: return rawValue
        }
    }
    
    public var shiftLabel: String? {
        switch self {
        case .menu: return "SETUP"
        case .calc: return "SOLVE"
        case .integral: return "d/dx"
        case .xMinus1: return "x!"
        case .logBase: return "Σ"
        case .ln: return "e^■"
        case .dms: return "FACT"
        case .sin: return "sin⁻¹"
        case .cos: return "cos⁻¹"
        case .tan: return "tan⁻¹"
        case .fraction: return "c 믐"
        case .sqrt: return "³√"
        case .power: return "ⁿ√"
        case .log: return "10^■"
        case .sto: return "RCL"
        case .leftParen: return "%"
        case .rightParen: return ","
        case .mPlus: return "M-"
        case .seven: return "CONST"
        case .eight: return "CONV"
        case .nine: return "RESET"
        case .del: return "INS"
        case .ac: return "OFF"
        case .times: return "nPr"
        case .divide: return "nCr"
        case .plus: return "Pol"
        case .minus: return "Rec"
        case .zero: return "Rnd"
        case .dot: return "Ran#"
        case .exp: return "π"
        default: return nil
        }
    }
    
    public var alphaLabel: String? {
        switch self {
        case .calc: return "="
        case .integral: return "∏"
        case .neg: return "A"
        case .dms: return "B"
        case .xVar: return "C"
        case .sin: return "D"
        case .cos: return "E"
        case .tan: return "F"
        case .fraction: return "x"
        case .sqrt: return "y"
        case .xSquared: return "z"
        case .mPlus: return "M"
        case .divide: return "÷R"
        case .dot: return "RanInt#"
        case .exp: return "e"
        default: return nil
        }
    }
    
    public var variableName: String? {
        switch self {
        case .neg: return "A"
        case .dms: return "B"
        case .xVar: return "C"
        case .sin: return "D"
        case .cos: return "E"
        case .tan: return "F"
        case .fraction: return "x"
        case .sqrt: return "y"
        case .mPlus: return "M"
        default: return nil
        }
    }
    
    public var menuNumber: Int? {
        switch self {
        case .one: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        case .neg: return 10 // A
        case .dms: return 11 // B
        default: return nil
        }
    }
    
    public var keyColorStyle: KeyColorStyle {
        switch self {
        case .shift: return .shiftKey
        case .alpha: return .alphaKey
        case .del, .ac: return .accentKey
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot, .exp, .ans, .equals:
            return .numberKey
        default:
            return .functionKey
        }
    }
}

public enum KeyColorStyle {
    case shiftKey
    case alphaKey
    case functionKey
    case numberKey
    case accentKey
    
    public var backgroundColor: Color {
        switch self {
        case .shiftKey: return Color(red: 0.18, green: 0.20, blue: 0.22)
        case .alphaKey: return Color(red: 0.18, green: 0.20, blue: 0.22)
        case .functionKey: return Color(red: 0.22, green: 0.24, blue: 0.27)
        case .numberKey: return Color(red: 0.90, green: 0.91, blue: 0.93)
        case .accentKey: return Color(red: 0.15, green: 0.35, blue: 0.60) // Deep blue for DEL/AC
        }
    }
    
    public var textColor: Color {
        switch self {
        case .numberKey: return Color.black
        default: return Color.white
        }
    }
}

// MARK: - Casio Beveled Key Component
public struct CasioKeyButton: View {
    public let key: CasioKey
    public let action: () -> Void
    
    @State private var isPressed = false
    
    public init(key: CasioKey, action: @escaping () -> Void) {
        self.key = key
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 1) {
            // Secondary Labels (Shift = Gold, Alpha = Red)
            HStack(spacing: 2) {
                if let s = key.shiftLabel {
                    Text(s)
                        .font(.system(size: 8, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.92, green: 0.72, blue: 0.18)) // Gold/Yellow
                        .lineLimit(1)
                }
                Spacer(minLength: 0)
                if let a = key.alphaLabel {
                    Text(a)
                        .font(.system(size: 8, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.92, green: 0.28, blue: 0.28)) // Red/Pink
                        .lineLimit(1)
                }
            }
            .frame(height: 10)
            .padding(.horizontal, 2)
            
            // Key Cap
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(key.keyColorStyle.backgroundColor)
                        .shadow(color: Color.black.opacity(isPressed ? 0.1 : 0.4), radius: isPressed ? 1 : 2, x: 0, y: isPressed ? 1 : 2)
                    
                    Text(key.mainLabel)
                        .font(.system(size: fontSizeForKey(key), weight: .bold, design: .rounded))
                        .foregroundColor(textColorForKey(key))
                }
                .frame(height: 32)
                .scaleEffect(isPressed ? 0.96 : 1.0)
            }
            .buttonStyle(PlainButtonStyle())
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in isPressed = true }
                    .onEnded { _ in isPressed = false }
            )
        }
    }
    
    private func fontSizeForKey(_ key: CasioKey) -> CGFloat {
        if key == .shift || key == .alpha || key == .optn || key == .calc || key == .menu {
            return 10
        }
        if key.rawValue.count > 2 {
            return 11
        }
        return 14
    }
    
    private func textColorForKey(_ key: CasioKey) -> Color {
        if key == .shift {
            return Color(red: 0.92, green: 0.72, blue: 0.18)
        }
        if key == .alpha {
            return Color(red: 0.92, green: 0.28, blue: 0.28)
        }
        return key.keyColorStyle.textColor
    }
}

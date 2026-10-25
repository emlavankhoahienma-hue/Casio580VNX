import SwiftUI

public struct KeypadView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(spacing: 5) {
            // TOP ROW: SHIFT, ALPHA, REPLAY D-PAD, MENU/SETUP, ON
            HStack(spacing: 8) {
                VStack(spacing: 4) {
                    CasioKeyButton(key: .shift) { state.handleKeyPress(key: .shift) }
                    CasioKeyButton(key: .alpha) { state.handleKeyPress(key: .alpha) }
                }
                .frame(width: 58)
                
                Spacer()
                
                // Silver Metallic REPLAY Directional D-Pad
                replayDPad
                    .frame(width: 104, height: 72)
                
                Spacer()
                
                VStack(spacing: 4) {
                    CasioKeyButton(key: .menu) { state.handleKeyPress(key: .menu) }
                    CasioKeyButton(key: .on) { state.handleKeyPress(key: .on) }
                }
                .frame(width: 58)
            }
            .padding(.horizontal, 4)
            
            // ROW 2: OPTN, CALC, ∫dx, x⁻¹, log_■, ln
            HStack(spacing: 5) {
                CasioKeyButton(key: .optn) { state.handleKeyPress(key: .optn) }
                CasioKeyButton(key: .calc) { state.handleKeyPress(key: .calc) }
                CasioKeyButton(key: .integral) { state.handleKeyPress(key: .integral) }
                CasioKeyButton(key: .xMinus1) { state.handleKeyPress(key: .xMinus1) }
                CasioKeyButton(key: .logBase) { state.handleKeyPress(key: .logBase) }
                CasioKeyButton(key: .ln) { state.handleKeyPress(key: .ln) }
            }
            
            // ROW 3: (-), ° ' ", x, sin, cos, tan
            HStack(spacing: 5) {
                CasioKeyButton(key: .neg) { state.handleKeyPress(key: .neg) }
                CasioKeyButton(key: .dms) { state.handleKeyPress(key: .dms) }
                CasioKeyButton(key: .xVar) { state.handleKeyPress(key: .xVar) }
                CasioKeyButton(key: .sin) { state.handleKeyPress(key: .sin) }
                CasioKeyButton(key: .cos) { state.handleKeyPress(key: .cos) }
                CasioKeyButton(key: .tan) { state.handleKeyPress(key: .tan) }
            }
            
            // ROW 4: a b/c, √, x², x^■, log, ln
            HStack(spacing: 5) {
                CasioKeyButton(key: .fraction) { state.handleKeyPress(key: .fraction) }
                CasioKeyButton(key: .sqrt) { state.handleKeyPress(key: .sqrt) }
                CasioKeyButton(key: .xSquared) { state.handleKeyPress(key: .xSquared) }
                CasioKeyButton(key: .power) { state.handleKeyPress(key: .power) }
                CasioKeyButton(key: .log) { state.handleKeyPress(key: .log) }
                CasioKeyButton(key: .ln) { state.handleKeyPress(key: .ln) }
            }
            
            // ROW 5: STO, ENG, (, ), S<=>D, M+
            HStack(spacing: 5) {
                CasioKeyButton(key: .sto) { state.handleKeyPress(key: .sto) }
                CasioKeyButton(key: .eng) { state.handleKeyPress(key: .eng) }
                CasioKeyButton(key: .leftParen) { state.handleKeyPress(key: .leftParen) }
                CasioKeyButton(key: .rightParen) { state.handleKeyPress(key: .rightParen) }
                CasioKeyButton(key: .sd) { state.handleKeyPress(key: .sd) }
                CasioKeyButton(key: .mPlus) { state.handleKeyPress(key: .mPlus) }
            }
            
            Divider()
                .background(Color.white.opacity(0.1))
                .padding(.vertical, 2)
            
            // ROW 6 (Numpad 7 8 9 DEL AC)
            HStack(spacing: 6) {
                CasioKeyButton(key: .seven) { state.handleKeyPress(key: .seven) }
                CasioKeyButton(key: .eight) { state.handleKeyPress(key: .eight) }
                CasioKeyButton(key: .nine) { state.handleKeyPress(key: .nine) }
                CasioKeyButton(key: .del) { state.handleKeyPress(key: .del) }
                CasioKeyButton(key: .ac) { state.handleKeyPress(key: .ac) }
            }
            
            // ROW 7 (Numpad 4 5 6 × ÷)
            HStack(spacing: 6) {
                CasioKeyButton(key: .four) { state.handleKeyPress(key: .four) }
                CasioKeyButton(key: .five) { state.handleKeyPress(key: .five) }
                CasioKeyButton(key: .six) { state.handleKeyPress(key: .six) }
                CasioKeyButton(key: .times) { state.handleKeyPress(key: .times) }
                CasioKeyButton(key: .divide) { state.handleKeyPress(key: .divide) }
            }
            
            // ROW 8 (Numpad 1 2 3 + −)
            HStack(spacing: 6) {
                CasioKeyButton(key: .one) { state.handleKeyPress(key: .one) }
                CasioKeyButton(key: .two) { state.handleKeyPress(key: .two) }
                CasioKeyButton(key: .three) { state.handleKeyPress(key: .three) }
                CasioKeyButton(key: .plus) { state.handleKeyPress(key: .plus) }
                CasioKeyButton(key: .minus) { state.handleKeyPress(key: .minus) }
            }
            
            // ROW 9 (0 • ×10ˣ Ans =)
            HStack(spacing: 6) {
                CasioKeyButton(key: .zero) { state.handleKeyPress(key: .zero) }
                CasioKeyButton(key: .dot) { state.handleKeyPress(key: .dot) }
                CasioKeyButton(key: .exp) { state.handleKeyPress(key: .exp) }
                CasioKeyButton(key: .ans) { state.handleKeyPress(key: .ans) }
                CasioKeyButton(key: .equals) { state.handleKeyPress(key: .equals) }
            }
        }
    }
    
    // Directional D-Pad Replay button
    private var replayDPad: some View {
        ZStack {
            // Metallic disc background
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color(white: 0.85), Color(white: 0.65), Color(white: 0.45)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    Circle().stroke(Color.black.opacity(0.35), lineWidth: 1.5)
                )
                .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 2)
            
            Text("REPLAY")
                .font(.system(size: 8, weight: .bold, design: .rounded))
                .foregroundColor(Color.black.opacity(0.6))
            
            // UP
            Button(action: { state.handleKeyPress(key: .up) }) {
                Image(systemName: "arrowtriangle.up.fill")
                    .font(.system(size: 10))
                    .foregroundColor(Color.black.opacity(0.75))
                    .frame(width: 32, height: 22)
            }
            .offset(y: -24)
            
            // DOWN
            Button(action: { state.handleKeyPress(key: .down) }) {
                Image(systemName: "arrowtriangle.down.fill")
                    .font(.system(size: 10))
                    .foregroundColor(Color.black.opacity(0.75))
                    .frame(width: 32, height: 22)
            }
            .offset(y: 24)
            
            // LEFT
            Button(action: { state.handleKeyPress(key: .left) }) {
                Image(systemName: "arrowtriangle.left.fill")
                    .font(.system(size: 10))
                    .foregroundColor(Color.black.opacity(0.75))
                    .frame(width: 22, height: 32)
            }
            .offset(x: -36)
            
            // RIGHT
            Button(action: { state.handleKeyPress(key: .right) }) {
                Image(systemName: "arrowtriangle.right.fill")
                    .font(.system(size: 10))
                    .foregroundColor(Color.black.opacity(0.75))
                    .frame(width: 22, height: 32)
            }
            .offset(x: 36)
        }
    }
}

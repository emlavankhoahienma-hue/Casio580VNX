import SwiftUI

public struct CalculatorMainView: View {
    @StateObject private var state = CalculatorState()
    
    public init() {}
    
    public var body: some View {
        ZStack {
            // Calculator body casing background (Authentic ClassWiz matte dark casing)
            Color(red: 0.11, green: 0.12, blue: 0.14)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 8) {
                // Top Header Branding: CASIO fx-580VN X & Solar panel simulation
                brandingHeader
                    .padding(.horizontal, 16)
                    .padding(.top, 4)
                
                // Beveled LCD Screen container
                LCDView(state: state)
                    .padding(.horizontal, 12)
                
                // Keypad Area with 50 keys
                KeypadView(state: state)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 6)
            }
            .padding(.vertical, 4)
            
            // Popups & Overlays
            if state.activeOverlay == .menu {
                MenuGridView(state: state)
            } else if case .setup(let page) = state.activeOverlay {
                SetupMenuView(state: state, page: page)
            } else if state.activeOverlay == .option {
                OptionMenuView(state: state)
            } else if state.activeOverlay == .constPicker {
                ConstantsPickerView(state: state)
            } else if state.activeOverlay == .convPicker {
                ConversionsPickerView(state: state)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    // Branding header with authentic CASIO and ClassWiz badges
    private var brandingHeader: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 6) {
                    Text("CASIO")
                        .font(.system(size: 17, weight: .black, design: .serif))
                        .foregroundColor(.white)
                    Text("fx-580VN X")
                        .font(.system(size: 13, weight: .heavy, design: .rounded))
                        .foregroundColor(Color(white: 0.85))
                }
                Text("CLASSWIZ")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(red: 0.45, green: 0.70, blue: 0.95))
            }
            
            Spacer()
            
            // TWO WAY POWER (Solar Panel Simulation)
            HStack(spacing: 4) {
                VStack(alignment: .trailing, spacing: 1) {
                    Text("TWO WAY POWER")
                        .font(.system(size: 6, weight: .bold))
                        .foregroundColor(Color(white: 0.6))
                    Text("NATURAL-V.P.A.M.")
                        .font(.system(size: 6, weight: .bold))
                        .foregroundColor(Color(white: 0.6))
                }
                
                // Photovoltaic cell look
                RoundedRectangle(cornerRadius: 2)
                    .fill(
                        LinearGradient(
                            colors: [Color(red: 0.22, green: 0.12, blue: 0.10), Color(red: 0.35, green: 0.18, blue: 0.15)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 52, height: 18)
                    .overlay(
                        HStack(spacing: 12) {
                            Rectangle().fill(Color.black.opacity(0.4)).frame(width: 1)
                            Rectangle().fill(Color.black.opacity(0.4)).frame(width: 1)
                            Rectangle().fill(Color.black.opacity(0.4)).frame(width: 1)
                        }
                    )
            }
        }
    }
}

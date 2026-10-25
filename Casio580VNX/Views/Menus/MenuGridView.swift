import SwiftUI

public struct MenuGridView: View {
    @ObservedObject var state: CalculatorState
    
    public init(state: CalculatorState) {
        self.state = state
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.85)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    state.activeOverlay = .none
                }
            
            VStack(spacing: 12) {
                HStack {
                    Text(state.isVietnamese ? "CHỌN CHẾ ĐỘ (MENU)" : "SELECT MODE (MENU)")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: { state.activeOverlay = .none }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(CalculatorMode.allCases) { mode in
                            Button(action: {
                                state.currentMode = mode
                                state.activeOverlay = .none
                                state.resetCurrentScreen()
                            }) {
                                VStack(spacing: 6) {
                                    Image(systemName: mode.iconName)
                                        .font(.system(size: 22))
                                        .foregroundColor(state.currentMode == mode ? .yellow : .white)
                                    
                                    Text(state.isVietnamese ? mode.titleVi : mode.titleEn)
                                        .font(.system(size: 11, weight: .medium, design: .rounded))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.8)
                                }
                                .frame(maxWidth: .infinity, minHeight: 74)
                                .background(state.currentMode == mode ? Color(red: 0.25, green: 0.35, blue: 0.5) : Color(white: 0.2))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(state.currentMode == mode ? Color.yellow : Color.clear, lineWidth: 1.5)
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: 380, maxHeight: 520)
            .background(Color(red: 0.14, green: 0.16, blue: 0.19))
            .cornerRadius(16)
            .shadow(radius: 20)
            .padding(16)
        }
    }
}

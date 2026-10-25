import SwiftUI

public struct MathNode2DView: View {
    public let node: MathNode
    public var cursorIndex: Int = -1
    public var isSelected: Bool = false
    
    public init(node: MathNode, cursorIndex: Int = -1, isSelected: Bool = false) {
        self.node = node
        self.cursorIndex = cursorIndex
        self.isSelected = isSelected
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 1) {
            switch node {
            case .char(let symbol, _):
                Text(symbol)
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.black.opacity(0.88))
                
            case .fraction(let num, let den):
                VStack(spacing: 1) {
                    MathNodeSequenceView(nodes: num, emptyPlaceholder: "□")
                    Rectangle()
                        .fill(Color.black.opacity(0.85))
                        .frame(height: 1.5)
                    MathNodeSequenceView(nodes: den, emptyPlaceholder: "□")
                }
                .padding(.horizontal, 2)
                
            case .mixedFrac(let whole, let num, let den):
                HStack(spacing: 2) {
                    MathNodeSequenceView(nodes: whole, emptyPlaceholder: "□")
                    VStack(spacing: 1) {
                        MathNodeSequenceView(nodes: num, emptyPlaceholder: "□")
                        Rectangle()
                            .fill(Color.black.opacity(0.85))
                            .frame(height: 1.5)
                        MathNodeSequenceView(nodes: den, emptyPlaceholder: "□")
                    }
                }
                
            case .sqrt(let radicand):
                HStack(alignment: .top, spacing: 0) {
                    Text("√")
                        .font(.system(size: 17, weight: .bold, design: .serif))
                        .offset(y: -1)
                    VStack(alignment: .leading, spacing: 0) {
                        Rectangle()
                            .fill(Color.black.opacity(0.85))
                            .frame(height: 1.5)
                        MathNodeSequenceView(nodes: radicand, emptyPlaceholder: "□")
                            .padding(.horizontal, 2)
                            .padding(.top, 1)
                    }
                }
                
            case .nRoot(let n, let radicand):
                HStack(alignment: .top, spacing: 0) {
                    MathNodeSequenceView(nodes: n, emptyPlaceholder: "□")
                        .scaleEffect(0.7)
                        .offset(x: 2, y: -6)
                    Text("√")
                        .font(.system(size: 17, weight: .bold, design: .serif))
                    VStack(alignment: .leading, spacing: 0) {
                        Rectangle()
                            .fill(Color.black.opacity(0.85))
                            .frame(height: 1.5)
                        MathNodeSequenceView(nodes: radicand, emptyPlaceholder: "□")
                            .padding(.horizontal, 2)
                            .padding(.top, 1)
                    }
                }
                
            case .power(let base, let exp):
                HStack(alignment: .top, spacing: 1) {
                    MathNodeSequenceView(nodes: base, emptyPlaceholder: "□")
                    MathNodeSequenceView(nodes: exp, emptyPlaceholder: "□")
                        .scaleEffect(0.75)
                        .offset(y: -6)
                }
                
            case .logBase(let base, let arg):
                HStack(alignment: .bottom, spacing: 1) {
                    Text("log")
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                    MathNodeSequenceView(nodes: base, emptyPlaceholder: "□")
                        .scaleEffect(0.7)
                        .offset(y: 4)
                    Text("(")
                        .font(.system(size: 15, weight: .bold))
                    MathNodeSequenceView(nodes: arg, emptyPlaceholder: "□")
                    Text(")")
                        .font(.system(size: 15, weight: .bold))
                }
                
            case .derivative(let expr, let atVal):
                HStack(spacing: 2) {
                    VStack(spacing: 1) {
                        Text("d")
                            .font(.system(size: 13, weight: .bold))
                        Rectangle()
                            .fill(Color.black.opacity(0.85))
                            .frame(height: 1.5)
                        Text("dx")
                            .font(.system(size: 13, weight: .bold))
                    }
                    Text("(")
                        .font(.system(size: 16, weight: .bold))
                    MathNodeSequenceView(nodes: expr, emptyPlaceholder: "□")
                    Text(")|x=")
                        .font(.system(size: 14, weight: .bold))
                    MathNodeSequenceView(nodes: atVal, emptyPlaceholder: "□")
                }
                
            case .integral(let expr, let lower, let upper):
                HStack(spacing: 2) {
                    VStack(spacing: 0) {
                        MathNodeSequenceView(nodes: upper, emptyPlaceholder: "□")
                            .scaleEffect(0.65)
                        Text("∫")
                            .font(.system(size: 22, weight: .regular, design: .serif))
                        MathNodeSequenceView(nodes: lower, emptyPlaceholder: "□")
                            .scaleEffect(0.65)
                    }
                    MathNodeSequenceView(nodes: expr, emptyPlaceholder: "□")
                    Text("dx")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                }
                
            case .sum(let expr, let lower, let upper):
                HStack(spacing: 2) {
                    VStack(spacing: 0) {
                        MathNodeSequenceView(nodes: upper, emptyPlaceholder: "□")
                            .scaleEffect(0.65)
                        Text("Σ")
                            .font(.system(size: 18, weight: .bold))
                        MathNodeSequenceView(nodes: lower, emptyPlaceholder: "□")
                            .scaleEffect(0.65)
                    }
                    MathNodeSequenceView(nodes: expr, emptyPlaceholder: "□")
                }
                
            case .product(let expr, let lower, let upper):
                HStack(spacing: 2) {
                    VStack(spacing: 0) {
                        MathNodeSequenceView(nodes: upper, emptyPlaceholder: "□")
                            .scaleEffect(0.65)
                        Text("∏")
                            .font(.system(size: 18, weight: .bold))
                        MathNodeSequenceView(nodes: lower, emptyPlaceholder: "□")
                            .scaleEffect(0.65)
                    }
                    MathNodeSequenceView(nodes: expr, emptyPlaceholder: "□")
                }
                
            case .abs(let expr):
                HStack(spacing: 1) {
                    Text("|")
                        .font(.system(size: 16, weight: .bold))
                    MathNodeSequenceView(nodes: expr, emptyPlaceholder: "□")
                    Text("|")
                        .font(.system(size: 16, weight: .bold))
                }
            }
        }
    }
}

// MARK: - Sequence View of Nodes with Cursor
public struct MathNodeSequenceView: View {
    public let nodes: [MathNode]
    public var cursorIndex: Int = -1
    public var emptyPlaceholder: String = ""
    
    @State private var blinkCursor = true
    
    public init(nodes: [MathNode], cursorIndex: Int = -1, emptyPlaceholder: String = "") {
        self.nodes = nodes
        self.cursorIndex = cursorIndex
        self.emptyPlaceholder = emptyPlaceholder
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 1) {
            if nodes.isEmpty {
                if cursorIndex == 0 {
                    cursorView
                } else if !emptyPlaceholder.isEmpty {
                    Text(emptyPlaceholder)
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .foregroundColor(Color.black.opacity(0.4))
                }
            } else {
                ForEach(0..<nodes.count, id: \.self) { i in
                    if cursorIndex == i {
                        cursorView
                    }
                    MathNode2DView(node: nodes[i])
                }
                if cursorIndex == nodes.count {
                    cursorView
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                blinkCursor.toggle()
            }
        }
    }
    
    private var cursorView: some View {
        Rectangle()
            .fill(blinkCursor ? Color.black : Color.clear)
            .frame(width: 2, height: 16)
    }
}

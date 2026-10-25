import Foundation
import CoreGraphics

// MARK: - 1:1 Hardware Specification Extracted via Reverse Engineering from CLASSWIZ_P20.dll
public struct ExtractedKeyHitbox: Identifiable, Equatable {
    public let id: Int
    public let key: CasioKey
    public let x: CGFloat
    public let y: CGFloat
    public let width: CGFloat
    public let height: CGFloat
    public let ko: Int
    public let ki: Int
    
    public var rect: CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }
}

public struct ExtractedFaceplateData {
    public static let canvasWidth: CGFloat = 644.0
    public static let canvasHeight: CGFloat = 1250.0
    
    // Physical LCD Screen Bezel Window on Genuine Faceplate (430x172 at x=106, y=223)
    public static let displayRect = CGRect(x: 106.0, y: 223.0, width: 430.0, height: 172.0)
    
    // Extracted from GetSymbolPosition (RVA: 0x10A0)
    public static let symbolsRect = CGRect(x: 130.0, y: 237.0, width: 384.0, height: 16.0)
    
    // 50 Physical Keys extracted directly from static table at 0x10004010 in CLASSWIZ_P20.dll
    public static let keyHitboxes: [ExtractedKeyHitbox] = [
        // Top Function Row & D-Pad (y: 478 - 546)
        ExtractedKeyHitbox(id: 0, key: .shift, x: 99, y: 479, width: 49, height: 49, ko: 128, ki: 1),
        ExtractedKeyHitbox(id: 1, key: .alpha, x: 169, y: 479, width: 49, height: 49, ko: 128, ki: 2),
        ExtractedKeyHitbox(id: 2, key: .menu, x: 427, y: 479, width: 49, height: 49, ko: 128, ki: 16),
        ExtractedKeyHitbox(id: 3, key: .on, x: 496, y: 479, width: 49, height: 49, ko: 0, ki: 0),
        ExtractedKeyHitbox(id: 4, key: .up, x: 298, y: 478, width: 49, height: 49, ko: 128, ki: 4),
        ExtractedKeyHitbox(id: 5, key: .down, x: 298, y: 546, width: 49, height: 49, ko: 64, ki: 8),
        ExtractedKeyHitbox(id: 6, key: .left, x: 236, y: 512, width: 49, height: 49, ko: 64, ki: 4),
        ExtractedKeyHitbox(id: 7, key: .right, x: 360, y: 512, width: 49, height: 49, ko: 128, ki: 8),
        
        // Row 1: Function Row 1 (y: 575)
        ExtractedKeyHitbox(id: 8, key: .optn, x: 94, y: 575, width: 68, height: 40, ko: 64, ki: 1),
        ExtractedKeyHitbox(id: 9, key: .calc, x: 172, y: 575, width: 68, height: 40, ko: 64, ki: 2),
        ExtractedKeyHitbox(id: 10, key: .integral, x: 406, y: 575, width: 68, height: 40, ko: 64, ki: 16),
        ExtractedKeyHitbox(id: 11, key: .xMinus1, x: 484, y: 575, width: 68, height: 40, ko: 64, ki: 32),
        
        // Row 2: Scientific Keys Row 2 (y: 640)
        ExtractedKeyHitbox(id: 12, key: .fraction, x: 94, y: 640, width: 68, height: 40, ko: 32, ki: 1),
        ExtractedKeyHitbox(id: 13, key: .sqrt, x: 172, y: 640, width: 68, height: 40, ko: 32, ki: 2),
        ExtractedKeyHitbox(id: 14, key: .xSquared, x: 250, y: 640, width: 68, height: 40, ko: 32, ki: 4),
        ExtractedKeyHitbox(id: 15, key: .power, x: 329, y: 640, width: 68, height: 40, ko: 32, ki: 8),
        ExtractedKeyHitbox(id: 16, key: .log, x: 406, y: 640, width: 68, height: 40, ko: 32, ki: 16),
        ExtractedKeyHitbox(id: 17, key: .ln, x: 484, y: 640, width: 68, height: 40, ko: 32, ki: 32),
        
        // Row 3: Scientific Keys Row 3 (y: 706)
        ExtractedKeyHitbox(id: 18, key: .neg, x: 94, y: 706, width: 68, height: 40, ko: 16, ki: 1),
        ExtractedKeyHitbox(id: 19, key: .dms, x: 172, y: 706, width: 68, height: 40, ko: 16, ki: 2),
        ExtractedKeyHitbox(id: 20, key: .xVar, x: 250, y: 706, width: 68, height: 40, ko: 16, ki: 4),
        ExtractedKeyHitbox(id: 21, key: .sin, x: 329, y: 706, width: 68, height: 40, ko: 16, ki: 8),
        ExtractedKeyHitbox(id: 22, key: .cos, x: 406, y: 706, width: 68, height: 40, ko: 16, ki: 16),
        ExtractedKeyHitbox(id: 23, key: .tan, x: 484, y: 706, width: 68, height: 40, ko: 16, ki: 32),
        
        // Row 4: Scientific Keys Row 4 (y: 772)
        ExtractedKeyHitbox(id: 24, key: .sto, x: 94, y: 772, width: 68, height: 40, ko: 8, ki: 1),
        ExtractedKeyHitbox(id: 25, key: .eng, x: 172, y: 772, width: 68, height: 40, ko: 8, ki: 2),
        ExtractedKeyHitbox(id: 26, key: .leftParen, x: 250, y: 772, width: 68, height: 40, ko: 8, ki: 4),
        ExtractedKeyHitbox(id: 27, key: .rightParen, x: 329, y: 772, width: 68, height: 40, ko: 8, ki: 8),
        ExtractedKeyHitbox(id: 28, key: .sd, x: 406, y: 772, width: 68, height: 40, ko: 8, ki: 16),
        ExtractedKeyHitbox(id: 29, key: .mPlus, x: 484, y: 772, width: 68, height: 40, ko: 8, ki: 32),
        
        // Row 5: Numpad Row 1 (y: 841)
        ExtractedKeyHitbox(id: 30, key: .seven, x: 96, y: 841, width: 80, height: 56, ko: 4, ki: 1),
        ExtractedKeyHitbox(id: 31, key: .eight, x: 189, y: 841, width: 80, height: 56, ko: 4, ki: 2),
        ExtractedKeyHitbox(id: 32, key: .nine, x: 282, y: 841, width: 80, height: 56, ko: 4, ki: 4),
        ExtractedKeyHitbox(id: 33, key: .del, x: 375, y: 841, width: 80, height: 56, ko: 4, ki: 8),
        ExtractedKeyHitbox(id: 34, key: .ac, x: 468, y: 841, width: 80, height: 56, ko: 4, ki: 16),
        
        // Row 6: Numpad Row 2 (y: 921)
        ExtractedKeyHitbox(id: 35, key: .four, x: 96, y: 921, width: 80, height: 56, ko: 2, ki: 1),
        ExtractedKeyHitbox(id: 36, key: .five, x: 189, y: 921, width: 80, height: 56, ko: 2, ki: 2),
        ExtractedKeyHitbox(id: 37, key: .six, x: 282, y: 921, width: 80, height: 56, ko: 2, ki: 4),
        ExtractedKeyHitbox(id: 38, key: .times, x: 375, y: 921, width: 80, height: 56, ko: 2, ki: 8),
        ExtractedKeyHitbox(id: 39, key: .divide, x: 468, y: 921, width: 80, height: 56, ko: 2, ki: 16),
        
        // Row 7: Numpad Row 3 (y: 1001)
        ExtractedKeyHitbox(id: 40, key: .one, x: 96, y: 1001, width: 80, height: 56, ko: 1, ki: 1),
        ExtractedKeyHitbox(id: 41, key: .two, x: 189, y: 1001, width: 80, height: 56, ko: 1, ki: 2),
        ExtractedKeyHitbox(id: 42, key: .three, x: 282, y: 1001, width: 80, height: 56, ko: 1, ki: 4),
        ExtractedKeyHitbox(id: 43, key: .plus, x: 375, y: 1001, width: 80, height: 56, ko: 1, ki: 8),
        ExtractedKeyHitbox(id: 44, key: .minus, x: 468, y: 1001, width: 80, height: 56, ko: 1, ki: 16),
        
        // Row 8: Bottom Row (y: 1081)
        ExtractedKeyHitbox(id: 45, key: .zero, x: 96, y: 1081, width: 80, height: 56, ko: 16, ki: 64),
        ExtractedKeyHitbox(id: 46, key: .dot, x: 189, y: 1081, width: 80, height: 56, ko: 8, ki: 64),
        ExtractedKeyHitbox(id: 47, key: .exp, x: 282, y: 1081, width: 80, height: 56, ko: 4, ki: 64),
        ExtractedKeyHitbox(id: 48, key: .ans, x: 375, y: 1081, width: 80, height: 56, ko: 2, ki: 64),
        ExtractedKeyHitbox(id: 49, key: .equals, x: 468, y: 1081, width: 80, height: 56, ko: 1, ki: 64)
    ]
}

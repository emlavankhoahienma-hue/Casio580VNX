import json

with open(r'C:\Users\admin\.gemini\antigravity\scratch\Casio580VNX\rea_dump\raw_key_table.json') as f:
    keys = json.load(f)

# The faceplate bitmap is 644 x 1250
# Display is at (130, 256, 384, 126)
# Symbols bar is at (130, 237, 384, 16)

# Key labels by matrix position or standard order:
# Let's inspect the order:
# Key 0: (99, 479, 49, 49) -> SHIFT
# Key 1: (169, 479, 49, 49) -> OPTN
# Key 2: (427, 479, 49, 49) -> MENU
# Key 3: (496, 479, 49, 49) -> ON
# Key 4: (298, 478, 49, 49) -> UP
# Key 5: (298, 546, 49, 49) -> DOWN
# Key 6: (236, 512, 49, 49) -> LEFT
# Key 7: (360, 512, 49, 49) -> RIGHT

key_defs = [
    # Index, Name, KeyCode
    (0, "SHIFT", "shift"),
    (1, "OPTN", "optn"),
    (2, "MENU", "menu"),
    (3, "ON", "on"),
    (4, "UP", "up"),
    (5, "DOWN", "down"),
    (6, "LEFT", "left"),
    (7, "RIGHT", "right"),
    (8, "CALC", "calc"),
    (9, "INTEGRAL", "integral"),
    (10, "X_MINUS_1", "xMinus1"),
    (11, "LOG_BASE", "logBase"),
    (12, "FRACTION", "fraction"),
    (13, "SQRT", "sqrt"),
    (14, "X_SQUARED", "xSquared"),
    (15, "POWER", "power"),
    (16, "LOG", "log"),
    (17, "LN", "ln"),
    (18, "NEG", "neg"),
    (19, "DMS", "dms"),
    (20, "X_VAR", "xVar"),
    (21, "SIN", "sin"),
    (22, "COS", "cos"),
    (23, "TAN", "tan"),
    (24, "STO", "sto"),
    (25, "ENG", "eng"),
    (26, "LEFT_PAREN", "leftParen"),
    (27, "RIGHT_PAREN", "rightParen"),
    (28, "SD", "sd"),
    (29, "M_PLUS", "mPlus"),
    (30, "7", "seven"),
    (31, "8", "eight"),
    (32, "9", "nine"),
    (33, "DEL", "del"),
    (34, "AC", "ac"),
    (35, "4", "four"),
    (36, "5", "five"),
    (37, "6", "six"),
    (38, "TIMES", "times"),
    (39, "DIVIDE", "divide"),
    (40, "1", "one"),
    (41, "2", "two"),
    (42, "3", "three"),
    (43, "PLUS", "plus"),
    (44, "MINUS", "minus"),
    (45, "0", "zero"),
    (46, "DOT", "dot"),
    (47, "EXP", "exp"),
    (48, "ANS", "ans"),
    (49, "EQUALS", "equals")
]

extracted_map = []
for idx, label, enum_key in key_defs:
    dw = keys[idx]['dwords']
    ko, ki, x, y, w, h = dw[0], dw[1], dw[2], dw[3], dw[4], dw[5]
    extracted_map.append({
        "id": idx,
        "label": label,
        "key": enum_key,
        "ko": ko,
        "ki": ki,
        "x": x,
        "y": y,
        "w": w,
        "h": h
    })

with open(r'C:\Users\admin\.gemini\antigravity\scratch\Casio580VNX\rea_dump\extracted_hitbox_map.json', 'w') as f:
    json.dump(extracted_map, f, indent=2)

print(f"Generated clean hitbox map for {len(extracted_map)} keys!")
for k in extracted_map[:10]:
    print(f"  {k['label']:<10}: x={k['x']:3d}, y={k['y']:3d}, w={k['w']:2d}, h={k['h']:2d} (KO={k['ko']}, KI={k['ki']})")

import json

with open(r'C:\Users\admin\.gemini\antigravity\scratch\Casio580VNX\rea_dump\raw_key_table.json') as f:
    keys = json.load(f)

# Sort by y then x
sorted_keys = sorted(keys, key=lambda k: (k['dwords'][3], k['dwords'][2]))

print("Physical keys sorted by Y (row) and X (col):")
current_y = -1
for k in sorted_keys:
    dw = k['dwords']
    y = dw[3]
    ch = chr(dw[7]) if 32 <= dw[7] <= 126 else "?"
    print(f"Index {k['index']:02d}: x={dw[2]:3d}, y={dw[3]:3d}, w={dw[4]:2d}, h={dw[5]:2d}, KO={dw[0]:3d}, KI={dw[1]:3d}, ascii={dw[7]} ({ch})")

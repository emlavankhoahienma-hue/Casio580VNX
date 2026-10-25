import json

with open(r'C:\Users\admin\.gemini\antigravity\scratch\Casio580VNX\rea_dump\raw_key_table.json') as f:
    data = json.load(f)

for k in data[:16]:
    dw = k['dwords']
    ch = chr(dw[7]) if 32 <= dw[7] <= 126 else "?"
    print(f"Key {k['index']:02d}: KO={dw[0]:2d}, KI={dw[1]:2d}, x={dw[2]:3d}, y={dw[3]:3d}, w={dw[4]:2d}, h={dw[5]:2d}, ascii={dw[7]} ({ch})")

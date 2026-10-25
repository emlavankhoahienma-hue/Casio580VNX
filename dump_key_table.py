import os
import struct
import json
import pefile

dll_path = r"C:\3uTools9\fx-580VN X Emulator\CLASSWIZ_P20.dll"
pe = pefile.PE(dll_path)
image_base = pe.OPTIONAL_HEADER.ImageBase

table_va = 0x10004010
table_rva = table_va - image_base
table_offset = pe.get_offset_from_rva(table_rva)

print(f"Table VA: 0x{table_va:X}, RVA: 0x{table_rva:X}, File Offset: 0x{table_offset:X}")

keys = []
# 50 keys, 36 bytes or 24 bytes each? Let's check:
# lea ecx, [ecx + ecx*8] -> 9 * ecx
# ecx*4 -> 36 bytes per entry!
ENTRY_SIZE = 36

raw_table = pe.__data__[table_offset:table_offset + 50 * ENTRY_SIZE]

for i in range(50):
    entry_data = raw_table[i * ENTRY_SIZE : (i + 1) * ENTRY_SIZE]
    # Unpack 9 dwords (36 bytes)
    dwords = struct.unpack('<9I', entry_data)
    # Typically: rect (left, top, right, bottom), keycode/ID, flags, etc.
    # or x, y, width, height, etc.
    keys.append({
        "index": i,
        "dwords": list(dwords),
        "hex": [hex(x) for x in dwords]
    })
    print(f"Key {i:02d}: {dwords}")

out_path = r"C:\Users\admin\.gemini\antigravity\scratch\Casio580VNX\rea_dump\raw_key_table.json"
with open(out_path, "w", encoding="utf-8") as f:
    json.dump(keys, f, indent=2)

print("Saved raw key table to:", out_path)

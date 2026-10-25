import os
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

dll_path = r"C:\3uTools9\fx-580VN X Emulator\CLASSWIZ_P20.dll"
pe = pefile.PE(dll_path)

md = Cs(CS_ARCH_X86, CS_MODE_32)

exports = {}
if hasattr(pe, 'DIRECTORY_ENTRY_EXPORT'):
    for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
        name = exp.name.decode('utf-8', 'ignore') if exp.name else f"ord_{exp.ordinal}"
        exports[name] = exp.address

print(f"Loaded {len(exports)} exports from CLASSWIZ_P20.dll")

dump_asm = []
for name, rva in sorted(exports.items()):
    offset = pe.get_offset_from_rva(rva)
    code = pe.__data__[offset:offset + 128]
    dump_asm.append(f"\n; ==================== EXPORT: {name} (RVA: 0x{rva:X}, Offset: 0x{offset:X}) ====================")
    for ins in md.disasm(code, rva):
        dump_asm.append(f"0x{ins.address:08X}:  {ins.mnemonic:<8} {ins.op_str}")
        if ins.mnemonic in ['ret', 'retf'] or ins.mnemonic.startswith('jmp'):
            break

asm_file = r"C:\Users\admin\.gemini\antigravity\scratch\Casio580VNX\rea_dump\decompiled\CLASSWIZ_P20_exports.asm"
with open(asm_file, "w", encoding="utf-8") as f:
    f.write("\n".join(dump_asm))

print("Wrote disassembly to:", asm_file)
for line in dump_asm[:40]:
    print(line)

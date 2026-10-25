import os
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

folder = r"C:\3uTools9\fx-580VN X Emulator"
dump_dir = r"C:\Users\admin\.gemini\antigravity\scratch\Casio580VNX\rea_dump\decompiled"

md = Cs(CS_ARCH_X86, CS_MODE_32)

def decompile_pe(dll_name):
    path = os.path.join(folder, dll_name)
    pe = pefile.PE(path)
    image_base = pe.OPTIONAL_HEADER.ImageBase
    
    out_lines = [f"// DECOMPILED DISASSEMBLY OF {dll_name}", f"// Base: 0x{image_base:08X}\n"]
    
    if hasattr(pe, 'DIRECTORY_ENTRY_EXPORT') and pe.DIRECTORY_ENTRY_EXPORT:
        for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
            name = exp.name.decode('utf-8', 'ignore') if exp.name else f"ord_{exp.ordinal}"
            rva = exp.address
            offset = pe.get_offset_from_rva(rva)
            code = pe.__data__[offset:offset + 512]
            
            out_lines.append(f"\n// Function: {name} (RVA: 0x{rva:X}, VA: 0x{image_base + rva:X})")
            for ins in md.disasm(code, image_base + rva):
                out_lines.append(f"    0x{ins.address:08X}:  {ins.mnemonic:<8} {ins.op_str}")
                if ins.mnemonic in ['ret', 'retf']:
                    break
                    
    out_path = os.path.join(dump_dir, f"{dll_name}.asm")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(out_lines))
    print(f"Dumped {dll_name} disassembly to {out_path} ({len(out_lines)} lines)")

decompile_pe("SimU8engine.dll")
decompile_pe("SimU8.dll")

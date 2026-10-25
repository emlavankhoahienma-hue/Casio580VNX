import os
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

dll_path = r"C:\3uTools9\fx-580VN X Emulator\CLASSWIZ_P20.dll"
pe = pefile.PE(dll_path)
image_base = pe.OPTIONAL_HEADER.ImageBase
md = Cs(CS_ARCH_X86, CS_MODE_32)

exports = {}
for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
    name = exp.name.decode('utf-8', 'ignore') if exp.name else f"ord_{exp.ordinal}"
    exports[name] = exp.address

funcs_to_dump = ["GetKeyCount", "GetKeyPosition", "GetKeyInfo", "GetKeyboardInfo", "GetSymbolPosition", "IsAcKeyCode", "IsOnKeyCode"]

for name in funcs_to_dump:
    if name in exports:
        rva = exports[name]
        offset = pe.get_offset_from_rva(rva)
        code = pe.__data__[offset:offset + 256]
        print(f"\n==================== {name} (RVA: 0x{rva:X}, VA: 0x{image_base + rva:X}) ====================")
        count = 0
        for ins in md.disasm(code, image_base + rva):
            print(f"0x{ins.address:08X}:  {ins.mnemonic:<8} {ins.op_str}")
            count += 1
            if count > 30 or ins.mnemonic in ['ret', 'retf']:
                break

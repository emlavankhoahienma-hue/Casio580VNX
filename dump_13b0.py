import os
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

dll_path = r"C:\3uTools9\fx-580VN X Emulator\CLASSWIZ_P20.dll"
pe = pefile.PE(dll_path)
image_base = pe.OPTIONAL_HEADER.ImageBase
md = Cs(CS_ARCH_X86, CS_MODE_32)

va = 0x100013b0
rva = va - image_base
offset = pe.get_offset_from_rva(rva)
code = pe.__data__[offset:offset + 128]
print(f"Disassembly of 0x{va:X}:")
for ins in md.disasm(code, va):
    print(f"0x{ins.address:08X}:  {ins.mnemonic:<8} {ins.op_str}")
    if ins.mnemonic in ['ret', 'retf']:
        break

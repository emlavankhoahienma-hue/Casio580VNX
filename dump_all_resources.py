import os
import struct
import pefile
from PIL import Image
import io

dump_dir = r"C:\Users\admin\.gemini\antigravity\scratch\Casio580VNX\rea_dump"
os.makedirs(dump_dir, exist_ok=True)
os.makedirs(os.path.join(dump_dir, "bitmaps"), exist_ok=True)
os.makedirs(os.path.join(dump_dir, "decompiled"), exist_ok=True)

folder = r"C:\3uTools9\fx-580VN X Emulator"

def extract_bitmaps_from_pe(dll_path, prefix):
    pe = pefile.PE(dll_path)
    if not hasattr(pe, 'DIRECTORY_ENTRY_RESOURCE'):
        return
    
    for resource_type in pe.DIRECTORY_ENTRY_RESOURCE.entries:
        type_id = resource_type.id or resource_type.name
        # RT_BITMAP = 2
        if type_id == 2 or type_id == pefile.RESOURCE_TYPE['RT_BITMAP']:
            for resource_id in resource_type.directory.entries:
                res_id_name = str(resource_id.id or resource_id.name)
                for resource_lang in resource_id.directory.entries:
                    data_rva = resource_lang.data.struct.OffsetToData
                    size = resource_lang.data.struct.Size
                    data = pe.get_data(data_rva, size)
                    
                    # DIB data starts with BITMAPINFOHEADER (header size is usually 40 bytes)
                    header_size = struct.unpack('<I', data[:4])[0]
                    width, height, planes, bitcount, compression = struct.unpack('<iiHHI', data[4:20])
                    
                    # Palette size
                    num_colors = struct.unpack('<I', data[32:36])[0]
                    if num_colors == 0 and bitcount <= 8:
                        num_colors = 1 << bitcount
                    
                    palette_size = num_colors * 4
                    bfOffBits = 14 + header_size + palette_size
                    bfSize = 14 + len(data)
                    
                    # BITMAPFILEHEADER: 'BM', bfSize, 0, 0, bfOffBits
                    file_header = struct.pack('<2sIHHI', b'BM', bfSize, 0, 0, bfOffBits)
                    bmp_data = file_header + data
                    
                    bmp_path = os.path.join(dump_dir, "bitmaps", f"{prefix}_res_{res_id_name}.bmp")
                    png_path = os.path.join(dump_dir, "bitmaps", f"{prefix}_res_{res_id_name}.png")
                    with open(bmp_path, 'wb') as f:
                        f.write(bmp_data)
                    
                    try:
                        img = Image.open(bmp_path)
                        img.save(png_path, "PNG")
                        print(f"Extracted: {prefix} res {res_id_name} -> {img.size} ({img.mode})")
                    except Exception as e:
                        print(f"Pillow convert error on {res_id_name}: {e}")

print("Extracting bitmaps from CLASSWIZ_P20.dll...")
extract_bitmaps_from_pe(os.path.join(folder, "CLASSWIZ_P20.dll"), "CLASSWIZ_P20")

print("\nExtracting bitmaps from fx-580VN X Emulator.exe...")
extract_bitmaps_from_pe(os.path.join(folder, "fx-580VN X Emulator.exe"), "Emulator")

print("\nExtracting bitmaps from SimU8.dll...")
extract_bitmaps_from_pe(os.path.join(folder, "SimU8.dll"), "SimU8")

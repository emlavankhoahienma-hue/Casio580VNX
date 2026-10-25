import os
import sys
import pefile

folder = r"C:\3uTools9\fx-580VN X Emulator"
print("Scanning:", folder)

for f in sorted(os.listdir(folder)):
    if f.lower().endswith(('.exe', '.dll')):
        path = os.path.join(folder, f)
        try:
            pe = pefile.PE(path, fast_load=True)
            pe.parse_data_directories(directories=[
                pefile.DIRECTORY_ENTRY['IMAGE_DIRECTORY_ENTRY_RESOURCE'],
                pefile.DIRECTORY_ENTRY['IMAGE_DIRECTORY_ENTRY_EXPORT']
            ])
            
            res_summary = {}
            if hasattr(pe, 'DIRECTORY_ENTRY_RESOURCE'):
                for entry in pe.DIRECTORY_ENTRY_RESOURCE.entries:
                    t_name = pefile.RESOURCE_TYPE.get(entry.id, str(entry.id or entry.name))
                    count = len(entry.directory.entries) if hasattr(entry, 'directory') else 0
                    res_summary[t_name] = count
            
            export_names = []
            if hasattr(pe, 'DIRECTORY_ENTRY_EXPORT') and pe.DIRECTORY_ENTRY_EXPORT:
                for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
                    if exp.name:
                        export_names.append(exp.name.decode('utf-8', 'ignore'))
                    else:
                        export_names.append(f"ord_{exp.ordinal}")
                        
            print(f"\n--- {f} ---")
            print("  Resources:", res_summary)
            print(f"  Exports ({len(export_names)}):", export_names[:8])
            pe.close()
        except Exception as e:
            print(f"  Error on {f}: {e}")

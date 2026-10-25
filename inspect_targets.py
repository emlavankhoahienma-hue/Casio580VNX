import os
import pefile

folder = r"C:\3uTools9\fx-580VN X Emulator"
targets = ["CLASSWIZ_P20.dll", "SimU8.dll", "SimU8engine.dll", "fx-580VN X Emulator.exe"]

for f in targets:
    path = os.path.join(folder, f)
    pe = pefile.PE(path)
    res_summary = {}
    if hasattr(pe, 'DIRECTORY_ENTRY_RESOURCE'):
        for entry in pe.DIRECTORY_ENTRY_RESOURCE.entries:
            t_name = pefile.RESOURCE_TYPE.get(entry.id, str(entry.id or entry.name))
            items = []
            if hasattr(entry, 'directory'):
                for sub in entry.directory.entries:
                    items.append(str(sub.id or sub.name))
            res_summary[t_name] = items
    
    exports = []
    if hasattr(pe, 'DIRECTORY_ENTRY_EXPORT') and pe.DIRECTORY_ENTRY_EXPORT:
        for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
            name = exp.name.decode('utf-8', 'ignore') if exp.name else f"ord_{exp.ordinal}"
            exports.append(name)
            
    print(f"\n==================== {f} ====================")
    print("Resources:")
    for k, v in res_summary.items():
        print(f"  {k} ({len(v)}): {v[:10]}")
    print(f"Exports ({len(exports)}):", exports[:20])
    pe.close()

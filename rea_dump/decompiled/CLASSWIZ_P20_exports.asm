
; ==================== EXPORT: GetCushionColor (RVA: 0x11F0, Offset: 0x5F0) ====================
0x000011F0:  mov      eax, 0xababab
0x000011F5:  ret      

; ==================== EXPORT: GetDisplayPosition (RVA: 0x1080, Offset: 0x480) ====================
0x00001080:  push     ebp
0x00001081:  mov      ebp, esp
0x00001083:  mov      eax, dword ptr [ebp + 8]
0x00001086:  mov      ecx, dword ptr [ebp + 0xc]
0x00001089:  mov      dword ptr [eax], 0x82
0x0000108F:  mov      dword ptr [ecx], 0x100
0x00001095:  pop      ebp
0x00001096:  ret      8

; ==================== EXPORT: GetFaceSize (RVA: 0x1020, Offset: 0x420) ====================
0x00001020:  push     ebp
0x00001021:  mov      ebp, esp
0x00001023:  mov      eax, dword ptr [0x10004a54]
0x00001028:  mov      ecx, dword ptr [0x10004a58]
0x0000102E:  sub      esp, 0x18
0x00001031:  push     ebx
0x00001032:  mov      ebx, dword ptr [ebp + 0xc]
0x00001035:  push     edi
0x00001036:  mov      edi, dword ptr [ebp + 8]
0x00001039:  mov      dword ptr [edi], eax
0x0000103B:  mov      dword ptr [ebx], ecx
0x0000103D:  test     eax, eax
0x0000103F:  jle      0x1045
0x00001041:  test     ecx, ecx
0x00001043:  jg       0x1075
0x00001045:  mov      eax, dword ptr [0x10004a50]
0x0000104A:  push     esi
0x0000104B:  push     0x67
0x0000104D:  push     eax
0x0000104E:  call     dword ptr [0x10003094]
0x00001054:  lea      ecx, [ebp - 0x18]
0x00001057:  push     ecx
0x00001058:  mov      esi, eax
0x0000105A:  push     0x18
0x0000105C:  push     esi
0x0000105D:  call     dword ptr [0x10003004]
0x00001063:  mov      edx, dword ptr [ebp - 0x14]
0x00001066:  mov      eax, dword ptr [ebp - 0x10]
0x00001069:  mov      dword ptr [edi], edx
0x0000106B:  push     esi
0x0000106C:  mov      dword ptr [ebx], eax
0x0000106E:  call     dword ptr [0x10003000]
0x00001074:  pop      esi
0x00001075:  pop      edi
0x00001076:  pop      ebx
0x00001077:  mov      esp, ebp
0x00001079:  pop      ebp
0x0000107A:  ret      8

; ==================== EXPORT: GetKeyCount (RVA: 0x10F0, Offset: 0x4F0) ====================
0x000010F0:  mov      eax, 0x32
0x000010F5:  ret      

; ==================== EXPORT: GetKeyFrameColor (RVA: 0x11E0, Offset: 0x5E0) ====================
0x000011E0:  mov      eax, 0xff00ff
0x000011E5:  ret      

; ==================== EXPORT: GetKeyInfo (RVA: 0x1100, Offset: 0x500) ====================
0x00001100:  push     ebp
0x00001101:  mov      ebp, esp
0x00001103:  mov      ecx, dword ptr [ebp + 0xc]
0x00001106:  sub      esp, 0x18
0x00001109:  lea      eax, [ebp - 0x18]
0x0000110C:  call     0x13b0
0x00001111:  mov      ecx, dword ptr [ebp + 8]
0x00001114:  mov      edx, dword ptr [eax]
0x00001116:  mov      dword ptr [ecx], edx
0x00001118:  mov      edx, dword ptr [eax + 4]
0x0000111B:  mov      dword ptr [ecx + 4], edx
0x0000111E:  mov      edx, dword ptr [eax + 8]
0x00001121:  mov      dword ptr [ecx + 8], edx
0x00001124:  mov      edx, dword ptr [eax + 0xc]
0x00001127:  mov      dword ptr [ecx + 0xc], edx
0x0000112A:  mov      edx, dword ptr [eax + 0x10]
0x0000112D:  mov      eax, dword ptr [eax + 0x14]
0x00001130:  mov      dword ptr [ecx + 0x10], edx
0x00001133:  mov      dword ptr [ecx + 0x14], eax
0x00001136:  mov      eax, ecx
0x00001138:  mov      esp, ebp
0x0000113A:  pop      ebp
0x0000113B:  ret      8

; ==================== EXPORT: GetKeyPosition (RVA: 0x10C0, Offset: 0x4C0) ====================
0x000010C0:  mov      eax, 0x1b8
0x000010C5:  ret      

; ==================== EXPORT: GetKeyboardInfo (RVA: 0x1140, Offset: 0x540) ====================
0x00001140:  push     ebp
0x00001141:  mov      ebp, esp
0x00001143:  mov      eax, dword ptr [ebp + 8]
0x00001146:  test     eax, eax
0x00001148:  je       0x115a
0x0000114A:  mov      ecx, dword ptr [ebp + 0x10]
0x0000114D:  push     0
0x0000114F:  push     ecx
0x00001150:  push     eax
0x00001151:  call     0x1420
0x00001156:  pop      ebp
0x00001157:  ret      0xc

; ==================== EXPORT: GetKeylogCharcterW (RVA: 0x12F0, Offset: 0x6F0) ====================
0x000012F0:  push     ebp
0x000012F1:  mov      ebp, esp
0x000012F3:  and      esp, 0xfffffff8
0x000012F6:  push     ecx
0x000012F7:  mov      edx, dword ptr [ebp + 0xc]
0x000012FA:  push     esi
0x000012FB:  mov      esi, dword ptr [ebp + 8]
0x000012FE:  xor      ecx, ecx
0x00001300:  xor      eax, eax
0x00001302:  cmp      dword ptr [eax + 0x10004010], esi
0x00001308:  jne      0x1312
0x0000130A:  cmp      dword ptr [eax + 0x10004014], edx
0x00001310:  je       0x1324
0x00001312:  add      eax, 0x24
0x00001315:  inc      ecx
0x00001316:  cmp      eax, 0x708
0x0000131B:  jb       0x1302
0x0000131D:  xor      eax, eax
0x0000131F:  pop      esi
0x00001320:  mov      esp, ebp
0x00001322:  pop      ebp
0x00001323:  ret      

; ==================== EXPORT: GetKeylogFontA (RVA: 0x1370, Offset: 0x770) ====================
0x00001370:  push     ebp
0x00001371:  mov      ebp, esp
0x00001373:  push     esi
0x00001374:  mov      esi, dword ptr [ebp + 8]
0x00001377:  xor      eax, eax
0x00001379:  test     esi, esi
0x0000137B:  je       0x13a9
0x0000137D:  push     eax
0x0000137E:  push     eax
0x0000137F:  mov      eax, dword ptr [ebp + 0xc]
0x00001382:  push     eax
0x00001383:  push     esi
0x00001384:  push     -1
0x00001386:  push     0x100030d8
0x0000138B:  push     0
0x0000138D:  push     0
0x0000138F:  call     dword ptr [0x10003014]
0x00001395:  mov      eax, esi
0x00001397:  lea      edx, [eax + 1]
0x0000139A:  lea      ebx, [ebx]
0x000013A0:  mov      cl, byte ptr [eax]
0x000013A2:  inc      eax
0x000013A3:  test     cl, cl
0x000013A5:  jne      0x13a0
0x000013A7:  sub      eax, edx
0x000013A9:  pop      esi
0x000013AA:  pop      ebp
0x000013AB:  ret      

; ==================== EXPORT: GetKeylogFontW (RVA: 0x1340, Offset: 0x740) ====================
0x00001340:  push     ebp
0x00001341:  mov      ebp, esp
0x00001343:  mov      eax, dword ptr [ebp + 8]
0x00001346:  test     eax, eax
0x00001348:  je       0x135f
0x0000134A:  mov      ecx, dword ptr [ebp + 0xc]
0x0000134D:  push     0x100030d8
0x00001352:  shr      ecx, 1
0x00001354:  push     ecx
0x00001355:  push     eax
0x00001356:  call     dword ptr [0x10003088]
0x0000135C:  add      esp, 0xc
0x0000135F:  mov      eax, 0xe
0x00001364:  pop      ebp
0x00001365:  ret      

; ==================== EXPORT: GetKeylogStringCW (RVA: 0x1280, Offset: 0x680) ====================
0x00001280:  push     ebp
0x00001281:  mov      ebp, esp
0x00001283:  mov      dx, word ptr [ebp + 8]
0x00001287:  xor      ecx, ecx
0x00001289:  xor      eax, eax
0x0000128B:  jmp      0x1290

; ==================== EXPORT: GetKeylogStringW (RVA: 0x1200, Offset: 0x600) ====================
0x00001200:  push     ebp
0x00001201:  mov      ebp, esp
0x00001203:  and      esp, 0xfffffff8
0x00001206:  push     ecx
0x00001207:  mov      edx, dword ptr [ebp + 0xc]
0x0000120A:  push     esi
0x0000120B:  mov      esi, dword ptr [ebp + 8]
0x0000120E:  xor      ecx, ecx
0x00001210:  xor      eax, eax
0x00001212:  cmp      dword ptr [eax + 0x10004010], esi
0x00001218:  jne      0x1222
0x0000121A:  cmp      dword ptr [eax + 0x10004014], edx
0x00001220:  je       0x1234
0x00001222:  add      eax, 0x24
0x00001225:  inc      ecx
0x00001226:  cmp      eax, 0x708
0x0000122B:  jb       0x1212
0x0000122D:  xor      eax, eax
0x0000122F:  pop      esi
0x00001230:  mov      esp, ebp
0x00001232:  pop      ebp
0x00001233:  ret      

; ==================== EXPORT: GetSymbolPosition (RVA: 0x10A0, Offset: 0x4A0) ====================
0x000010A0:  push     ebp
0x000010A1:  mov      ebp, esp
0x000010A3:  mov      eax, dword ptr [ebp + 8]
0x000010A6:  mov      ecx, dword ptr [ebp + 0xc]
0x000010A9:  mov      dword ptr [eax], 0x82
0x000010AF:  mov      dword ptr [ecx], 0xed
0x000010B5:  pop      ebp
0x000010B6:  ret      8

; ==================== EXPORT: IsAcKeyCode (RVA: 0x11B0, Offset: 0x5B0) ====================
0x000011B0:  push     ebp
0x000011B1:  mov      ebp, esp
0x000011B3:  and      esp, 0xfffffff8
0x000011B6:  cmp      dword ptr [ebp + 8], 4
0x000011BA:  jne      0x11cd
0x000011BC:  cmp      dword ptr [ebp + 0xc], 0x10
0x000011C0:  jne      0x11cd
0x000011C2:  mov      eax, 1
0x000011C7:  mov      esp, ebp
0x000011C9:  pop      ebp
0x000011CA:  ret      8

; ==================== EXPORT: IsOnKeyCode (RVA: 0x1180, Offset: 0x580) ====================
0x00001180:  push     ebp
0x00001181:  mov      ebp, esp
0x00001183:  and      esp, 0xfffffff8
0x00001186:  cmp      dword ptr [ebp + 8], 0
0x0000118A:  jne      0x119d
0x0000118C:  cmp      dword ptr [ebp + 0xc], 0
0x00001190:  jne      0x119d
0x00001192:  mov      eax, 1
0x00001197:  mov      esp, ebp
0x00001199:  pop      ebp
0x0000119A:  ret      8

; ==================== EXPORT: LoadBitmapData (RVA: 0x10D0, Offset: 0x4D0) ====================
0x000010D0:  push     ebp
0x000010D1:  mov      ebp, esp
0x000010D3:  mov      eax, dword ptr [0x10004a50]
0x000010D8:  push     0x67
0x000010DA:  push     eax
0x000010DB:  call     dword ptr [0x10003094]
0x000010E1:  mov      ecx, dword ptr [ebp + 8]
0x000010E4:  mov      dword ptr [ecx], eax
0x000010E6:  call     dword ptr [0x10003018]
0x000010EC:  pop      ebp
0x000010ED:  ret      4
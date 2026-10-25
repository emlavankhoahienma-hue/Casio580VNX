// DECOMPILED DISASSEMBLY OF SimU8engine.dll
// Base: 0x10000000


// Function: ??0CSimU8core@@QAE@XZ (RVA: 0x2950, VA: 0x10002950)
    0x10002950:  push     ebp
    0x10002951:  mov      ebp, esp
    0x10002953:  push     -1
    0x10002955:  push     0x1000895a
    0x1000295A:  mov      eax, dword ptr fs:[0]
    0x10002960:  push     eax
    0x10002961:  push     ecx
    0x10002962:  push     ebx
    0x10002963:  push     esi
    0x10002964:  push     edi
    0x10002965:  mov      eax, dword ptr [0x1000b0b8]
    0x1000296A:  xor      eax, ebp
    0x1000296C:  push     eax
    0x1000296D:  lea      eax, [ebp - 0xc]
    0x10002970:  mov      dword ptr fs:[0], eax
    0x10002976:  mov      edi, ecx
    0x10002978:  mov      dword ptr [ebp - 0x10], edi
    0x1000297B:  lea      ecx, [edi + 4]
    0x1000297E:  mov      dword ptr [edi], 0x10009194
    0x10002984:  call     0x10001000
    0x10002989:  xor      ebx, ebx
    0x1000298B:  lea      ecx, [edi + 0x2c]
    0x1000298E:  mov      dword ptr [ebp - 4], ebx
    0x10002991:  call     0x10007d60
    0x10002996:  lea      ecx, [edi + 0x48]
    0x10002999:  mov      byte ptr [ebp - 4], 1
    0x1000299D:  call     0x10007d60
    0x100029A2:  lea      ecx, [edi + 0x64]
    0x100029A5:  mov      byte ptr [ebp - 4], 2
    0x100029A9:  call     0x10007d60
    0x100029AE:  lea      ecx, [edi + 0x80]
    0x100029B4:  mov      byte ptr [ebp - 4], 3
    0x100029B8:  call     0x10001930
    0x100029BD:  lea      ecx, [edi + 0xe0]
    0x100029C3:  mov      byte ptr [ebp - 4], 4
    0x100029C7:  call     0x10007ec0
    0x100029CC:  mov      byte ptr [edi + 0xb9], bl
    0x100029D2:  mov      byte ptr [edi + 0xf8], bl
    0x100029D8:  lea      esi, [edi + 0x100]
    0x100029DE:  mov      dword ptr [ebp - 0x10], 0x40
    0x100029E5:  push     0x10009198
    0x100029EA:  lea      eax, [esi + 0xe]
    0x100029ED:  push     0x14
    0x100029EF:  push     eax
    0x100029F0:  mov      dword ptr [esi - 4], ebx
    0x100029F3:  mov      dword ptr [esi], ebx
    0x100029F5:  mov      word ptr [esi + 4], bx
    0x100029F9:  mov      dword ptr [esi + 8], ebx
    0x100029FC:  mov      word ptr [esi + 0xc], bx
    0x10002A00:  call     dword ptr [0x10009098]
    0x10002A06:  add      esp, 0xc
    0x10002A09:  add      esi, 0x28
    0x10002A0C:  dec      dword ptr [ebp - 0x10]
    0x10002A0F:  jne      0x100029e5
    0x10002A11:  mov      eax, 1
    0x10002A16:  mov      dword ptr [edi + 0xbc], ebx
    0x10002A1C:  mov      dword ptr [edi + 0xb0], 0xffffffff
    0x10002A26:  mov      dword ptr [edi + 0xc0], ebx
    0x10002A2C:  mov      dword ptr [edi + 0xc8], eax
    0x10002A32:  mov      dword ptr [edi + 0xd0], eax
    0x10002A38:  mov      dword ptr [edi + 0xd8], eax
    0x10002A3E:  mov      byte ptr [edi + 0xb00], al
    0x10002A44:  mov      dword ptr [edi + 0xc4], ebx
    0x10002A4A:  mov      dword ptr [edi + 0xcc], ebx
    0x10002A50:  mov      dword ptr [edi + 0xd4], ebx
    0x10002A56:  mov      dword ptr [edi + 0xdc], ebx
    0x10002A5C:  mov      byte ptr [edi + 0xad], bl
    0x10002A62:  mov      byte ptr [edi + 0xb8], bl
    0x10002A68:  mov      eax, edi
    0x10002A6A:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002A6D:  mov      dword ptr fs:[0], ecx
    0x10002A74:  pop      ecx
    0x10002A75:  pop      edi
    0x10002A76:  pop      esi
    0x10002A77:  pop      ebx
    0x10002A78:  mov      esp, ebp
    0x10002A7A:  pop      ebp
    0x10002A7B:  ret      

// Function: ??1CSimU8core@@UAE@XZ (RVA: 0x1A10, VA: 0x10001A10)
    0x10001A10:  push     ebp
    0x10001A11:  mov      ebp, esp
    0x10001A13:  push     -1
    0x10001A15:  push     0x100088fa
    0x10001A1A:  mov      eax, dword ptr fs:[0]
    0x10001A20:  push     eax
    0x10001A21:  push     ecx
    0x10001A22:  push     esi
    0x10001A23:  mov      eax, dword ptr [0x1000b0b8]
    0x10001A28:  xor      eax, ebp
    0x10001A2A:  push     eax
    0x10001A2B:  lea      eax, [ebp - 0xc]
    0x10001A2E:  mov      dword ptr fs:[0], eax
    0x10001A34:  mov      esi, ecx
    0x10001A36:  mov      dword ptr [ebp - 0x10], esi
    0x10001A39:  mov      dword ptr [esi], 0x10009194
    0x10001A3F:  lea      ecx, [esi + 0xe0]
    0x10001A45:  mov      dword ptr [ebp - 4], 4
    0x10001A4C:  call     0x10007ea8
    0x10001A51:  lea      ecx, [esi + 0x80]
    0x10001A57:  mov      byte ptr [ebp - 4], 3
    0x10001A5B:  call     0x100016b0
    0x10001A60:  lea      ecx, [esi + 0x64]
    0x10001A63:  mov      byte ptr [ebp - 4], 2
    0x10001A67:  call     0x10007dd0
    0x10001A6C:  lea      ecx, [esi + 0x48]
    0x10001A6F:  mov      byte ptr [ebp - 4], 1
    0x10001A73:  call     0x10007dd0
    0x10001A78:  lea      ecx, [esi + 0x2c]
    0x10001A7B:  mov      byte ptr [ebp - 4], 0
    0x10001A7F:  call     0x10007dd0
    0x10001A84:  lea      ecx, [esi + 4]
    0x10001A87:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10001A8E:  call     0x10001010
    0x10001A93:  mov      ecx, dword ptr [ebp - 0xc]
    0x10001A96:  mov      dword ptr fs:[0], ecx
    0x10001A9D:  pop      ecx
    0x10001A9E:  pop      esi
    0x10001A9F:  mov      esp, ebp
    0x10001AA1:  pop      ebp
    0x10001AA2:  ret      

// Function: ??_7CSimU8core@@6B@ (RVA: 0x9194, VA: 0x10009194)
    0x10009194:  lock sub byte ptr [eax], al
    0x10009197:  adc      byte ptr [eax], al
    0x10009199:  add      byte ptr [eax], al
    0x1000919B:  add      byte ptr [ebx - 0x7cbf7c8c], al
    0x100091A1:  inc      ebx
    0x100091A2:  or       dword ptr [ebx + 0x4f8ae197], 0xffffff82
    0x100091A9:  stosb    byte ptr es:[edi], al
    0x100091AA:  xchg     esp, eax
    0x100091AB:  lodsd    eax, dword ptr [esi]
    0x100091AC:  nop      
    0x100091AD:  mov      dh, 0x82
    0x100091AF:  mov      ch, 0x82
    0x100091B1:  fadd     qword ptr [edx - 0x7e427d4b]
    0x100091B7:  inc      edx
    0x100091B8:  or       cl, byte ptr [ebx - 0x6c586f53]
    0x100091BE:  dec      ecx
    0x100091BF:  or       cl, 0x8f
    0x100091C2:  dec      ecx
    0x100091C3:  xchg     edi, eax
    0x100091C4:  mov      ecx, 0xdc82b582
    0x100091C9:  xor      byte ptr [edi + 0x4281], 0
    0x100091D0:  cmp      eax, 0x3d3d3d3d
    0x100091D5:  cmp      eax, 0x3d3d3d3d
    0x100091DA:  cmp      eax, 0x3d3d3d3d
    0x100091DF:  cmp      eax, 0x3d3d3d3d
    0x100091E4:  cmp      eax, 0x3d3d3d3d
    0x100091E9:  cmp      eax, 0x3d3d3d3d
    0x100091EE:  cmp      eax, 0x3d3d3d3d
    0x100091F3:  cmp      eax, 0x3d3d3d3d
    0x100091F8:  cmp      eax, 0x3d3d3d3d
    0x100091FD:  cmp      eax, 0x3d3d3d3d
    0x10009202:  cmp      eax, 0x3d3d3d3d
    0x10009207:  cmp      eax, 0x3d3d3d3d
    0x1000920C:  cmp      eax, 0x3d3d3d3d
    0x10009211:  cmp      eax, 0x3d3d3d3d
    0x10009216:  cmp      eax, 0x3d3d3d3d
    0x1000921B:  cmp      eax, 0x3d3d3d3d
    0x10009220:  cmp      eax, 0x3d3d3d3d
    0x10009225:  cmp      eax, 0x3d3d3d3d
    0x1000922A:  cmp      eax, 0x3d3d3d3d
    0x1000922F:  cmp      eax, 0x3d3d3d3d
    0x10009234:  cmp      eax, 0x3d3d3d3d
    0x10009239:  cmp      eax, 0x3d3d3d3d
    0x1000923E:  cmp      eax, 0xa
    0x10009243:  add      byte ptr [eax], al
    0x10009245:  add      byte ptr [eax], al
    0x10009247:  add      byte ptr [eax], ah
    0x10009249:  and      byte ptr [eax], ah
    0x1000924B:  and      byte ptr [eax], ah
    0x1000924D:  and      byte ptr [eax], ah
    0x1000924F:  push     eax
    0x10009250:  inc      ebx
    0x10009251:  and      byte ptr [eax], ah
    0x10009253:  and      byte ptr [eax], ah
    0x10009255:  inc      ebx
    0x10009256:  outsd    dx, dword ptr [esi]
    0x10009257:  and      byte ptr gs:[eax], ah
    0x1000925B:  and      byte ptr [eax], ah
    0x1000925D:  and      byte ptr [eax], ah
    0x1000925F:  push     eax
    0x10009260:  push     ebx
    0x10009261:  push     edi
    0x10009262:  and      byte ptr [edx + 0x30], dl
    0x10009265:  and      byte ptr [eax], ah
    0x10009267:  push     edx
    0x10009268:  xor      dword ptr [eax], esp
    0x1000926A:  and      byte ptr [edx + 0x32], dl
    0x1000926D:  and      byte ptr [eax], ah
    0x1000926F:  push     edx
    0x10009270:  xor      esp, dword ptr [eax]
    0x10009272:  and      byte ptr [edx + 0x34], dl
    0x10009275:  and      byte ptr [eax], ah
    0x10009277:  push     edx
    0x10009278:  xor      eax, 0x36522020
    0x1000927D:  and      byte ptr [eax], ah
    0x1000927F:  push     edx
    0x10009280:  aaa      
    0x10009281:  and      byte ptr [eax], ah
    0x10009283:  push     edx
    0x10009284:  cmp      byte ptr [eax], ah
    0x10009286:  and      byte ptr [edx + 0x39], dl
    0x10009289:  and      byte ptr [eax], ah
    0x1000928B:  push     edx
    0x1000928C:  xor      dword ptr [eax], esi
    0x1000928E:  and      byte ptr [edx + 0x31], dl
    0x10009291:  xor      dword ptr [eax], esp
    0x10009293:  push     edx
    0x10009294:  xor      dword ptr [edx], esi
    0x10009296:  and      byte ptr [edx + 0x31], dl
    0x10009299:  xor      esp, dword ptr [eax]
    0x1000929B:  push     edx
    0x1000929C:  xor      dword ptr [eax], esi
    0x1000929F:  push     edx
    0x100092A0:  xor      dword ptr [0x20414520], esi
    0x100092A6:  and      byte ptr [eax], ah
    0x100092A8:  push     ebx
    0x100092A9:  push     eax
    0x100092AA:  and      byte ptr [eax], ah
    0x100092AC:  and      byte ptr [edx + edx*2 + 0xa], cl
    0x100092B0:  add      byte ptr [eax], al
    0x100092B2:  add      byte ptr [eax], al
    0x100092B4:  xor      dword ptr [ebx + eax*4 + 0x40], 0xffffff83
    0x100092B9:  inc      ebx
    0x100092BA:  or       dword ptr [ebx + 0x20732520], 0xffffff82
    0x100092C1:  lock or  dword ptr [ecx - 0x7f], 0x5b
    0x100092C6:  xor      dword ptr [esi - 0x7d], 0xffffff93
    0x100092CA:  add      ch, 0x82
    0x100092CD:  stosd    dword ptr es:[edi], eax
    0x100092CE:  sbb      ah, 0x82
    0x100092D1:  mov      ecx, 0x4281f182
    0x100092D6:  or       cl, byte ptr [esi - 0x7d8c7240]

// Function: ?AnalyzeInputHexFile@CSimU8core@@QAEHAAV?$CStringT@DV?$StrTraitMFC_DLL@DV?$ChTraitsCRT@D@ATL@@@@@ATL@@@Z (RVA: 0x3E10, VA: 0x10003E10)
    0x10003E10:  push     ebp
    0x10003E11:  mov      ebp, esp
    0x10003E13:  sub      esp, 0x10
    0x10003E16:  push     esi
    0x10003E17:  push     edi
    0x10003E18:  mov      edi, dword ptr [ebp + 8]
    0x10003E1B:  mov      esi, ecx
    0x10003E1D:  lea      eax, [ebp - 0x10]
    0x10003E20:  push     eax
    0x10003E21:  lea      ecx, [ebp - 8]
    0x10003E24:  push     ecx
    0x10003E25:  push     edi
    0x10003E26:  mov      ecx, esi
    0x10003E28:  mov      dword ptr [ebp - 8], 0
    0x10003E2F:  mov      dword ptr [ebp - 4], 0
    0x10003E36:  mov      dword ptr [ebp - 0x10], 0xffffffff
    0x10003E3D:  mov      dword ptr [ebp - 0xc], 0
    0x10003E44:  call     0x10002f90
    0x10003E49:  test     eax, eax
    0x10003E4B:  jne      0x10003e70
    0x10003E4D:  cmp      dword ptr [ebp - 4], eax
    0x10003E50:  ja       0x10003e5b
    0x10003E52:  cmp      dword ptr [ebp - 8], 0xfffff
    0x10003E59:  jbe      0x10003e68
    0x10003E5B:  pop      edi
    0x10003E5C:  mov      eax, 8
    0x10003E61:  pop      esi
    0x10003E62:  mov      esp, ebp
    0x10003E64:  pop      ebp
    0x10003E65:  ret      4

// Function: ?AnalyzeIntelHex@CSimU8core@@QAEHAAV?$CStringT@DV?$StrTraitMFC_DLL@DV?$ChTraitsCRT@D@ATL@@@@@ATL@@@Z (RVA: 0x2BC0, VA: 0x10002BC0)
    0x10002BC0:  push     ebp
    0x10002BC1:  mov      ebp, esp
    0x10002BC3:  push     -1
    0x10002BC5:  push     0x100089c1
    0x10002BCA:  mov      eax, dword ptr fs:[0]
    0x10002BD0:  push     eax
    0x10002BD1:  sub      esp, 0x38
    0x10002BD4:  push     ebx
    0x10002BD5:  push     esi
    0x10002BD6:  push     edi
    0x10002BD7:  mov      eax, dword ptr [0x1000b0b8]
    0x10002BDC:  xor      eax, ebp
    0x10002BDE:  push     eax
    0x10002BDF:  lea      eax, [ebp - 0xc]
    0x10002BE2:  mov      dword ptr fs:[0], eax
    0x10002BE8:  mov      ebx, ecx
    0x10002BEA:  xor      esi, esi
    0x10002BEC:  lea      ecx, [ebp - 0x44]
    0x10002BEF:  mov      dword ptr [ebp - 0x18], esi
    0x10002BF2:  call     0x10007ec0
    0x10002BF7:  mov      ecx, dword ptr [ebp + 8]
    0x10002BFA:  push     esi
    0x10002BFB:  push     0x4000
    0x10002C00:  mov      dword ptr [ebp - 4], esi
    0x10002C03:  call     dword ptr [0x10009134]
    0x10002C09:  push     eax
    0x10002C0A:  lea      ecx, [ebp - 0x44]
    0x10002C0D:  call     0x10007ede
    0x10002C12:  test     eax, eax
    0x10002C14:  je       0x10002f4b
    0x10002C1A:  lea      ecx, [ebp - 0x44]
    0x10002C1D:  call     0x10007ed8
    0x10002C22:  or       eax, edx
    0x10002C24:  jne      0x10002c4c
    0x10002C26:  lea      ecx, [ebp - 0x44]
    0x10002C29:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002C30:  call     0x10007ea8
    0x10002C35:  lea      eax, [esi + 0xd]
    0x10002C38:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002C3B:  mov      dword ptr fs:[0], ecx
    0x10002C42:  pop      ecx
    0x10002C43:  pop      edi
    0x10002C44:  pop      esi
    0x10002C45:  pop      ebx
    0x10002C46:  mov      esp, ebp
    0x10002C48:  pop      ebp
    0x10002C49:  ret      4

// Function: ?CheckIntelHexCheckSum@CSimU8core@@QAEHAAV?$CStringT@DV?$StrTraitMFC_DLL@DV?$ChTraitsCRT@D@ATL@@@@@ATL@@@Z (RVA: 0x1C80, VA: 0x10001C80)
    0x10001C80:  push     ebp
    0x10001C81:  mov      ebp, esp
    0x10001C83:  sub      esp, 8
    0x10001C86:  push     esi
    0x10001C87:  push     edi
    0x10001C88:  mov      edi, dword ptr [ebp + 8]
    0x10001C8B:  mov      dword ptr [ebp - 8], ecx
    0x10001C8E:  mov      ecx, edi
    0x10001C90:  mov      byte ptr [ebp - 1], 0
    0x10001C94:  xor      esi, esi
    0x10001C96:  call     dword ptr [0x10009158]
    0x10001C9C:  dec      eax
    0x10001C9D:  cdq      
    0x10001C9E:  sub      eax, edx
    0x10001CA0:  sar      eax, 1
    0x10001CA2:  test     eax, eax
    0x10001CA4:  jle      0x10001cda
    0x10001CA6:  push     ebx
    0x10001CA7:  mov      ebx, 1
    0x10001CAC:  lea      esp, [esp]
    0x10001CB0:  mov      ecx, dword ptr [ebp - 8]
    0x10001CB3:  push     ebx
    0x10001CB4:  push     edi
    0x10001CB5:  call     0x10001b20
    0x10001CBA:  add      byte ptr [ebp - 1], al
    0x10001CBD:  mov      ecx, edi
    0x10001CBF:  inc      esi
    0x10001CC0:  add      ebx, 2
    0x10001CC3:  call     dword ptr [0x10009158]
    0x10001CC9:  dec      eax
    0x10001CCA:  cdq      
    0x10001CCB:  sub      eax, edx
    0x10001CCD:  sar      eax, 1
    0x10001CCF:  cmp      esi, eax
    0x10001CD1:  jl       0x10001cb0
    0x10001CD3:  cmp      byte ptr [ebp - 1], 0
    0x10001CD7:  pop      ebx
    0x10001CD8:  jne      0x10001ce7
    0x10001CDA:  pop      edi
    0x10001CDB:  mov      eax, 1
    0x10001CE0:  pop      esi
    0x10001CE1:  mov      esp, ebp
    0x10001CE3:  pop      ebp
    0x10001CE4:  ret      4

// Function: ?GetSimRun@CSimU8core@@QAEEXZ (RVA: 0x1A00, VA: 0x10001A00)
    0x10001A00:  mov      al, byte ptr [ecx + 0xb9]
    0x10001A06:  ret      

// Function: ?InitSetting@CSimU8core@@QAEXXZ (RVA: 0x3F30, VA: 0x10003F30)
    0x10003F30:  push     ebp
    0x10003F31:  mov      ebp, esp
    0x10003F33:  sub      esp, 8
    0x10003F36:  push     ebx
    0x10003F37:  push     esi
    0x10003F38:  push     edi
    0x10003F39:  mov      esi, ecx
    0x10003F3B:  lea      eax, [ebp - 4]
    0x10003F3E:  push     eax
    0x10003F3F:  lea      ecx, [ebp - 8]
    0x10003F42:  push     ecx
    0x10003F43:  lea      ecx, [esi + 0x2c]
    0x10003F46:  call     0x10007960
    0x10003F4B:  mov      edx, dword ptr [ebp - 8]
    0x10003F4E:  cmp      edx, dword ptr [ebp - 4]
    0x10003F51:  jbe      0x100040dd
    0x10003F57:  push     0xffff
    0x10003F5C:  push     0
    0x10003F5E:  lea      ecx, [esi + 0x2c]
    0x10003F61:  call     0x10007de0
    0x10003F66:  push     0xeffff
    0x10003F6B:  push     0
    0x10003F6D:  lea      ecx, [esi + 0x64]
    0x10003F70:  call     0x10007de0
    0x10003F75:  mov      eax, dword ptr [esi + 0xc4]
    0x10003F7B:  mov      dword ptr [esi + 0xc8], 0
    0x10003F85:  mov      dword ptr [esi + 0xcc], 0xfffff
    0x10003F8F:  cmp      eax, 1
    0x10003F92:  jne      0x100040dd
    0x10003F98:  mov      ecx, dword ptr [0x10009068]
    0x10003F9E:  mov      edx, dword ptr [0x10009064]
    0x10003FA4:  push     ecx
    0x10003FA5:  push     0x10009374
    0x10003FAA:  push     edx
    0x10003FAB:  call     0x100033d0
    0x10003FB0:  add      esp, 8
    0x10003FB3:  mov      ecx, eax
    0x10003FB5:  call     dword ptr [0x10009060]
    0x10003FBB:  mov      eax, dword ptr [0x10009068]
    0x10003FC0:  mov      ecx, dword ptr [esi + 0xcc]
    0x10003FC6:  mov      edx, dword ptr [esi + 0xc8]
    0x10003FCC:  push     eax
    0x10003FCD:  mov      eax, dword ptr [0x10009064]
    0x10003FD2:  push     ecx
    0x10003FD3:  push     0x10009330
    0x10003FD8:  push     edx
    0x10003FD9:  push     0x10001990
    0x10003FDE:  push     0x10009320
    0x10003FE3:  push     eax
    0x10003FE4:  call     0x100033d0
    0x10003FE9:  add      esp, 8
    0x10003FEC:  mov      ecx, eax
    0x10003FEE:  call     dword ptr [0x1000905c]
    0x10003FF4:  mov      ecx, eax
    0x10003FF6:  call     dword ptr [0x10009058]
    0x10003FFC:  push     eax
    0x10003FFD:  call     0x100033d0
    0x10004002:  add      esp, 8
    0x10004005:  mov      ecx, eax
    0x10004007:  call     dword ptr [0x10009058]
    0x1000400D:  mov      ecx, eax
    0x1000400F:  call     dword ptr [0x10009060]
    0x10004015:  lea      ecx, [ebp - 4]
    0x10004018:  push     ecx
    0x10004019:  lea      edx, [ebp - 8]
    0x1000401C:  push     edx
    0x1000401D:  lea      ecx, [esi + 0x2c]
    0x10004020:  call     0x10007960
    0x10004025:  mov      eax, dword ptr [0x10009068]
    0x1000402A:  mov      ecx, dword ptr [ebp - 4]
    0x1000402D:  mov      edx, dword ptr [ebp - 8]
    0x10004030:  push     eax
    0x10004031:  mov      eax, dword ptr [0x10009064]
    0x10004036:  push     ecx
    0x10004037:  push     0x10009318
    0x1000403C:  push     edx
    0x1000403D:  push     0x10001990
    0x10004042:  push     0x10009308
    0x10004047:  push     eax
    0x10004048:  call     0x100033d0
    0x1000404D:  add      esp, 8
    0x10004050:  mov      ecx, eax
    0x10004052:  call     dword ptr [0x1000905c]
    0x10004058:  mov      ecx, eax
    0x1000405A:  call     dword ptr [0x10009058]
    0x10004060:  push     eax
    0x10004061:  call     0x100033d0
    0x10004066:  add      esp, 8
    0x10004069:  mov      ecx, eax
    0x1000406B:  call     dword ptr [0x10009058]
    0x10004071:  mov      ecx, eax
    0x10004073:  call     dword ptr [0x10009060]
    0x10004079:  lea      ecx, [ebp - 4]
    0x1000407C:  push     ecx
    0x1000407D:  lea      edx, [ebp - 8]
    0x10004080:  push     edx
    0x10004081:  lea      ecx, [esi + 0x64]
    0x10004084:  call     0x10007960
    0x10004089:  mov      eax, dword ptr [0x10009068]
    0x1000408E:  mov      ecx, dword ptr [ebp - 4]
    0x10004091:  mov      edx, dword ptr [ebp - 8]
    0x10004094:  push     eax
    0x10004095:  mov      eax, dword ptr [0x10009064]
    0x1000409A:  push     ecx
    0x1000409B:  push     0x10009318
    0x100040A0:  push     edx
    0x100040A1:  push     0x10001990
    0x100040A6:  push     0x100092f8
    0x100040AB:  push     eax
    0x100040AC:  call     0x100033d0
    0x100040B1:  add      esp, 8
    0x100040B4:  mov      ecx, eax
    0x100040B6:  call     dword ptr [0x1000905c]
    0x100040BC:  mov      ecx, eax
    0x100040BE:  call     dword ptr [0x10009058]
    0x100040C4:  push     eax
    0x100040C5:  call     0x100033d0
    0x100040CA:  add      esp, 8
    0x100040CD:  mov      ecx, eax
    0x100040CF:  call     dword ptr [0x10009058]
    0x100040D5:  mov      ecx, eax
    0x100040D7:  call     dword ptr [0x10009060]
    0x100040DD:  lea      ecx, [ebp - 4]
    0x100040E0:  push     ecx
    0x100040E1:  lea      edx, [ebp - 8]
    0x100040E4:  push     edx
    0x100040E5:  lea      ecx, [esi + 0x48]
    0x100040E8:  call     0x10007960
    0x100040ED:  mov      eax, dword ptr [ebp - 8]
    0x100040F0:  cmp      eax, dword ptr [ebp - 4]
    0x100040F3:  jbe      0x10004284
    0x100040F9:  push     0xffff
    0x100040FE:  push     0
    0x10004100:  lea      ecx, [esi + 0x48]
    0x10004103:  call     0x10007de0
    0x10004108:  push     0xfeffff
    0x1000410D:  push     0
    0x1000410F:  lea      ecx, [esi + 0x64]
    0x10004112:  call     0x10007de0
    0x10004117:  mov      ecx, dword ptr [esi + 0xc4]
    0x1000411D:  mov      dword ptr [esi + 0xd0], 0

// Function: ?InputFileClassify@CSimU8core@@QAEHAAV?$CStringT@DV?$StrTraitMFC_DLL@DV?$ChTraitsCRT@D@ATL@@@@@ATL@@AA_K1@Z (RVA: 0x2F90, VA: 0x10002F90)
    0x10002F90:  push     ebp
    0x10002F91:  mov      ebp, esp
    0x10002F93:  push     -1
    0x10002F95:  push     0x100089f1
    0x10002F9A:  mov      eax, dword ptr fs:[0]
    0x10002FA0:  push     eax
    0x10002FA1:  sub      esp, 0x30
    0x10002FA4:  push     ebx
    0x10002FA5:  push     esi
    0x10002FA6:  push     edi
    0x10002FA7:  mov      eax, dword ptr [0x1000b0b8]
    0x10002FAC:  xor      eax, ebp
    0x10002FAE:  push     eax
    0x10002FAF:  lea      eax, [ebp - 0xc]
    0x10002FB2:  mov      dword ptr fs:[0], eax
    0x10002FB8:  mov      edi, ecx
    0x10002FBA:  xor      esi, esi
    0x10002FBC:  lea      ecx, [ebp - 0x3c]
    0x10002FBF:  mov      dword ptr [ebp - 0x14], esi
    0x10002FC2:  call     0x10007ec0
    0x10002FC7:  mov      ecx, dword ptr [ebp + 8]
    0x10002FCA:  push     esi
    0x10002FCB:  push     0x4000
    0x10002FD0:  mov      dword ptr [ebp - 4], esi
    0x10002FD3:  mov      dword ptr [ebp - 0x24], esi
    0x10002FD6:  mov      dword ptr [ebp - 0x20], esi
    0x10002FD9:  mov      dword ptr [ebp - 0x1c], esi
    0x10002FDC:  mov      dword ptr [ebp - 0x18], esi
    0x10002FDF:  call     dword ptr [0x10009134]
    0x10002FE5:  push     eax
    0x10002FE6:  lea      ecx, [ebp - 0x3c]
    0x10002FE9:  call     0x10007ede
    0x10002FEE:  test     eax, eax
    0x10002FF0:  je       0x100031bb
    0x10002FF6:  lea      ecx, [ebp + 8]
    0x10002FF9:  call     dword ptr [0x10009128]
    0x10002FFF:  lea      eax, [ebp + 8]
    0x10003002:  push     eax
    0x10003003:  lea      ecx, [ebp - 0x3c]
    0x10003006:  mov      byte ptr [ebp - 4], 1
    0x1000300A:  mov      dword ptr [ebp - 0x10], 1
    0x10003011:  call     0x10007ed2
    0x10003016:  test     eax, eax
    0x10003018:  jne      0x1000302a
    0x1000301A:  lea      ecx, [ebp + 8]
    0x1000301D:  call     dword ptr [0x10009148]
    0x10003023:  jmp      0x100031c2
    0x10003028:  xor      esi, esi
    0x1000302A:  cmp      dword ptr [ebp - 0x10], esi
    0x1000302D:  je       0x1000301a
    0x1000302F:  lea      ecx, [ebp + 8]
    0x10003032:  call     dword ptr [0x10009158]
    0x10003038:  test     eax, eax
    0x1000303A:  jle      0x1000316e
    0x10003040:  push     esi
    0x10003041:  lea      ecx, [ebp + 8]
    0x10003044:  call     dword ptr [0x1000915c]
    0x1000304A:  cmp      al, 0x3a
    0x1000304C:  jne      0x1000316e
    0x10003052:  lea      ecx, [ebp + 8]
    0x10003055:  mov      esi, 1
    0x1000305A:  call     dword ptr [0x10009158]
    0x10003060:  cmp      eax, esi
    0x10003062:  jle      0x10003091
    0x10003064:  push     esi
    0x10003065:  lea      ecx, [ebp + 8]
    0x10003068:  call     dword ptr [0x1000915c]
    0x1000306E:  movsx    ecx, al
    0x10003071:  push     ecx
    0x10003072:  call     dword ptr [0x100090a4]
    0x10003078:  add      esp, 4
    0x1000307B:  lea      ecx, [ebp + 8]
    0x1000307E:  test     eax, eax
    0x10003080:  je       0x1000318d
    0x10003086:  inc      esi
    0x10003087:  call     dword ptr [0x10009158]
    0x1000308D:  cmp      esi, eax
    0x1000308F:  jl       0x10003064
    0x10003091:  push     1
    0x10003093:  lea      edx, [ebp + 8]
    0x10003096:  push     edx
    0x10003097:  mov      ecx, edi
    0x10003099:  call     0x10001b20
    0x1000309E:  mov      bl, al
    0x100030A0:  push     3
    0x100030A2:  lea      eax, [ebp + 8]
    0x100030A5:  push     eax
    0x100030A6:  mov      ecx, edi
    0x100030A8:  call     0x10001bd0
    0x100030AD:  push     7
    0x100030AF:  lea      ecx, [ebp + 8]
    0x100030B2:  push     ecx
    0x100030B3:  mov      ecx, edi
    0x100030B5:  movzx    esi, ax
    0x100030B8:  call     0x10001b20
    0x100030BD:  cmp      al, 1
    0x100030BF:  jne      0x100030cd
    0x100030C1:  mov      dword ptr [ebp - 0x10], 0
    0x100030C8:  jmp      0x1000316e
    0x100030CD:  cmp      al, 2
    0x100030CF:  jne      0x100030f1
    0x100030D1:  push     9
    0x100030D3:  lea      edx, [ebp + 8]
    0x100030D6:  push     edx
    0x100030D7:  mov      ecx, edi
    0x100030D9:  call     0x10001bd0
    0x100030DE:  movzx    eax, ax
    0x100030E1:  cdq      
    0x100030E2:  shld     edx, eax, 4
    0x100030E6:  shl      eax, 4
    0x100030E9:  mov      dword ptr [ebp - 0x20], edx
    0x100030EC:  mov      dword ptr [ebp - 0x24], eax
    0x100030EF:  jmp      0x1000316e
    0x100030F1:  cmp      al, 4
    0x100030F3:  jne      0x10003115
    0x100030F5:  push     9
    0x100030F7:  lea      eax, [ebp + 8]
    0x100030FA:  push     eax
    0x100030FB:  mov      ecx, edi
    0x100030FD:  call     0x10001bd0
    0x10003102:  movzx    eax, ax
    0x10003105:  cdq      
    0x10003106:  shld     edx, eax, 0x10
    0x1000310A:  shl      eax, 0x10
    0x1000310D:  mov      dword ptr [ebp - 0x18], edx
    0x10003110:  mov      dword ptr [ebp - 0x1c], eax
    0x10003113:  jmp      0x1000316e
    0x10003115:  cmp      al, 3
    0x10003117:  je       0x1000316e
    0x10003119:  cmp      al, 5
    0x1000311B:  je       0x1000316e
    0x1000311D:  test     al, al
    0x1000311F:  jne      0x1000316e
    0x10003121:  mov      eax, esi
    0x10003123:  cdq      
    0x10003124:  mov      ecx, eax
    0x10003126:  add      ecx, dword ptr [ebp - 0x1c]
    0x10003129:  mov      esi, edx
    0x1000312B:  adc      esi, dword ptr [ebp - 0x18]
    0x1000312E:  add      ecx, dword ptr [ebp - 0x24]
    0x10003131:  movzx    eax, bl
    0x10003134:  adc      esi, dword ptr [ebp - 0x20]
    0x10003137:  cdq      
    0x10003138:  add      eax, ecx
    0x1000313A:  mov      ebx, edx
    0x1000313C:  adc      ebx, esi
    0x1000313E:  mov      edx, eax
    0x10003140:  add      edx, -1
    0x10003143:  mov      eax, ebx
    0x10003145:  mov      ebx, dword ptr [ebp + 0xc]
    0x10003148:  adc      eax, -1
    0x1000314B:  cmp      eax, dword ptr [ebx + 4]
    0x1000314E:  jb       0x1000315b
    0x10003150:  ja       0x10003156
    0x10003152:  cmp      edx, dword ptr [ebx]
    0x10003154:  jbe      0x1000315b
    0x10003156:  mov      dword ptr [ebx], edx
    0x10003158:  mov      dword ptr [ebx + 4], eax
    0x1000315B:  mov      eax, dword ptr [ebp + 0x10]
    0x1000315E:  cmp      esi, dword ptr [eax + 4]
    0x10003161:  ja       0x1000316e
    0x10003163:  jb       0x10003169
    0x10003165:  cmp      ecx, dword ptr [eax]
    0x10003167:  jae      0x1000316e
    0x10003169:  mov      dword ptr [eax], ecx
    0x1000316B:  mov      dword ptr [eax + 4], esi
    0x1000316E:  lea      ecx, [ebp + 8]
    0x10003171:  push     ecx
    0x10003172:  lea      ecx, [ebp - 0x3c]
    0x10003175:  call     0x10007ed2
    0x1000317A:  test     eax, eax
    0x1000317C:  jne      0x10003028
    0x10003182:  lea      ecx, [ebp + 8]
    0x10003185:  call     dword ptr [0x10009148]
    0x1000318B:  jmp      0x100031c2

// Function: ?IsRomWinRange@CSimU8core@@QAE_NI@Z (RVA: 0x28A0, VA: 0x100028A0)
    0x100028A0:  push     ebp
    0x100028A1:  mov      ebp, esp
    0x100028A3:  mov      eax, dword ptr [ecx + 0xd8]
    0x100028A9:  mov      edx, dword ptr [ebp + 8]
    0x100028AC:  cmp      edx, eax
    0x100028AE:  jb       0x100028c8
    0x100028B0:  mov      ecx, dword ptr [ecx + 0xdc]
    0x100028B6:  cmp      edx, ecx
    0x100028B8:  ja       0x100028c8
    0x100028BA:  test     eax, eax
    0x100028BC:  jne      0x100028c2
    0x100028BE:  test     ecx, ecx
    0x100028C0:  je       0x100028c8
    0x100028C2:  mov      al, 1
    0x100028C4:  pop      ebp
    0x100028C5:  ret      4

// Function: ?ReadDMemory@CSimU8core@@QAEHIPAE@Z (RVA: 0x31F0, VA: 0x100031F0)
    0x100031F0:  push     ebp
    0x100031F1:  mov      ebp, esp
    0x100031F3:  push     esi
    0x100031F4:  push     edi
    0x100031F5:  mov      edi, dword ptr [ebp + 8]
    0x100031F8:  push     edi
    0x100031F9:  mov      esi, ecx
    0x100031FB:  call     0x100028a0
    0x10003200:  test     al, al
    0x10003202:  je       0x10003217
    0x10003204:  mov      eax, dword ptr [ebp + 0xc]
    0x10003207:  push     eax
    0x10003208:  lea      ecx, [esi + 0x2c]
    0x1000320B:  push     edi
    0x1000320C:  call     0x10007a60
    0x10003211:  pop      edi
    0x10003212:  pop      esi
    0x10003213:  pop      ebp
    0x10003214:  ret      8

// Function: ?ReadWordDMemory@CSimU8core@@QAEHIPAG@Z (RVA: 0x3230, VA: 0x10003230)
    0x10003230:  push     ebp
    0x10003231:  mov      ebp, esp
    0x10003233:  push     ecx
    0x10003234:  push     esi
    0x10003235:  mov      esi, dword ptr [ebp + 8]
    0x10003238:  push     edi
    0x10003239:  push     esi
    0x1000323A:  mov      edi, ecx
    0x1000323C:  call     0x100028a0
    0x10003241:  test     al, al
    0x10003243:  je       0x1000325e
    0x10003245:  lea      eax, [ebp - 1]
    0x10003248:  push     eax
    0x10003249:  push     esi
    0x1000324A:  lea      ecx, [edi + 0x2c]
    0x1000324D:  call     0x10007a60
    0x10003252:  test     eax, eax
    0x10003254:  je       0x1000326f
    0x10003256:  pop      edi
    0x10003257:  pop      esi
    0x10003258:  mov      esp, ebp
    0x1000325A:  pop      ebp
    0x1000325B:  ret      8

// Function: ?StrToByte@CSimU8core@@QAEEAAV?$CStringT@DV?$StrTraitMFC_DLL@DV?$ChTraitsCRT@D@ATL@@@@@ATL@@H@Z (RVA: 0x1B20, VA: 0x10001B20)
    0x10001B20:  push     ebp
    0x10001B21:  mov      ebp, esp
    0x10001B23:  push     ecx
    0x10001B24:  mov      ecx, dword ptr [ebp + 8]
    0x10001B27:  push     ebx
    0x10001B28:  xor      bl, bl
    0x10001B2A:  call     dword ptr [0x10009158]
    0x10001B30:  test     eax, eax
    0x10001B32:  jle      0x10001bb1
    0x10001B34:  mov      ecx, dword ptr [ebp + 8]
    0x10001B37:  push     esi
    0x10001B38:  mov      esi, dword ptr [ebp + 0xc]
    0x10001B3B:  push     edi
    0x10001B3C:  lea      edi, [esi + 2]
    0x10001B3F:  mov      dword ptr [ebp - 4], edi
    0x10001B42:  call     dword ptr [0x10009158]
    0x10001B48:  cmp      edi, eax
    0x10001B4A:  jg       0x10001bba
    0x10001B4C:  cmp      esi, edi
    0x10001B4E:  jge      0x10001bba
    0x10001B50:  mov      edi, dword ptr [0x10009094]
    0x10001B56:  jmp      0x10001b63
    0x10001B58:  jmp      0x10001b60
    0x10001B5A:  lea      ebx, [ebx]
    0x10001B60:  mov      bl, byte ptr [ebp + 0xf]
    0x10001B63:  mov      ecx, dword ptr [ebp + 8]
    0x10001B66:  shl      bl, 4
    0x10001B69:  push     esi
    0x10001B6A:  mov      byte ptr [ebp + 0xf], bl
    0x10001B6D:  call     dword ptr [0x1000915c]
    0x10001B73:  movsx    eax, al
    0x10001B76:  push     eax
    0x10001B77:  call     edi
    0x10001B79:  mov      bl, al
    0x10001B7B:  movsx    ecx, bl
    0x10001B7E:  push     ecx
    0x10001B7F:  call     dword ptr [0x10009090]
    0x10001B85:  add      esp, 8
    0x10001B88:  test     eax, eax
    0x10001B8A:  je       0x10001b91
    0x10001B8C:  sub      bl, 0x30
    0x10001B8F:  jmp      0x10001b9c
    0x10001B91:  lea      edx, [ebx - 0x41]
    0x10001B94:  cmp      dl, 5
    0x10001B97:  ja       0x10001b9f
    0x10001B99:  sub      bl, 0x37
    0x10001B9C:  add      byte ptr [ebp + 0xf], bl
    0x10001B9F:  inc      esi
    0x10001BA0:  cmp      esi, dword ptr [ebp - 4]
    0x10001BA3:  jl       0x10001b60
    0x10001BA5:  mov      al, byte ptr [ebp + 0xf]
    0x10001BA8:  pop      edi
    0x10001BA9:  pop      esi
    0x10001BAA:  pop      ebx
    0x10001BAB:  mov      esp, ebp
    0x10001BAD:  pop      ebp
    0x10001BAE:  ret      8

// Function: ?StrToWord@CSimU8core@@QAEGAAV?$CStringT@DV?$StrTraitMFC_DLL@DV?$ChTraitsCRT@D@ATL@@@@@ATL@@H@Z (RVA: 0x1BD0, VA: 0x10001BD0)
    0x10001BD0:  push     ebp
    0x10001BD1:  mov      ebp, esp
    0x10001BD3:  push     ecx
    0x10001BD4:  push     ebx
    0x10001BD5:  mov      ebx, dword ptr [ebp + 8]
    0x10001BD8:  mov      ecx, ebx
    0x10001BDA:  mov      dword ptr [ebp - 4], 0
    0x10001BE1:  call     dword ptr [0x10009158]
    0x10001BE7:  test     eax, eax
    0x10001BE9:  jle      0x10001c6d
    0x10001BEF:  push     esi
    0x10001BF0:  mov      esi, dword ptr [ebp + 0xc]
    0x10001BF3:  push     edi
    0x10001BF4:  lea      edi, [esi + 4]
    0x10001BF7:  mov      ecx, ebx
    0x10001BF9:  mov      dword ptr [ebp + 0xc], edi
    0x10001BFC:  call     dword ptr [0x10009158]
    0x10001C02:  cmp      edi, eax
    0x10001C04:  jg       0x10001c6b
    0x10001C06:  cmp      esi, edi
    0x10001C08:  jge      0x10001c6b
    0x10001C0A:  mov      edi, dword ptr [0x10009094]
    0x10001C10:  jmp      0x10001c15
    0x10001C12:  mov      ebx, dword ptr [ebp + 8]
    0x10001C15:  mov      eax, dword ptr [ebp - 4]
    0x10001C18:  shl      eax, 4
    0x10001C1B:  movzx    ecx, ax
    0x10001C1E:  mov      dword ptr [ebp - 4], ecx
    0x10001C21:  push     esi
    0x10001C22:  mov      ecx, ebx
    0x10001C24:  call     dword ptr [0x1000915c]
    0x10001C2A:  movsx    edx, al
    0x10001C2D:  push     edx
    0x10001C2E:  call     edi
    0x10001C30:  mov      bl, al
    0x10001C32:  movsx    eax, bl
    0x10001C35:  push     eax
    0x10001C36:  call     dword ptr [0x10009090]
    0x10001C3C:  add      esp, 8
    0x10001C3F:  test     eax, eax
    0x10001C41:  je       0x10001c51
    0x10001C43:  movsx    cx, bl
    0x10001C47:  sub      cx, 0x30
    0x10001C4B:  add      word ptr [ebp - 4], cx
    0x10001C4F:  jmp      0x10001c65
    0x10001C51:  lea      edx, [ebx - 0x41]
    0x10001C54:  cmp      dl, 5
    0x10001C57:  ja       0x10001c65
    0x10001C59:  movsx    ax, bl
    0x10001C5D:  sub      ax, 0x37
    0x10001C61:  add      word ptr [ebp - 4], ax
    0x10001C65:  inc      esi
    0x10001C66:  cmp      esi, dword ptr [ebp + 0xc]
    0x10001C69:  jl       0x10001c12
    0x10001C6B:  pop      edi
    0x10001C6C:  pop      esi
    0x10001C6D:  mov      ax, word ptr [ebp - 4]
    0x10001C71:  pop      ebx
    0x10001C72:  mov      esp, ebp
    0x10001C74:  pop      ebp
    0x10001C75:  ret      8

// Function: ?WriteDMemory@CSimU8core@@QAEHIE@Z (RVA: 0x32D0, VA: 0x100032D0)
    0x100032D0:  push     ebp
    0x100032D1:  mov      ebp, esp
    0x100032D3:  push     esi
    0x100032D4:  push     edi
    0x100032D5:  mov      edi, dword ptr [ebp + 8]
    0x100032D8:  push     edi
    0x100032D9:  mov      esi, ecx
    0x100032DB:  call     0x100028a0
    0x100032E0:  test     al, al
    0x100032E2:  jne      0x100032f5
    0x100032E4:  mov      eax, dword ptr [ebp + 0xc]
    0x100032E7:  push     eax
    0x100032E8:  push     edi
    0x100032E9:  lea      ecx, [esi + 0x48]
    0x100032EC:  call     0x10007a20
    0x100032F1:  test     eax, eax
    0x100032F3:  jne      0x100032f7
    0x100032F5:  xor      eax, eax
    0x100032F7:  pop      edi
    0x100032F8:  pop      esi
    0x100032F9:  pop      ebp
    0x100032FA:  ret      8

// Function: ?WriteWordDMemory@CSimU8core@@QAEHIG@Z (RVA: 0x3300, VA: 0x10003300)
    0x10003300:  push     ebp
    0x10003301:  mov      ebp, esp
    0x10003303:  push     ebx
    0x10003304:  push     esi
    0x10003305:  push     edi
    0x10003306:  mov      edi, dword ptr [ebp + 8]
    0x10003309:  push     edi
    0x1000330A:  mov      esi, ecx
    0x1000330C:  call     0x100028a0
    0x10003311:  mov      ebx, dword ptr [ebp + 0xc]
    0x10003314:  test     al, al
    0x10003316:  jne      0x10003326
    0x10003318:  push     ebx
    0x10003319:  push     edi
    0x1000331A:  lea      ecx, [esi + 0x48]
    0x1000331D:  call     0x10007a20
    0x10003322:  test     eax, eax
    0x10003324:  jne      0x10003346
    0x10003326:  inc      edi
    0x10003327:  push     edi
    0x10003328:  mov      ecx, esi
    0x1000332A:  call     0x100028a0
    0x1000332F:  test     al, al
    0x10003331:  jne      0x10003344
    0x10003333:  shr      ebx, 8
    0x10003336:  push     ebx
    0x10003337:  push     edi
    0x10003338:  lea      ecx, [esi + 0x48]
    0x1000333B:  call     0x10007a20
    0x10003340:  test     eax, eax
    0x10003342:  jne      0x10003346
    0x10003344:  xor      eax, eax
    0x10003346:  pop      edi
    0x10003347:  pop      esi
    0x10003348:  pop      ebx
    0x10003349:  pop      ebp
    0x1000334A:  ret      8

// Function: ?instCalc@CSimU8core@@QAEXEEE@Z (RVA: 0x1D00, VA: 0x10001D00)
    0x10001D00:  push     ebp
    0x10001D01:  mov      ebp, esp
    0x10001D03:  sub      esp, 0xc
    0x10001D06:  push     ebx
    0x10001D07:  push     esi
    0x10001D08:  push     edi
    0x10001D09:  mov      edi, dword ptr [ebp + 0xc]
    0x10001D0C:  lea      esi, [ecx + 0x80]
    0x10001D12:  push     edi
    0x10001D13:  mov      ecx, esi
    0x10001D15:  call     0x10001810
    0x10001D1A:  mov      bl, al
    0x10001D1C:  movzx    eax, byte ptr [ebp + 8]
    0x10001D20:  cmp      eax, 9
    0x10001D23:  ja       0x100021f4
    0x10001D29:  jmp      dword ptr [eax*4 + 0x10002200]
    0x10001D30:  mov      bl, byte ptr [ebp + 0x10]
    0x10001D33:  movzx    eax, bl
    0x10001D36:  push     eax
    0x10001D37:  push     edi
    0x10001D38:  mov      ecx, esi
    0x10001D3A:  call     0x10001710
    0x10001D3F:  test     bl, bl
    0x10001D41:  sete     cl
    0x10001D44:  movzx    edx, cl
    0x10001D47:  push     edx
    0x10001D48:  push     0x21
    0x10001D4A:  mov      ecx, esi
    0x10001D4C:  call     0x100018c0
    0x10001D51:  and      bl, 0x80
    0x10001D54:  cmp      bl, 0x80
    0x10001D57:  sete     al
    0x10001D5A:  movzx    ecx, al
    0x10001D5D:  push     ecx
    0x10001D5E:  push     0x22
    0x10001D60:  mov      ecx, esi
    0x10001D62:  call     0x100018c0
    0x10001D67:  pop      edi
    0x10001D68:  pop      esi
    0x10001D69:  pop      ebx
    0x10001D6A:  mov      esp, ebp
    0x10001D6C:  pop      ebp
    0x10001D6D:  ret      0xc

// Function: ?instCalcErm@CSimU8core@@QAEXEEE@Z (RVA: 0x2400, VA: 0x10002400)
    0x10002400:  push     ebp
    0x10002401:  mov      ebp, esp
    0x10002403:  sub      esp, 0x10
    0x10002406:  mov      eax, dword ptr [ebp + 0xc]
    0x10002409:  push     ebx
    0x1000240A:  push     esi
    0x1000240B:  push     edi
    0x1000240C:  lea      esi, [ecx + 0x80]
    0x10002412:  push     eax
    0x10002413:  mov      ecx, esi
    0x10002415:  call     0x10001810
    0x1000241A:  mov      bl, al
    0x1000241C:  movzx    eax, byte ptr [ebp + 0xc]
    0x10002420:  inc      al
    0x10002422:  mov      ecx, esi
    0x10002424:  mov      byte ptr [ebp - 8], al
    0x10002427:  push     eax
    0x10002428:  call     0x10001810
    0x1000242D:  movzx    ecx, al
    0x10002430:  mov      edx, 0x100
    0x10002435:  imul     cx, dx
    0x10002439:  movzx    eax, bl
    0x1000243C:  mov      ebx, dword ptr [ebp + 0x10]
    0x1000243F:  add      cx, ax
    0x10002442:  movzx    edi, cx
    0x10002445:  push     ebx
    0x10002446:  mov      ecx, esi
    0x10002448:  call     0x10001810
    0x1000244D:  inc      bl
    0x1000244F:  movzx    ecx, bl
    0x10002452:  push     ecx
    0x10002453:  mov      ecx, esi
    0x10002455:  mov      byte ptr [ebp + 0x13], al
    0x10002458:  call     0x10001810
    0x1000245D:  mov      cl, byte ptr [ebp + 0x13]
    0x10002460:  movzx    edx, al
    0x10002463:  mov      byte ptr [ebp - 1], al
    0x10002466:  mov      eax, 0x100
    0x1000246B:  imul     dx, ax
    0x1000246F:  movzx    eax, cl
    0x10002472:  add      dx, ax
    0x10002475:  movzx    eax, byte ptr [ebp + 8]
    0x10002479:  sub      eax, 5
    0x1000247C:  movzx    ebx, dx
    0x1000247F:  mov      dword ptr [ebp + 0x10], ebx
    0x10002482:  je       0x1000264d
    0x10002488:  dec      eax
    0x10002489:  je       0x10002562
    0x1000248F:  dec      eax
    0x10002490:  jne      0x1000269b
    0x10002496:  movzx    ecx, bx
    0x10002499:  mov      eax, edi
    0x1000249B:  sub      eax, ecx
    0x1000249D:  sets     dl
    0x100024A0:  mov      dword ptr [ebp + 8], eax
    0x100024A3:  movzx    eax, dl
    0x100024A6:  push     eax
    0x100024A7:  push     0x20
    0x100024A9:  mov      ecx, esi
    0x100024AB:  call     0x100018c0
    0x100024B0:  test     dword ptr [ebp + 8], 0xffff
    0x100024B7:  sete     cl
    0x100024BA:  movzx    edx, cl
    0x100024BD:  push     edx
    0x100024BE:  push     0x21
    0x100024C0:  mov      ecx, esi
    0x100024C2:  call     0x100018c0
    0x100024C7:  mov      eax, dword ptr [ebp + 8]
    0x100024CA:  and      eax, 0x8000
    0x100024CF:  cmp      eax, 0x8000
    0x100024D4:  mov      dword ptr [ebp + 8], eax
    0x100024D7:  sete     al
    0x100024DA:  movzx    ecx, al
    0x100024DD:  push     ecx
    0x100024DE:  push     0x22
    0x100024E0:  mov      ecx, esi
    0x100024E2:  call     0x100018c0
    0x100024E7:  mov      edx, 0x8000
    0x100024EC:  cmp      di, dx
    0x100024EF:  jae      0x10002500
    0x100024F1:  mov      eax, 0x7fff
    0x100024F6:  cmp      bx, ax
    0x100024F9:  jbe      0x10002500
    0x100024FB:  cmp      dword ptr [ebp + 8], edx
    0x100024FE:  je       0x10002515
    0x10002500:  mov      ecx, 0x7fff
    0x10002505:  cmp      di, cx
    0x10002508:  jbe      0x1000251b
    0x1000250A:  cmp      bx, dx
    0x1000250D:  jae      0x1000251b
    0x1000250F:  cmp      dword ptr [ebp + 8], 0
    0x10002513:  jne      0x1000251b
    0x10002515:  mov      byte ptr [ebp + 8], 1
    0x10002519:  jmp      0x1000251f
    0x1000251B:  mov      byte ptr [ebp + 8], 0
    0x1000251F:  mov      eax, dword ptr [ebp + 8]
    0x10002522:  push     eax
    0x10002523:  push     0x23
    0x10002525:  mov      ecx, esi
    0x10002527:  call     0x100018c0
    0x1000252C:  and      ebx, 0xfff
    0x10002532:  and      edi, 0xfff
    0x10002538:  mov      ecx, esi
    0x1000253A:  cmp      edi, ebx
    0x1000253C:  jae      0x10002550
    0x1000253E:  push     1
    0x10002540:  push     0x25
    0x10002542:  call     0x100018c0
    0x10002547:  pop      edi
    0x10002548:  pop      esi
    0x10002549:  pop      ebx
    0x1000254A:  mov      esp, ebp
    0x1000254C:  pop      ebp
    0x1000254D:  ret      0xc

// Function: ?instCalcImm7@CSimU8core@@QAEXEEE@Z (RVA: 0x2230, VA: 0x10002230)
    0x10002230:  push     ebp
    0x10002231:  mov      ebp, esp
    0x10002233:  sub      esp, 0xc
    0x10002236:  push     ebx
    0x10002237:  mov      ebx, dword ptr [ebp + 0xc]
    0x1000223A:  push     esi
    0x1000223B:  lea      esi, [ecx + 0x80]
    0x10002241:  push     ebx
    0x10002242:  mov      ecx, esi
    0x10002244:  call     0x10001810
    0x10002249:  inc      bl
    0x1000224B:  mov      ecx, esi
    0x1000224D:  mov      byte ptr [ebp - 1], al
    0x10002250:  mov      byte ptr [ebp - 8], bl
    0x10002253:  push     ebx
    0x10002254:  call     0x10001810
    0x10002259:  movzx    ecx, byte ptr [ebp - 1]
    0x1000225D:  shl      eax, 8
    0x10002260:  add      ax, cx
    0x10002263:  cmp      byte ptr [ebp + 8], 0
    0x10002267:  movzx    ecx, ax
    0x1000226A:  mov      al, byte ptr [ebp + 0x10]
    0x1000226D:  mov      dword ptr [ebp - 0xc], ecx
    0x10002270:  jne      0x100022e3
    0x10002272:  movzx    edx, al
    0x10002275:  test     al, 0x40
    0x10002277:  mov      eax, dword ptr [ebp + 0xc]
    0x1000227A:  mov      ecx, esi
    0x1000227C:  jne      0x1000229f
    0x1000227E:  push     edx
    0x1000227F:  push     eax
    0x10002280:  call     0x10001710
    0x10002285:  push     0
    0x10002287:  push     ebx
    0x10002288:  mov      ecx, esi
    0x1000228A:  call     0x10001710
    0x1000228F:  cmp      byte ptr [ebp + 0x10], 0
    0x10002293:  mov      byte ptr [ebp + 8], 0
    0x10002297:  sete     cl
    0x1000229A:  mov      byte ptr [ebp + 0x10], cl
    0x1000229D:  jmp      0x100022c1
    0x1000229F:  or       edx, 0x80
    0x100022A5:  push     edx
    0x100022A6:  push     eax
    0x100022A7:  call     0x10001710
    0x100022AC:  push     0xff
    0x100022B1:  push     ebx
    0x100022B2:  mov      ecx, esi
    0x100022B4:  call     0x10001710
    0x100022B9:  mov      byte ptr [ebp + 0x10], 0
    0x100022BD:  mov      byte ptr [ebp + 8], 1
    0x100022C1:  mov      ecx, dword ptr [ebp + 0x10]
    0x100022C4:  push     ecx
    0x100022C5:  push     0x21
    0x100022C7:  mov      ecx, esi
    0x100022C9:  call     0x100018c0
    0x100022CE:  mov      edx, dword ptr [ebp + 8]
    0x100022D1:  push     edx
    0x100022D2:  push     0x22
    0x100022D4:  mov      ecx, esi
    0x100022D6:  call     0x100018c0
    0x100022DB:  pop      esi
    0x100022DC:  pop      ebx
    0x100022DD:  mov      esp, ebp
    0x100022DF:  pop      ebp
    0x100022E0:  ret      0xc

// Function: ?instShift@CSimU8core@@QAEXEEE@Z (RVA: 0x26B0, VA: 0x100026B0)
    0x100026B0:  push     ebp
    0x100026B1:  mov      ebp, esp
    0x100026B3:  push     ebx
    0x100026B4:  mov      bl, byte ptr [ebp + 0x10]
    0x100026B7:  test     bl, bl
    0x100026B9:  je       0x10002884
    0x100026BF:  mov      eax, dword ptr [ebp + 0xc]
    0x100026C2:  push     esi
    0x100026C3:  push     edi
    0x100026C4:  lea      esi, [ecx + 0x80]
    0x100026CA:  push     eax
    0x100026CB:  mov      ecx, esi
    0x100026CD:  call     0x10001810
    0x100026D2:  movzx    edi, ax
    0x100026D5:  movzx    eax, byte ptr [ebp + 8]
    0x100026D9:  add      eax, -0xa
    0x100026DC:  and      bl, 7
    0x100026DF:  mov      dword ptr [ebp + 0x10], edi
    0x100026E2:  cmp      eax, 4
    0x100026E5:  ja       0x10002882
    0x100026EB:  jmp      dword ptr [eax*4 + 0x1000288c]
    0x100026F2:  mov      edx, dword ptr [ebp + 0xc]
    0x100026F5:  movzx    ecx, bl
    0x100026F8:  shl      word ptr [ebp + 0x10], cl
    0x100026FC:  movzx    ecx, byte ptr [ebp + 0x10]
    0x10002700:  push     ecx
    0x10002701:  push     edx
    0x10002702:  mov      ecx, esi
    0x10002704:  call     0x10001710
    0x10002709:  mov      eax, dword ptr [ebp + 0x10]
    0x1000270C:  and      eax, 0x100
    0x10002711:  cmp      eax, 0x100
    0x10002716:  sete     cl
    0x10002719:  movzx    edx, cl
    0x1000271C:  push     edx
    0x1000271D:  push     0x20
    0x1000271F:  mov      ecx, esi
    0x10002721:  call     0x100018c0
    0x10002726:  pop      edi
    0x10002727:  pop      esi
    0x10002728:  pop      ebx
    0x10002729:  pop      ebp
    0x1000272A:  ret      0xc

// Function: ?m_CheckInterrupt@CSimU8core@@QAEHXZ (RVA: 0x3E80, VA: 0x10003E80)
    0x10003E80:  push     ebp
    0x10003E81:  mov      ebp, esp
    0x10003E83:  push     ecx
    0x10003E84:  push     ebx
    0x10003E85:  xor      bl, bl
    0x10003E87:  push     esi
    0x10003E88:  mov      byte ptr [ebp - 1], 0xff
    0x10003E8C:  cmp      byte ptr [ecx + 0xf8], bl
    0x10003E92:  jbe      0x10003ec4
    0x10003E94:  movzx    eax, bl
    0x10003E97:  lea      eax, [eax + eax*4]
    0x10003E9A:  lea      edx, [ecx + eax*8]
    0x10003E9D:  mov      eax, dword ptr [edx + 0x108]
    0x10003EA3:  test     eax, eax
    0x10003EA5:  js       0x10003f21
    0x10003EA7:  cmp      eax, dword ptr [ecx + 0x50]
    0x10003EAA:  jge      0x10003f21
    0x10003EAC:  mov      esi, dword ptr [ecx + 0x4c]
    0x10003EAF:  mov      al, byte ptr [eax + esi]
    0x10003EB2:  test     byte ptr [edx + 0x10d], al
    0x10003EB8:  jne      0x10003f1c
    0x10003EBA:  inc      bl
    0x10003EBC:  cmp      bl, byte ptr [ecx + 0xf8]
    0x10003EC2:  jb       0x10003e94
    0x10003EC4:  mov      al, byte ptr [ebp - 1]
    0x10003EC7:  cmp      al, byte ptr [ecx + 0xf8]
    0x10003ECD:  jae      0x10003f14
    0x10003ECF:  movzx    eax, al
    0x10003ED2:  lea      edx, [eax + eax*4]
    0x10003ED5:  mov      eax, dword ptr [ecx + edx*8 + 0x100]
    0x10003EDC:  lea      edx, [ecx + edx*8]
    0x10003EDF:  test     eax, eax
    0x10003EE1:  js       0x10003f21
    0x10003EE3:  cmp      eax, dword ptr [ecx + 0x50]
    0x10003EE6:  jge      0x10003f21
    0x10003EE8:  test     eax, eax
    0x10003EEA:  je       0x10003efa
    0x10003EEC:  mov      esi, dword ptr [ecx + 0x4c]
    0x10003EEF:  mov      al, byte ptr [eax + esi]
    0x10003EF2:  test     byte ptr [edx + 0x105], al
    0x10003EF8:  je       0x10003f14
    0x10003EFA:  mov      byte ptr [ecx + 0xb9], 0
    0x10003F01:  cmp      dword ptr [ecx + 0x50], 0xf009
    0x10003F08:  jle      0x10003f21
    0x10003F0A:  mov      ecx, dword ptr [ecx + 0x4c]
    0x10003F0D:  and      byte ptr [ecx + 0xf009], 0xfc
    0x10003F14:  pop      esi
    0x10003F15:  xor      eax, eax
    0x10003F17:  pop      ebx
    0x10003F18:  mov      esp, ebp
    0x10003F1A:  pop      ebp
    0x10003F1B:  ret      

// Function: ?m_Execute@CSimU8core@@QAEHXZ (RVA: 0x5330, VA: 0x10005330)
    0x10005330:  push     ebp
    0x10005331:  mov      ebp, esp
    0x10005333:  push     -1
    0x10005335:  push     0x10008b13
    0x1000533A:  mov      eax, dword ptr fs:[0]
    0x10005340:  push     eax
    0x10005341:  sub      esp, 0xb4
    0x10005347:  mov      eax, dword ptr [0x1000b0b8]
    0x1000534C:  xor      eax, ebp
    0x1000534E:  mov      dword ptr [ebp - 0x14], eax
    0x10005351:  push     ebx
    0x10005352:  push     esi
    0x10005353:  push     edi
    0x10005354:  push     eax
    0x10005355:  lea      eax, [ebp - 0xc]
    0x10005358:  mov      dword ptr fs:[0], eax
    0x1000535E:  mov      dword ptr [ebp - 0x10], esp
    0x10005361:  mov      edi, ecx
    0x10005363:  lea      ecx, [ebp - 0x70]
    0x10005366:  mov      dword ptr [ebp - 0x98], edi
    0x1000536C:  call     dword ptr [0x10009128]
    0x10005372:  lea      ecx, [ebp - 0x7c]
    0x10005375:  mov      dword ptr [ebp - 4], 0
    0x1000537C:  call     dword ptr [0x10009128]
    0x10005382:  push     0x10
    0x10005384:  lea      ecx, [edi + 0x80]
    0x1000538A:  mov      byte ptr [ebp - 4], 1
    0x1000538E:  call     0x10001810
    0x10005393:  cmp      byte ptr [edi + 0xb00], 0
    0x1000539A:  mov      dword ptr [ebp - 0x8c], eax
    0x100053A0:  je       0x100053bc
    0x100053A2:  push     0x15
    0x100053A4:  lea      ecx, [edi + 0x80]
    0x100053AA:  call     0x10001810
    0x100053AF:  mov      ebx, eax
    0x100053B1:  shl      ebx, 0x10
    0x100053B4:  add      ebx, dword ptr [ebp - 0x8c]
    0x100053BA:  jmp      0x100053c4
    0x100053BC:  mov      ebx, dword ptr [ebp - 0x8c]
    0x100053C2:  xor      eax, eax
    0x100053C4:  mov      dword ptr [ebp - 0x64], ebx
    0x100053C7:  test     eax, eax
    0x100053C9:  jne      0x10005426
    0x100053CB:  lea      eax, [ebp - 0x9c]
    0x100053D1:  push     eax
    0x100053D2:  lea      ecx, [edi + 0x2c]
    0x100053D5:  push     ebx
    0x100053D6:  call     0x10007aa0
    0x100053DB:  mov      dword ptr [ebp - 0x68], eax
    0x100053DE:  test     eax, eax
    0x100053E0:  jne      0x10005e70
    0x100053E6:  add      ebx, 2
    0x100053E9:  cmp      ebx, 0xffff
    0x100053EF:  jle      0x100053f7
    0x100053F1:  sub      ebx, 0x10000
    0x100053F7:  lea      ecx, [ebp - 0x94]
    0x100053FD:  push     ecx
    0x100053FE:  lea      ecx, [edi + 0x2c]
    0x10005401:  push     ebx
    0x10005402:  call     0x10007aa0
    0x10005407:  mov      ebx, eax
    0x10005409:  test     ebx, ebx
    0x1000540B:  je       0x10005487
    0x1000540D:  lea      ecx, [ebp - 0x7c]
    0x10005410:  call     dword ptr [0x10009148]
    0x10005416:  lea      ecx, [ebp - 0x70]
    0x10005419:  call     dword ptr [0x10009148]
    0x1000541F:  mov      eax, ebx
    0x10005421:  jmp      0x10005e85
    0x10005426:  lea      edx, [ebp - 0x9c]
    0x1000542C:  push     edx
    0x1000542D:  lea      eax, [ebx - 0x10000]
    0x10005433:  lea      ecx, [edi + 0x64]
    0x10005436:  push     eax
    0x10005437:  call     0x10007aa0
    0x1000543C:  mov      dword ptr [ebp - 0x68], eax
    0x1000543F:  test     eax, eax
    0x10005441:  jne      0x10005e70
    0x10005447:  mov      ecx, ebx
    0x10005449:  and      ecx, 0xffff
    0x1000544F:  cmp      ecx, 0xfffd
    0x10005455:  jle      0x1000546f
    0x10005457:  sub      ebx, 0xfffe
    0x1000545D:  lea      edx, [ebp - 0x94]
    0x10005463:  push     edx
    0x10005464:  add      ebx, 0xffff0000
    0x1000546A:  lea      ecx, [edi + 0x64]
    0x1000546D:  jmp      0x10005401
    0x1000546F:  add      ebx, 2
    0x10005472:  lea      edx, [ebp - 0x94]
    0x10005478:  push     edx
    0x10005479:  add      ebx, 0xffff0000
    0x1000547F:  lea      ecx, [edi + 0x64]
    0x10005482:  jmp      0x10005401
    0x10005487:  mov      eax, dword ptr [ebp - 0x94]
    0x1000548D:  mov      ecx, dword ptr [ebp - 0x9c]
    0x10005493:  push     eax
    0x10005494:  lea      ebx, [edi + 4]
    0x10005497:  push     ecx
    0x10005498:  mov      ecx, ebx
    0x1000549A:  call     0x10001660
    0x1000549F:  mov      edx, dword ptr [edi + 0xc]
    0x100054A2:  mov      byte ptr [edi + 0xb9], 0
    0x100054A9:  mov      ecx, ebx
    0x100054AB:  mov      dword ptr [edi + 0xb4], 0
    0x100054B5:  mov      dword ptr [ebp - 0x5c], edx
    0x100054B8:  call     0x10001020
    0x100054BD:  mov      ecx, dword ptr [ebp - 0x8c]
    0x100054C3:  inc      dword ptr [edi + 0xc0]
    0x100054C9:  lea      eax, [ecx + eax*2]
    0x100054CC:  and      eax, 0xffff
    0x100054D1:  and      ecx, 0xf0000
    0x100054D7:  add      eax, ecx
    0x100054D9:  mov      dword ptr [ebp - 0x8c], eax
    0x100054DF:  mov      eax, dword ptr [edi + 0xc4]
    0x100054E5:  cmp      eax, 2
    0x100054E8:  jne      0x1000566c
    0x100054EE:  mov      ecx, dword ptr [0x10009064]
    0x100054F4:  mov      edx, dword ptr [ecx]
    0x100054F6:  mov      eax, dword ptr [edx + 4]
    0x100054F9:  or       dword ptr [eax + ecx + 0x14], 4
    0x100054FE:  xor      ebx, ebx
    0x10005500:  push     ebx
    0x10005501:  lea      ecx, [edi + 0x80]
    0x10005507:  call     0x10001810
    0x1000550C:  mov      dword ptr [ebp + ebx*4 - 0x54], eax
    0x10005510:  inc      ebx
    0x10005511:  cmp      ebx, 0x10
    0x10005514:  jl       0x10005500
    0x10005516:  push     0x1a
    0x10005518:  lea      ecx, [edi + 0x80]
    0x1000551E:  call     0x10001810
    0x10005523:  push     0x1f
    0x10005525:  lea      ecx, [edi + 0x80]
    0x1000552B:  mov      ebx, eax

// Function: ?m_GetCount@CSimU8core@@QAEHPAI@Z (RVA: 0x1B00, VA: 0x10001B00)
    0x10001B00:  push     ebp
    0x10001B01:  mov      ebp, esp
    0x10001B03:  mov      eax, dword ptr [ecx + 0xc0]
    0x10001B09:  mov      ecx, dword ptr [ebp + 8]
    0x10001B0C:  mov      dword ptr [ecx], eax
    0x10001B0E:  xor      eax, eax
    0x10001B10:  pop      ebp
    0x10001B11:  ret      4

// Function: ?m_GetDSR@CSimU8core@@QAEEXZ (RVA: 0x19D0, VA: 0x100019D0)
    0x100019D0:  mov      al, byte ptr [ecx + 0xac]
    0x100019D6:  ret      

// Function: ?m_GetDsrPrefix@CSimU8core@@QAEEXZ (RVA: 0x19F0, VA: 0x100019F0)
    0x100019F0:  mov      al, byte ptr [ecx + 0xad]
    0x100019F6:  ret      

// Function: ?m_LoadHexFile@CSimU8core@@QAEHPBD@Z (RVA: 0x47C0, VA: 0x100047C0)
    0x100047C0:  push     ebp
    0x100047C1:  mov      ebp, esp
    0x100047C3:  push     -1
    0x100047C5:  push     0x10008a89
    0x100047CA:  mov      eax, dword ptr fs:[0]
    0x100047D0:  push     eax
    0x100047D1:  push     esi
    0x100047D2:  mov      eax, dword ptr [0x1000b0b8]
    0x100047D7:  xor      eax, ebp
    0x100047D9:  push     eax
    0x100047DA:  lea      eax, [ebp - 0xc]
    0x100047DD:  mov      dword ptr fs:[0], eax
    0x100047E3:  mov      esi, ecx
    0x100047E5:  mov      eax, dword ptr [ebp + 8]
    0x100047E8:  push     eax
    0x100047E9:  lea      ecx, [ebp + 8]
    0x100047EC:  call     dword ptr [0x10009114]
    0x100047F2:  cmp      dword ptr [esi + 0xbc], 0
    0x100047F9:  mov      dword ptr [ebp - 4], 0
    0x10004800:  jne      0x10004809
    0x10004802:  mov      ecx, esi
    0x10004804:  call     0x10003f30
    0x10004809:  lea      ecx, [ebp + 8]
    0x1000480C:  push     ecx
    0x1000480D:  mov      ecx, esi
    0x1000480F:  call     0x10003e10
    0x10004814:  lea      ecx, [ebp + 8]
    0x10004817:  mov      esi, eax
    0x10004819:  call     dword ptr [0x10009148]
    0x1000481F:  mov      eax, esi
    0x10004821:  mov      ecx, dword ptr [ebp - 0xc]
    0x10004824:  mov      dword ptr fs:[0], ecx
    0x1000482B:  pop      ecx
    0x1000482C:  pop      esi
    0x1000482D:  mov      esp, ebp
    0x1000482F:  pop      ebp
    0x10004830:  ret      4

// Function: ?m_LogStart2@CSimU8core@@QAEHPBD@Z (RVA: 0x2A80, VA: 0x10002A80)
    0x10002A80:  push     ebp
    0x10002A81:  mov      ebp, esp
    0x10002A83:  push     -1
    0x10002A85:  push     0x10008991
    0x10002A8A:  mov      eax, dword ptr fs:[0]
    0x10002A90:  push     eax
    0x10002A91:  sub      esp, 0x18
    0x10002A94:  push     ebx
    0x10002A95:  push     esi
    0x10002A96:  push     edi
    0x10002A97:  mov      eax, dword ptr [0x1000b0b8]
    0x10002A9C:  xor      eax, ebp
    0x10002A9E:  push     eax
    0x10002A9F:  lea      eax, [ebp - 0xc]
    0x10002AA2:  mov      dword ptr fs:[0], eax
    0x10002AA8:  mov      dword ptr [ebp - 0x10], esp
    0x10002AAB:  mov      edi, ecx
    0x10002AAD:  mov      dword ptr [ebp - 0x18], edi
    0x10002AB0:  lea      ecx, [ebp - 0x14]
    0x10002AB3:  call     dword ptr [0x10009128]
    0x10002AB9:  mov      eax, dword ptr [edi + 0xe0]
    0x10002ABF:  mov      ebx, dword ptr [ebp + 8]
    0x10002AC2:  mov      edx, dword ptr [eax + 0x2c]
    0x10002AC5:  push     0
    0x10002AC7:  push     0x5001
    0x10002ACC:  push     ebx
    0x10002ACD:  lea      ecx, [edi + 0xe0]
    0x10002AD3:  mov      dword ptr [ebp - 4], 0
    0x10002ADA:  call     edx
    0x10002ADC:  test     eax, eax
    0x10002ADE:  jne      0x10002b0e
    0x10002AE0:  push     ebx
    0x10002AE1:  lea      eax, [ebp - 0x14]
    0x10002AE4:  push     0x100092b4
    0x10002AE9:  push     eax
    0x10002AEA:  call     dword ptr [0x10009130]
    0x10002AF0:  add      esp, 0xc
    0x10002AF3:  push     0
    0x10002AF5:  push     0
    0x10002AF7:  lea      ecx, [ebp - 0x14]
    0x10002AFA:  call     dword ptr [0x10009134]
    0x10002B00:  push     eax
    0x10002B01:  call     0x10007ecc
    0x10002B06:  push     1
    0x10002B08:  call     dword ptr [0x100090a0]
    0x10002B0E:  push     0x10009248
    0x10002B13:  lea      ecx, [ebp - 0x14]
    0x10002B16:  call     dword ptr [0x1000913c]
    0x10002B1C:  push     0x100091d0
    0x10002B21:  lea      ecx, [ebp - 0x14]
    0x10002B24:  call     dword ptr [0x10009140]
    0x10002B2A:  lea      ecx, [ebp - 0x24]
    0x10002B2D:  call     0x10007ec6
    0x10002B32:  mov      ebx, dword ptr [edi + 0xe0]
    0x10002B38:  lea      ecx, [ebp - 0x14]
    0x10002B3B:  mov      byte ptr [ebp - 4], 2
    0x10002B3F:  call     dword ptr [0x10009134]
    0x10002B45:  mov      edx, dword ptr [ebx + 0x60]
    0x10002B48:  push     eax
    0x10002B49:  lea      ecx, [edi + 0xe0]
    0x10002B4F:  call     edx
    0x10002B51:  mov      dword ptr [ebp - 4], 0
    0x10002B58:  call     0x10007eae
    0x10002B5D:  lea      ecx, [ebp - 0x14]
    0x10002B60:  mov      dword ptr [edi + 0xc4], 2
    0x10002B6A:  call     dword ptr [0x10009148]
    0x10002B70:  xor      eax, eax
    0x10002B72:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002B75:  mov      dword ptr fs:[0], ecx
    0x10002B7C:  pop      ecx
    0x10002B7D:  pop      edi
    0x10002B7E:  pop      esi
    0x10002B7F:  pop      ebx
    0x10002B80:  mov      esp, ebp
    0x10002B82:  pop      ebp
    0x10002B83:  ret      4

// Function: ?m_LogStart@CSimU8core@@QAEHXZ (RVA: 0x1AB0, VA: 0x10001AB0)
    0x10001AB0:  mov      dword ptr [ecx + 0xc4], 1
    0x10001ABA:  xor      eax, eax
    0x10001ABC:  ret      

// Function: ?m_LogState@CSimU8core@@QAEHXZ (RVA: 0x19B0, VA: 0x100019B0)
    0x100019B0:  mov      eax, dword ptr [ecx + 0xc4]
    0x100019B6:  ret      

// Function: ?m_LogStop@CSimU8core@@QAEHXZ (RVA: 0x1AC0, VA: 0x10001AC0)
    0x10001AC0:  push     esi
    0x10001AC1:  mov      esi, ecx
    0x10001AC3:  mov      eax, dword ptr [esi + 0xc4]
    0x10001AC9:  cmp      eax, 2
    0x10001ACC:  jne      0x10001adf
    0x10001ACE:  mov      edx, dword ptr [esi + 0xe0]
    0x10001AD4:  mov      eax, dword ptr [edx + 0x58]
    0x10001AD7:  lea      ecx, [esi + 0xe0]
    0x10001ADD:  call     eax
    0x10001ADF:  xor      eax, eax
    0x10001AE1:  mov      dword ptr [esi + 0xc4], eax
    0x10001AE7:  pop      esi
    0x10001AE8:  ret      

// Function: ?m_ReadCodeMemory@CSimU8core@@QAEHIIPAE@Z (RVA: 0x5260, VA: 0x10005260)
    0x10005260:  push     ebp
    0x10005261:  mov      ebp, esp
    0x10005263:  push     ecx
    0x10005264:  cmp      dword ptr [ecx + 0xbc], 0
    0x1000526B:  mov      dword ptr [ebp - 4], ecx
    0x1000526E:  jne      0x10005275
    0x10005270:  call     0x10003f30
    0x10005275:  mov      eax, dword ptr [ebp + 0xc]
    0x10005278:  push     ebx
    0x10005279:  mov      ebx, dword ptr [ebp + 8]
    0x1000527C:  push     esi
    0x1000527D:  lea      eax, [ebx + eax - 1]
    0x10005281:  push     edi
    0x10005282:  mov      dword ptr [ebp + 0xc], eax
    0x10005285:  cmp      ebx, 0x10000
    0x1000528B:  jae      0x100052c5
    0x1000528D:  mov      dword ptr [ebp + 8], 0xffff
    0x10005294:  cmp      eax, 0x10000
    0x10005299:  jae      0x1000529e
    0x1000529B:  mov      dword ptr [ebp + 8], eax
    0x1000529E:  mov      esi, ebx
    0x100052A0:  cmp      ebx, dword ptr [ebp + 8]
    0x100052A3:  ja       0x100052c5
    0x100052A5:  mov      edi, dword ptr [ebp + 0x10]
    0x100052A8:  mov      ecx, dword ptr [ebp - 4]
    0x100052AB:  push     edi
    0x100052AC:  push     esi
    0x100052AD:  add      ecx, 0x2c
    0x100052B0:  call     0x10007a60
    0x100052B5:  test     eax, eax
    0x100052B7:  jne      0x1000530a
    0x100052B9:  inc      esi
    0x100052BA:  inc      edi
    0x100052BB:  cmp      esi, dword ptr [ebp + 8]
    0x100052BE:  jbe      0x100052a8
    0x100052C0:  mov      eax, dword ptr [ebp + 0xc]
    0x100052C3:  jmp      0x100052c8
    0x100052C5:  mov      edi, dword ptr [ebp + 0x10]
    0x100052C8:  cmp      eax, 0x10000
    0x100052CD:  jb       0x10005308
    0x100052CF:  cmp      ebx, 0x10000
    0x100052D5:  jae      0x100052db
    0x100052D7:  xor      ebx, ebx
    0x100052D9:  jmp      0x100052e1
    0x100052DB:  sub      ebx, 0x10000
    0x100052E1:  sub      eax, 0x10000
    0x100052E6:  mov      dword ptr [ebp + 0xc], eax
    0x100052E9:  mov      esi, ebx
    0x100052EB:  cmp      ebx, eax
    0x100052ED:  ja       0x10005308
    0x100052EF:  mov      ebx, dword ptr [ebp - 4]
    0x100052F2:  push     edi
    0x100052F3:  push     esi
    0x100052F4:  lea      ecx, [ebx + 0x64]
    0x100052F7:  call     0x10007a60
    0x100052FC:  cmp      eax, -1
    0x100052FF:  je       0x10005313
    0x10005301:  inc      esi
    0x10005302:  inc      edi
    0x10005303:  cmp      esi, dword ptr [ebp + 0xc]
    0x10005306:  jbe      0x100052f2
    0x10005308:  xor      eax, eax
    0x1000530A:  pop      edi
    0x1000530B:  pop      esi
    0x1000530C:  pop      ebx
    0x1000530D:  mov      esp, ebp
    0x1000530F:  pop      ebp
    0x10005310:  ret      0xc

// Function: ?m_ReadDataMemory@CSimU8core@@QAEHIIPAE@Z (RVA: 0x4C00, VA: 0x10004C00)
    0x10004C00:  push     ebp
    0x10004C01:  mov      ebp, esp
    0x10004C03:  sub      esp, 8
    0x10004C06:  push     ebx
    0x10004C07:  push     esi
    0x10004C08:  mov      esi, ecx
    0x10004C0A:  cmp      dword ptr [esi + 0xbc], 0
    0x10004C11:  push     edi
    0x10004C12:  mov      dword ptr [ebp - 8], esi
    0x10004C15:  jne      0x10004c1c
    0x10004C17:  call     0x10003f30
    0x10004C1C:  mov      eax, dword ptr [ebp + 8]
    0x10004C1F:  mov      ecx, dword ptr [ebp + 0xc]
    0x10004C22:  lea      ecx, [eax + ecx - 1]
    0x10004C26:  mov      dword ptr [ebp - 4], ecx
    0x10004C29:  cmp      eax, 0x10000
    0x10004C2E:  jae      0x10004c8e
    0x10004C30:  mov      dword ptr [ebp + 0xc], 0xffff
    0x10004C37:  cmp      ecx, 0x10000
    0x10004C3D:  jae      0x10004c42
    0x10004C3F:  mov      dword ptr [ebp + 0xc], ecx
    0x10004C42:  mov      edi, eax
    0x10004C44:  cmp      eax, dword ptr [ebp + 0xc]
    0x10004C47:  ja       0x10004c8e
    0x10004C49:  mov      ebx, dword ptr [ebp + 0x10]
    0x10004C4C:  lea      esp, [esp]
    0x10004C50:  cmp      edi, dword ptr [esi + 0xd0]
    0x10004C56:  jb       0x10004c80
    0x10004C58:  cmp      edi, dword ptr [esi + 0xd4]
    0x10004C5E:  ja       0x10004c80
    0x10004C60:  push     ebx
    0x10004C61:  push     edi
    0x10004C62:  mov      ecx, esi
    0x10004C64:  call     0x100031f0
    0x10004C69:  test     eax, eax
    0x10004C6B:  jne      0x10004d24
    0x10004C71:  inc      edi
    0x10004C72:  inc      ebx
    0x10004C73:  cmp      edi, dword ptr [ebp + 0xc]
    0x10004C76:  jbe      0x10004c50
    0x10004C78:  mov      ecx, dword ptr [ebp - 4]
    0x10004C7B:  mov      eax, dword ptr [ebp + 8]
    0x10004C7E:  jmp      0x10004c91
    0x10004C80:  pop      edi
    0x10004C81:  pop      esi
    0x10004C82:  mov      eax, 2
    0x10004C87:  pop      ebx
    0x10004C88:  mov      esp, ebp
    0x10004C8A:  pop      ebp
    0x10004C8B:  ret      0xc

// Function: ?m_ReadReg@CSimU8core@@QAEHEPAI@Z (RVA: 0x51D0, VA: 0x100051D0)
    0x100051D0:  push     ebp
    0x100051D1:  mov      ebp, esp
    0x100051D3:  mov      eax, dword ptr [ebp + 8]
    0x100051D6:  push     ebx
    0x100051D7:  push     esi
    0x100051D8:  push     edi
    0x100051D9:  mov      esi, ecx
    0x100051DB:  push     eax
    0x100051DC:  lea      ecx, [esi + 0x80]
    0x100051E2:  xor      ebx, ebx
    0x100051E4:  call     0x10001810
    0x100051E9:  mov      edi, eax
    0x100051EB:  cmp      dword ptr [esi + 0xbc], ebx
    0x100051F1:  jne      0x100051fa
    0x100051F3:  mov      ecx, esi
    0x100051F5:  call     0x10003f30
    0x100051FA:  cmp      edi, -1
    0x100051FD:  jne      0x10005209
    0x100051FF:  lea      eax, [edi + 5]
    0x10005202:  pop      edi
    0x10005203:  pop      esi
    0x10005204:  pop      ebx
    0x10005205:  pop      ebp
    0x10005206:  ret      8

// Function: ?m_SetCodeMemoryDefaultCode@CSimU8core@@QAEHG@Z (RVA: 0x3CF0, VA: 0x10003CF0)
    0x10003CF0:  push     ebp
    0x10003CF1:  mov      ebp, esp
    0x10003CF3:  sub      esp, 0x14
    0x10003CF6:  movzx    eax, word ptr [ebp + 8]
    0x10003CFA:  push     ebx
    0x10003CFB:  push     esi
    0x10003CFC:  push     edi
    0x10003CFD:  mov      edi, ecx
    0x10003CFF:  lea      ecx, [ebp - 4]
    0x10003D02:  push     ecx
    0x10003D03:  lea      edx, [ebp - 0xc]
    0x10003D06:  lea      esi, [edi + 0x2c]
    0x10003D09:  push     edx
    0x10003D0A:  mov      ecx, esi
    0x10003D0C:  mov      dword ptr [edi + 0xb0], eax
    0x10003D12:  call     0x10007960
    0x10003D17:  lea      eax, [ebp - 8]
    0x10003D1A:  push     eax
    0x10003D1B:  lea      ecx, [ebp - 0x10]
    0x10003D1E:  lea      ebx, [edi + 0x64]
    0x10003D21:  push     ecx
    0x10003D22:  mov      ecx, ebx
    0x10003D24:  call     0x10007960
    0x10003D29:  mov      eax, dword ptr [ebp - 0xc]
    0x10003D2C:  cmp      eax, dword ptr [ebp - 4]
    0x10003D2F:  jbe      0x10003d7a
    0x10003D31:  xor      eax, eax
    0x10003D33:  push     0xffff
    0x10003D38:  push     eax
    0x10003D39:  mov      ecx, esi
    0x10003D3B:  mov      dword ptr [ebp - 0xc], eax
    0x10003D3E:  mov      dword ptr [ebp - 4], 0xffff
    0x10003D45:  mov      dword ptr [ebp - 0x10], eax
    0x10003D48:  mov      dword ptr [ebp - 8], 0xeffff
    0x10003D4F:  call     0x10007de0
    0x10003D54:  mov      edx, dword ptr [ebp - 8]
    0x10003D57:  mov      eax, dword ptr [ebp - 0x10]
    0x10003D5A:  push     edx
    0x10003D5B:  push     eax
    0x10003D5C:  mov      ecx, ebx
    0x10003D5E:  call     0x10007de0
    0x10003D63:  mov      eax, dword ptr [ebp - 0xc]
    0x10003D66:  mov      dword ptr [edi + 0xc8], 0
    0x10003D70:  mov      dword ptr [edi + 0xcc], 0xfffff
    0x10003D7A:  mov      edx, dword ptr [ebp + 8]
    0x10003D7D:  shr      edx, 8
    0x10003D80:  cmp      eax, dword ptr [ebp - 4]
    0x10003D83:  jae      0x10003db7
    0x10003D85:  test     eax, eax
    0x10003D87:  js       0x10003dfd
    0x10003D89:  cmp      eax, dword ptr [esi + 8]
    0x10003D8C:  jge      0x10003dfd
    0x10003D8E:  mov      ecx, dword ptr [esi + 4]
    0x10003D91:  mov      dword ptr [ebp - 0x14], edx
    0x10003D94:  mov      dl, byte ptr [ebp + 8]
    0x10003D97:  mov      byte ptr [eax + ecx], dl
    0x10003D9A:  mov      edx, dword ptr [ebp - 0x14]
    0x10003D9D:  lea      ecx, [eax + 1]
    0x10003DA0:  test     ecx, ecx
    0x10003DA2:  js       0x10003dfd
    0x10003DA4:  cmp      ecx, dword ptr [esi + 8]
    0x10003DA7:  jge      0x10003dfd
    0x10003DA9:  mov      edi, dword ptr [esi + 4]
    0x10003DAC:  add      eax, 2
    0x10003DAF:  mov      byte ptr [ecx + edi], dl
    0x10003DB2:  cmp      eax, dword ptr [ebp - 4]
    0x10003DB5:  jb       0x10003d85
    0x10003DB7:  mov      eax, dword ptr [ebp - 0x10]
    0x10003DBA:  cmp      eax, dword ptr [ebp - 8]
    0x10003DBD:  jae      0x10003df2
    0x10003DBF:  nop      
    0x10003DC0:  test     eax, eax
    0x10003DC2:  js       0x10003dfd
    0x10003DC4:  cmp      eax, dword ptr [ebx + 8]
    0x10003DC7:  jge      0x10003dfd
    0x10003DC9:  mov      ecx, dword ptr [ebx + 4]
    0x10003DCC:  mov      dword ptr [ebp - 0x14], edx
    0x10003DCF:  mov      dl, byte ptr [ebp + 8]
    0x10003DD2:  mov      byte ptr [eax + ecx], dl
    0x10003DD5:  mov      edx, dword ptr [ebp - 0x14]
    0x10003DD8:  lea      ecx, [eax + 1]
    0x10003DDB:  test     ecx, ecx
    0x10003DDD:  js       0x10003dfd
    0x10003DDF:  cmp      ecx, dword ptr [ebx + 8]
    0x10003DE2:  jge      0x10003dfd
    0x10003DE4:  mov      esi, dword ptr [ebx + 4]
    0x10003DE7:  add      eax, 2
    0x10003DEA:  mov      byte ptr [ecx + esi], dl
    0x10003DED:  cmp      eax, dword ptr [ebp - 8]
    0x10003DF0:  jb       0x10003dc0
    0x10003DF2:  pop      edi
    0x10003DF3:  pop      esi
    0x10003DF4:  xor      eax, eax
    0x10003DF6:  pop      ebx
    0x10003DF7:  mov      esp, ebp
    0x10003DF9:  pop      ebp
    0x10003DFA:  ret      4

// Function: ?m_SetCodeMemorySize@CSimU8core@@QAEHII@Z (RVA: 0x3620, VA: 0x10003620)
    0x10003620:  push     ebp
    0x10003621:  mov      ebp, esp
    0x10003623:  sub      esp, 0xc
    0x10003626:  mov      eax, dword ptr [ebp + 8]
    0x10003629:  push     ebx
    0x1000362A:  push     esi
    0x1000362B:  mov      esi, ecx
    0x1000362D:  push     edi
    0x1000362E:  mov      dword ptr [ebp - 4], 0
    0x10003635:  mov      ecx, 5
    0x1000363A:  cmp      eax, 0xfffff
    0x1000363F:  jbe      0x10003644
    0x10003641:  mov      dword ptr [ebp - 4], ecx
    0x10003644:  mov      ebx, dword ptr [ebp + 0xc]
    0x10003647:  cmp      ebx, 0xfffff
    0x1000364D:  jbe      0x10003652
    0x1000364F:  mov      dword ptr [ebp - 4], ecx
    0x10003652:  cmp      eax, ebx
    0x10003654:  jbe      0x1000365f
    0x10003656:  mov      dword ptr [ebp - 4], 2
    0x1000365D:  jmp      0x10003665
    0x1000365F:  cmp      dword ptr [ebp - 4], 0
    0x10003663:  je       0x100036a6
    0x10003665:  push     0
    0x10003667:  lea      ebx, [esi + 0x2c]
    0x1000366A:  push     0
    0x1000366C:  mov      ecx, ebx
    0x1000366E:  call     0x10007de0
    0x10003673:  push     0
    0x10003675:  lea      edi, [esi + 0x64]
    0x10003678:  push     0
    0x1000367A:  mov      ecx, edi
    0x1000367C:  call     0x10007de0
    0x10003681:  push     0
    0x10003683:  push     0
    0x10003685:  lea      ecx, [esi + 0x48]
    0x10003688:  call     0x10007de0
    0x1000368D:  xor      eax, eax
    0x1000368F:  mov      dword ptr [esi + 0xc8], eax
    0x10003695:  mov      dword ptr [esi + 0xd0], eax
    0x1000369B:  mov      dword ptr [esi + 0xd4], eax
    0x100036A1:  jmp      0x1000378a
    0x100036A6:  test     al, 1
    0x100036A8:  je       0x100036ae
    0x100036AA:  dec      eax
    0x100036AB:  mov      dword ptr [ebp + 8], eax
    0x100036AE:  test     bl, 1
    0x100036B1:  jne      0x100036b7
    0x100036B3:  inc      ebx
    0x100036B4:  mov      dword ptr [ebp + 0xc], ebx
    0x100036B7:  cmp      ebx, 0xffff
    0x100036BD:  jae      0x100036c9
    0x100036BF:  mov      dword ptr [ebp + 0xc], 0xffff
    0x100036C6:  mov      ebx, dword ptr [ebp + 0xc]
    0x100036C9:  lea      eax, [ebp - 8]
    0x100036CC:  push     eax
    0x100036CD:  lea      ecx, [ebp - 0xc]
    0x100036D0:  lea      edi, [esi + 0x64]
    0x100036D3:  push     ecx
    0x100036D4:  mov      ecx, edi
    0x100036D6:  call     0x10007960
    0x100036DB:  mov      eax, dword ptr [ebp + 8]
    0x100036DE:  cmp      ebx, 0x10000
    0x100036E4:  lea      ebx, [esi + 0x2c]
    0x100036E7:  mov      ecx, ebx
    0x100036E9:  jae      0x1000372f
    0x100036EB:  mov      edx, dword ptr [ebp + 0xc]
    0x100036EE:  push     edx
    0x100036EF:  push     eax
    0x100036F0:  call     0x10007de0
    0x100036F5:  mov      ecx, dword ptr [ebp - 0xc]
    0x100036F8:  cmp      ecx, dword ptr [ebp - 8]
    0x100036FB:  jbe      0x10003701
    0x100036FD:  push     0
    0x100036FF:  jmp      0x10003775
    0x10003701:  mov      eax, dword ptr [esi + 0xd4]
    0x10003707:  cmp      dword ptr [esi + 0xcc], eax
    0x1000370D:  jbe      0x1000377e
    0x1000370F:  cmp      eax, 0x10000
    0x10003714:  jae      0x10003720
    0x10003716:  mov      dword ptr [esi + 0xd4], 0x10000
    0x10003720:  mov      edx, dword ptr [esi + 0xd4]
    0x10003726:  sub      edx, 0x10000
    0x1000372C:  push     edx
    0x1000372D:  jmp      0x10003775
    0x1000372F:  push     0xffff
    0x10003734:  push     eax
    0x10003735:  call     0x10007de0
    0x1000373A:  mov      eax, dword ptr [esi + 0xd4]
    0x10003740:  mov      ecx, dword ptr [ebp + 0xc]
    0x10003743:  cmp      eax, ecx
    0x10003745:  jae      0x1000374f
    0x10003747:  add      ecx, 0xffff0000
    0x1000374D:  jmp      0x10003774
    0x1000374F:  cmp      dword ptr [esi + 0xcc], eax
    0x10003755:  jbe      0x1000377e
    0x10003757:  cmp      eax, 0x10000
    0x1000375C:  jae      0x10003768
    0x1000375E:  mov      dword ptr [esi + 0xd4], 0x10000
    0x10003768:  mov      ecx, dword ptr [esi + 0xd4]
    0x1000376E:  sub      ecx, 0x10000
    0x10003774:  push     ecx
    0x10003775:  push     0
    0x10003777:  mov      ecx, edi
    0x10003779:  call     0x10007de0
    0x1000377E:  mov      edx, dword ptr [ebp + 8]
    0x10003781:  mov      eax, dword ptr [ebp + 0xc]
    0x10003784:  mov      dword ptr [esi + 0xc8], edx
    0x1000378A:  mov      ecx, dword ptr [esi + 0xc4]
    0x10003790:  mov      dword ptr [esi + 0xcc], eax
    0x10003796:  cmp      ecx, 1
    0x10003799:  jne      0x100038e7
    0x1000379F:  mov      edx, dword ptr [0x10009068]
    0x100037A5:  mov      eax, dword ptr [0x10009064]
    0x100037AA:  push     edx
    0x100037AB:  push     0x10009334
    0x100037B0:  push     eax
    0x100037B1:  call     0x100033d0
    0x100037B6:  add      esp, 8
    0x100037B9:  mov      ecx, eax
    0x100037BB:  call     dword ptr [0x10009060]
    0x100037C1:  mov      ecx, dword ptr [0x10009068]
    0x100037C7:  mov      edx, dword ptr [esi + 0xcc]
    0x100037CD:  mov      eax, dword ptr [esi + 0xc8]
    0x100037D3:  push     ecx
    0x100037D4:  mov      ecx, dword ptr [0x10009064]
    0x100037DA:  push     edx
    0x100037DB:  push     0x10009330
    0x100037E0:  push     eax
    0x100037E1:  push     0x10001990
    0x100037E6:  push     0x10009320
    0x100037EB:  push     ecx
    0x100037EC:  call     0x100033d0
    0x100037F1:  add      esp, 8
    0x100037F4:  mov      ecx, eax
    0x100037F6:  call     dword ptr [0x1000905c]
    0x100037FC:  mov      ecx, eax
    0x100037FE:  call     dword ptr [0x10009058]
    0x10003804:  push     eax
    0x10003805:  call     0x100033d0
    0x1000380A:  add      esp, 8
    0x1000380D:  mov      ecx, eax
    0x1000380F:  call     dword ptr [0x10009058]
    0x10003815:  mov      ecx, eax
    0x10003817:  call     dword ptr [0x10009060]
    0x1000381D:  lea      edx, [ebp - 8]

// Function: ?m_SetDSR@CSimU8core@@QAEXE@Z (RVA: 0x19C0, VA: 0x100019C0)
    0x100019C0:  push     ebp
    0x100019C1:  mov      ebp, esp
    0x100019C3:  mov      al, byte ptr [ebp + 8]
    0x100019C6:  mov      byte ptr [ecx + 0xac], al
    0x100019CC:  pop      ebp
    0x100019CD:  ret      4

// Function: ?m_SetDataMemorySize@CSimU8core@@QAEHII@Z (RVA: 0x3900, VA: 0x10003900)
    0x10003900:  push     ebp
    0x10003901:  mov      ebp, esp
    0x10003903:  sub      esp, 0xc
    0x10003906:  mov      eax, dword ptr [ebp + 8]
    0x10003909:  push     ebx
    0x1000390A:  push     esi
    0x1000390B:  mov      esi, ecx
    0x1000390D:  push     edi
    0x1000390E:  mov      dword ptr [ebp - 4], 0
    0x10003915:  mov      ecx, 5
    0x1000391A:  cmp      eax, 0xffffff
    0x1000391F:  jbe      0x10003924
    0x10003921:  mov      dword ptr [ebp - 4], ecx
    0x10003924:  mov      ebx, dword ptr [ebp + 0xc]
    0x10003927:  cmp      ebx, 0xffffff
    0x1000392D:  jbe      0x10003932
    0x1000392F:  mov      dword ptr [ebp - 4], ecx
    0x10003932:  cmp      eax, ebx
    0x10003934:  jbe      0x1000393f
    0x10003936:  mov      dword ptr [ebp - 4], 2
    0x1000393D:  jmp      0x10003945
    0x1000393F:  cmp      dword ptr [ebp - 4], 0
    0x10003943:  je       0x10003986
    0x10003945:  push     0
    0x10003947:  lea      ebx, [esi + 0x48]
    0x1000394A:  push     0
    0x1000394C:  mov      ecx, ebx
    0x1000394E:  call     0x10007de0
    0x10003953:  push     0
    0x10003955:  lea      edi, [esi + 0x64]
    0x10003958:  push     0
    0x1000395A:  mov      ecx, edi
    0x1000395C:  call     0x10007de0
    0x10003961:  push     0
    0x10003963:  push     0
    0x10003965:  lea      ecx, [esi + 0x2c]
    0x10003968:  call     0x10007de0
    0x1000396D:  xor      eax, eax
    0x1000396F:  mov      dword ptr [esi + 0xd0], eax
    0x10003975:  mov      dword ptr [esi + 0xc8], eax
    0x1000397B:  mov      dword ptr [esi + 0xcc], eax
    0x10003981:  jmp      0x10003a6a
    0x10003986:  test     al, 1
    0x10003988:  je       0x1000398e
    0x1000398A:  dec      eax
    0x1000398B:  mov      dword ptr [ebp + 8], eax
    0x1000398E:  test     bl, 1
    0x10003991:  jne      0x10003997
    0x10003993:  inc      ebx
    0x10003994:  mov      dword ptr [ebp + 0xc], ebx
    0x10003997:  cmp      ebx, 0xffff
    0x1000399D:  jae      0x100039a9
    0x1000399F:  mov      dword ptr [ebp + 0xc], 0xffff
    0x100039A6:  mov      ebx, dword ptr [ebp + 0xc]
    0x100039A9:  lea      eax, [ebp - 8]
    0x100039AC:  push     eax
    0x100039AD:  lea      ecx, [ebp - 0xc]
    0x100039B0:  lea      edi, [esi + 0x64]
    0x100039B3:  push     ecx
    0x100039B4:  mov      ecx, edi
    0x100039B6:  call     0x10007960
    0x100039BB:  mov      eax, dword ptr [ebp + 8]
    0x100039BE:  cmp      ebx, 0x10000
    0x100039C4:  lea      ebx, [esi + 0x48]
    0x100039C7:  mov      ecx, ebx
    0x100039C9:  jae      0x10003a0f
    0x100039CB:  mov      edx, dword ptr [ebp + 0xc]
    0x100039CE:  push     edx
    0x100039CF:  push     eax
    0x100039D0:  call     0x10007de0
    0x100039D5:  mov      ecx, dword ptr [ebp - 0xc]
    0x100039D8:  cmp      ecx, dword ptr [ebp - 8]
    0x100039DB:  jbe      0x100039e1
    0x100039DD:  push     0
    0x100039DF:  jmp      0x10003a55
    0x100039E1:  mov      eax, dword ptr [esi + 0xcc]
    0x100039E7:  cmp      eax, dword ptr [esi + 0xd4]
    0x100039ED:  jae      0x10003a5e
    0x100039EF:  cmp      eax, 0x10000
    0x100039F4:  jae      0x10003a00
    0x100039F6:  mov      dword ptr [esi + 0xcc], 0x10000
    0x10003A00:  mov      edx, dword ptr [esi + 0xcc]
    0x10003A06:  sub      edx, 0x10000
    0x10003A0C:  push     edx
    0x10003A0D:  jmp      0x10003a55
    0x10003A0F:  push     0xffff
    0x10003A14:  push     eax
    0x10003A15:  call     0x10007de0
    0x10003A1A:  mov      eax, dword ptr [esi + 0xcc]
    0x10003A20:  mov      ecx, dword ptr [ebp + 0xc]
    0x10003A23:  cmp      eax, ecx
    0x10003A25:  jae      0x10003a2f
    0x10003A27:  add      ecx, 0xffff0000
    0x10003A2D:  jmp      0x10003a54
    0x10003A2F:  cmp      eax, dword ptr [esi + 0xd4]
    0x10003A35:  jae      0x10003a5e
    0x10003A37:  cmp      eax, 0x10000
    0x10003A3C:  jae      0x10003a48
    0x10003A3E:  mov      dword ptr [esi + 0xcc], 0x10000
    0x10003A48:  mov      ecx, dword ptr [esi + 0xcc]
    0x10003A4E:  sub      ecx, 0x10000
    0x10003A54:  push     ecx
    0x10003A55:  push     0
    0x10003A57:  mov      ecx, edi
    0x10003A59:  call     0x10007de0
    0x10003A5E:  mov      edx, dword ptr [ebp + 8]
    0x10003A61:  mov      eax, dword ptr [ebp + 0xc]
    0x10003A64:  mov      dword ptr [esi + 0xd0], edx
    0x10003A6A:  mov      ecx, dword ptr [esi + 0xc4]
    0x10003A70:  mov      dword ptr [esi + 0xd4], eax
    0x10003A76:  cmp      ecx, 1
    0x10003A79:  jne      0x10003bc7
    0x10003A7F:  mov      edx, dword ptr [0x10009068]
    0x10003A85:  mov      eax, dword ptr [0x10009064]
    0x10003A8A:  push     edx
    0x10003A8B:  push     0x10009334
    0x10003A90:  push     eax
    0x10003A91:  call     0x100033d0
    0x10003A96:  add      esp, 8
    0x10003A99:  mov      ecx, eax
    0x10003A9B:  call     dword ptr [0x10009060]
    0x10003AA1:  mov      ecx, dword ptr [0x10009068]
    0x10003AA7:  mov      edx, dword ptr [esi + 0xd4]
    0x10003AAD:  mov      eax, dword ptr [esi + 0xd0]
    0x10003AB3:  push     ecx
    0x10003AB4:  mov      ecx, dword ptr [0x10009064]
    0x10003ABA:  push     edx
    0x10003ABB:  push     0x10009330
    0x10003AC0:  push     eax
    0x10003AC1:  push     0x10001990
    0x10003AC6:  push     0x10009350
    0x10003ACB:  push     ecx
    0x10003ACC:  call     0x100033d0
    0x10003AD1:  add      esp, 8
    0x10003AD4:  mov      ecx, eax
    0x10003AD6:  call     dword ptr [0x1000905c]
    0x10003ADC:  mov      ecx, eax
    0x10003ADE:  call     dword ptr [0x10009058]
    0x10003AE4:  push     eax
    0x10003AE5:  call     0x100033d0
    0x10003AEA:  add      esp, 8
    0x10003AED:  mov      ecx, eax
    0x10003AEF:  call     dword ptr [0x10009058]
    0x10003AF5:  mov      ecx, eax
    0x10003AF7:  call     dword ptr [0x10009060]
    0x10003AFD:  lea      edx, [ebp - 8]

// Function: ?m_SetDsrPrefix@CSimU8core@@QAEXE@Z (RVA: 0x19E0, VA: 0x100019E0)
    0x100019E0:  push     ebp
    0x100019E1:  mov      ebp, esp
    0x100019E3:  mov      al, byte ptr [ebp + 8]
    0x100019E6:  mov      byte ptr [ecx + 0xad], al
    0x100019EC:  pop      ebp
    0x100019ED:  ret      4

// Function: ?m_SetInterruptTable@CSimU8core@@QAEHEPAU_SIMU8_INTERRUPT_TABLE@@@Z (RVA: 0x43D0, VA: 0x100043D0)
    0x100043D0:  push     ebp
    0x100043D1:  mov      ebp, esp
    0x100043D3:  sub      esp, 0x48
    0x100043D6:  mov      al, byte ptr [ebp + 8]
    0x100043D9:  mov      dword ptr [ebp - 8], ecx
    0x100043DC:  cmp      al, 0x40
    0x100043DE:  jbe      0x100043eb
    0x100043E0:  mov      eax, 0x11
    0x100043E5:  mov      esp, ebp
    0x100043E7:  pop      ebp
    0x100043E8:  ret      8

// Function: ?m_SetMemoryModel@CSimU8core@@QAEHE@Z (RVA: 0x4360, VA: 0x10004360)
    0x10004360:  push     ebp
    0x10004361:  mov      ebp, esp
    0x10004363:  mov      al, byte ptr [ebp + 8]
    0x10004366:  test     al, al
    0x10004368:  je       0x10004377
    0x1000436A:  cmp      al, 1
    0x1000436C:  je       0x10004377
    0x1000436E:  mov      eax, 0x10
    0x10004373:  pop      ebp
    0x10004374:  ret      4

// Function: ?m_SetRomWindowSize@CSimU8core@@QAEHII@Z (RVA: 0x3BE0, VA: 0x10003BE0)
    0x10003BE0:  push     ebp
    0x10003BE1:  mov      ebp, esp
    0x10003BE3:  mov      eax, dword ptr [ebp + 8]
    0x10003BE6:  push     esi
    0x10003BE7:  push     edi
    0x10003BE8:  xor      edx, edx
    0x10003BEA:  xor      edi, edi
    0x10003BEC:  mov      esi, ecx
    0x10003BEE:  cmp      eax, 0xffff
    0x10003BF3:  jbe      0x10003bf8
    0x10003BF5:  lea      edi, [edx + 2]
    0x10003BF8:  mov      ecx, dword ptr [ebp + 0xc]
    0x10003BFB:  cmp      ecx, 0xffff
    0x10003C01:  jbe      0x10003c08
    0x10003C03:  mov      edi, 2
    0x10003C08:  cmp      eax, ecx
    0x10003C0A:  jbe      0x10003cb1
    0x10003C10:  mov      edi, 2
    0x10003C15:  mov      dword ptr [esi + 0xd8], edx
    0x10003C1B:  mov      dword ptr [esi + 0xdc], edx
    0x10003C21:  mov      eax, dword ptr [esi + 0xc4]
    0x10003C27:  cmp      eax, 1
    0x10003C2A:  jne      0x10003ca9
    0x10003C2C:  mov      ecx, dword ptr [0x10009068]
    0x10003C32:  mov      edx, dword ptr [0x10009064]
    0x10003C38:  push     ecx
    0x10003C39:  push     0x10009334
    0x10003C3E:  push     edx
    0x10003C3F:  call     0x100033d0
    0x10003C44:  add      esp, 8
    0x10003C47:  mov      ecx, eax
    0x10003C49:  call     dword ptr [0x10009060]
    0x10003C4F:  mov      eax, dword ptr [0x10009068]
    0x10003C54:  mov      ecx, dword ptr [esi + 0xdc]
    0x10003C5A:  mov      edx, dword ptr [esi + 0xd8]
    0x10003C60:  push     eax
    0x10003C61:  mov      eax, dword ptr [0x10009064]
    0x10003C66:  push     ecx
    0x10003C67:  push     0x10009330
    0x10003C6C:  push     edx
    0x10003C6D:  push     0x10001990
    0x10003C72:  push     0x10009360
    0x10003C77:  push     eax
    0x10003C78:  call     0x100033d0
    0x10003C7D:  add      esp, 8
    0x10003C80:  mov      ecx, eax
    0x10003C82:  call     dword ptr [0x1000905c]
    0x10003C88:  mov      ecx, eax
    0x10003C8A:  call     dword ptr [0x10009058]
    0x10003C90:  push     eax
    0x10003C91:  call     0x100033d0
    0x10003C96:  add      esp, 8
    0x10003C99:  mov      ecx, eax
    0x10003C9B:  call     dword ptr [0x10009058]
    0x10003CA1:  mov      ecx, eax
    0x10003CA3:  call     dword ptr [0x10009060]
    0x10003CA9:  mov      eax, edi
    0x10003CAB:  pop      edi
    0x10003CAC:  pop      esi
    0x10003CAD:  pop      ebp
    0x10003CAE:  ret      8

// Function: ?m_SimReset@CSimU8core@@QAEHXZ (RVA: 0x4840, VA: 0x10004840)
    0x10004840:  push     ebp
    0x10004841:  mov      ebp, esp
    0x10004843:  push     ecx
    0x10004844:  push     ebx
    0x10004845:  push     esi
    0x10004846:  mov      esi, ecx
    0x10004848:  cmp      dword ptr [esi + 0xbc], 0
    0x1000484F:  push     edi
    0x10004850:  jne      0x10004857
    0x10004852:  call     0x10003f30
    0x10004857:  lea      ecx, [esi + 0x80]
    0x1000485D:  call     0x100016c0
    0x10004862:  lea      eax, [ebp - 4]
    0x10004865:  push     eax
    0x10004866:  push     0
    0x10004868:  lea      ecx, [esi + 0x2c]
    0x1000486B:  call     0x10007aa0
    0x10004870:  movzx    ecx, word ptr [ebp - 4]
    0x10004874:  push     ecx
    0x10004875:  push     0x1e
    0x10004877:  lea      ecx, [esi + 0x80]
    0x1000487D:  call     0x10001710
    0x10004882:  lea      edx, [ebp - 4]
    0x10004885:  push     edx
    0x10004886:  push     2
    0x10004888:  lea      ecx, [esi + 0x2c]
    0x1000488B:  call     0x10007aa0
    0x10004890:  movzx    eax, word ptr [ebp - 4]
    0x10004894:  push     eax
    0x10004895:  push     0x10
    0x10004897:  lea      ecx, [esi + 0x80]
    0x1000489D:  call     0x10001710
    0x100048A2:  mov      byte ptr [esi + 0xad], 0
    0x100048A9:  mov      byte ptr [esi + 0xb8], 0
    0x100048B0:  pop      edi
    0x100048B1:  mov      byte ptr [esi + 0xb9], 0
    0x100048B8:  pop      esi
    0x100048B9:  xor      eax, eax
    0x100048BB:  pop      ebx
    0x100048BC:  mov      esp, ebp
    0x100048BE:  pop      ebp
    0x100048BF:  ret      

// Function: ?m_WriteBitDataMemory@CSimU8core@@QAEHIEE@Z (RVA: 0x5070, VA: 0x10005070)
    0x10005070:  push     ebp
    0x10005071:  mov      ebp, esp
    0x10005073:  push     -1
    0x10005075:  push     0x10008ac1
    0x1000507A:  mov      eax, dword ptr fs:[0]
    0x10005080:  push     eax
    0x10005081:  sub      esp, 0x18
    0x10005084:  push     ebx
    0x10005085:  push     esi
    0x10005086:  push     edi
    0x10005087:  mov      eax, dword ptr [0x1000b0b8]
    0x1000508C:  xor      eax, ebp
    0x1000508E:  push     eax
    0x1000508F:  lea      eax, [ebp - 0xc]
    0x10005092:  mov      dword ptr fs:[0], eax
    0x10005098:  mov      dword ptr [ebp - 0x10], esp
    0x1000509B:  mov      esi, ecx
    0x1000509D:  mov      dword ptr [ebp - 0x18], esi
    0x100050A0:  cmp      dword ptr [esi + 0xbc], 0
    0x100050A7:  jne      0x100050ae
    0x100050A9:  call     0x10003f30
    0x100050AE:  mov      edi, dword ptr [ebp + 8]
    0x100050B1:  lea      eax, [ebp - 0x11]
    0x100050B4:  push     eax
    0x100050B5:  push     1
    0x100050B7:  push     edi
    0x100050B8:  mov      ecx, esi
    0x100050BA:  call     0x10004c00
    0x100050BF:  test     eax, eax
    0x100050C1:  je       0x100050dc
    0x100050C3:  mov      eax, 2
    0x100050C8:  mov      ecx, dword ptr [ebp - 0xc]
    0x100050CB:  mov      dword ptr fs:[0], ecx
    0x100050D2:  pop      ecx
    0x100050D3:  pop      edi
    0x100050D4:  pop      esi
    0x100050D5:  pop      ebx
    0x100050D6:  mov      esp, ebp
    0x100050D8:  pop      ebp
    0x100050D9:  ret      0xc

// Function: ?m_WriteCodeMemory@CSimU8core@@QAEHIIPAE@Z (RVA: 0x48C0, VA: 0x100048C0)
    0x100048C0:  push     ebp
    0x100048C1:  mov      ebp, esp
    0x100048C3:  sub      esp, 0x2c
    0x100048C6:  push     ebx
    0x100048C7:  mov      ebx, ecx
    0x100048C9:  cmp      dword ptr [ebx + 0xbc], 0
    0x100048D0:  push     esi
    0x100048D1:  push     edi
    0x100048D2:  mov      dword ptr [ebp - 0xc], ebx
    0x100048D5:  jne      0x100048dc
    0x100048D7:  call     0x10003f30
    0x100048DC:  mov      eax, dword ptr [ebp + 0xc]
    0x100048DF:  mov      esi, dword ptr [ebp + 8]
    0x100048E2:  lea      ecx, [esi + eax - 1]
    0x100048E6:  mov      dword ptr [ebp + 0xc], ecx
    0x100048E9:  cmp      esi, 0x10000
    0x100048EF:  jae      0x10004a51
    0x100048F5:  cmp      ecx, 0x10000
    0x100048FB:  jb       0x10004907
    0x100048FD:  mov      edi, 0xffff
    0x10004902:  mov      dword ptr [ebp - 4], edi
    0x10004905:  jmp      0x1000490c
    0x10004907:  mov      dword ptr [ebp - 4], ecx
    0x1000490A:  mov      edi, ecx
    0x1000490C:  cmp      esi, edi
    0x1000490E:  ja       0x10004950
    0x10004910:  cmp      esi, dword ptr [ebx + 0xc8]
    0x10004916:  jb       0x100049b8
    0x1000491C:  cmp      esi, dword ptr [ebx + 0xcc]
    0x10004922:  ja       0x100049b8
    0x10004928:  mov      ecx, dword ptr [ebp + 0x10]
    0x1000492B:  mov      dl, byte ptr [ecx]
    0x1000492D:  mov      byte ptr [ebp - 8], dl
    0x10004930:  mov      eax, dword ptr [ebp - 8]
    0x10004933:  push     eax
    0x10004934:  lea      ecx, [ebx + 0x2c]
    0x10004937:  push     esi
    0x10004938:  call     0x10007a20
    0x1000493D:  cmp      eax, -1
    0x10004940:  je       0x100049b8
    0x10004942:  inc      dword ptr [ebp + 0x10]
    0x10004945:  inc      esi
    0x10004946:  cmp      esi, edi
    0x10004948:  jbe      0x10004910
    0x1000494A:  mov      esi, dword ptr [ebp + 8]
    0x1000494D:  mov      ecx, dword ptr [ebp + 0xc]
    0x10004950:  mov      edx, dword ptr [ebx + 0xc4]
    0x10004956:  cmp      edx, 1
    0x10004959:  jne      0x10004a51
    0x1000495F:  cmp      esi, 0x10
    0x10004962:  jbe      0x1000496a
    0x10004964:  sub      esi, 0x10
    0x10004967:  mov      dword ptr [ebp + 8], esi
    0x1000496A:  cmp      edi, 0xfff0
    0x10004970:  jae      0x10004978
    0x10004972:  add      edi, 0x10
    0x10004975:  mov      dword ptr [ebp - 4], edi
    0x10004978:  mov      edi, esi
    0x1000497A:  cmp      esi, dword ptr [ebp - 4]
    0x1000497D:  ja       0x10004a38
    0x10004983:  test     edi, edi
    0x10004985:  js       0x10004a71
    0x1000498B:  cmp      edi, dword ptr [ebx + 0x34]
    0x1000498E:  jge      0x10004a71
    0x10004994:  mov      esi, dword ptr [ebx + 0x30]
    0x10004997:  push     0
    0x10004999:  lea      eax, [ebp - 0x1c]
    0x1000499C:  push     2
    0x1000499E:  push     eax
    0x1000499F:  call     dword ptr [0x10009074]
    0x100049A5:  mov      ecx, dword ptr [0x10009064]
    0x100049AB:  add      esp, 0xc
    0x100049AE:  mov      ebx, ecx
    0x100049B0:  test     ecx, ecx
    0x100049B2:  jne      0x100049c6
    0x100049B4:  xor      edx, edx
    0x100049B6:  jmp      0x100049cd
    0x100049B8:  pop      edi
    0x100049B9:  pop      esi
    0x100049BA:  mov      eax, 2
    0x100049BF:  pop      ebx
    0x100049C0:  mov      esp, ebp
    0x100049C2:  pop      ebp
    0x100049C3:  ret      0xc

// Function: ?m_WriteDataMemory@CSimU8core@@QAEHIIPAE@Z (RVA: 0x4D40, VA: 0x10004D40)
    0x10004D40:  push     ebp
    0x10004D41:  mov      ebp, esp
    0x10004D43:  sub      esp, 0x2c
    0x10004D46:  push     ebx
    0x10004D47:  mov      ebx, ecx
    0x10004D49:  cmp      dword ptr [ebx + 0xbc], 0
    0x10004D50:  push     esi
    0x10004D51:  push     edi
    0x10004D52:  mov      dword ptr [ebp - 0xc], ebx
    0x10004D55:  jne      0x10004d5c
    0x10004D57:  call     0x10003f30
    0x10004D5C:  mov      esi, dword ptr [ebp + 8]
    0x10004D5F:  mov      eax, dword ptr [ebp + 0xc]
    0x10004D62:  lea      ecx, [esi + eax - 1]
    0x10004D66:  mov      dword ptr [ebp - 4], ecx
    0x10004D69:  cmp      esi, 0x10000
    0x10004D6F:  jae      0x10004ec3
    0x10004D75:  cmp      ecx, 0x10000
    0x10004D7B:  jb       0x10004d87
    0x10004D7D:  mov      edi, 0xffff
    0x10004D82:  mov      dword ptr [ebp - 8], edi
    0x10004D85:  jmp      0x10004d8c
    0x10004D87:  mov      dword ptr [ebp - 8], ecx
    0x10004D8A:  mov      edi, ecx
    0x10004D8C:  cmp      esi, edi
    0x10004D8E:  ja       0x10004dcd
    0x10004D90:  cmp      esi, dword ptr [ebx + 0xd0]
    0x10004D96:  jb       0x10004e2d
    0x10004D9C:  cmp      esi, dword ptr [ebx + 0xd4]
    0x10004DA2:  ja       0x10004e2d
    0x10004DA8:  mov      ecx, dword ptr [ebp + 0x10]
    0x10004DAB:  movzx    edx, byte ptr [ecx]
    0x10004DAE:  push     edx
    0x10004DAF:  push     esi
    0x10004DB0:  mov      ecx, ebx
    0x10004DB2:  call     0x100032d0
    0x10004DB7:  test     eax, eax
    0x10004DB9:  jne      0x10004fac
    0x10004DBF:  inc      dword ptr [ebp + 0x10]
    0x10004DC2:  inc      esi
    0x10004DC3:  cmp      esi, edi
    0x10004DC5:  jbe      0x10004d90
    0x10004DC7:  mov      ecx, dword ptr [ebp - 4]
    0x10004DCA:  mov      esi, dword ptr [ebp + 8]
    0x10004DCD:  mov      eax, dword ptr [ebx + 0xc4]
    0x10004DD3:  cmp      eax, 1
    0x10004DD6:  jne      0x10004ec3
    0x10004DDC:  cmp      esi, 0x10
    0x10004DDF:  jbe      0x10004de7
    0x10004DE1:  sub      esi, 0x10
    0x10004DE4:  mov      dword ptr [ebp + 8], esi
    0x10004DE7:  cmp      edi, 0xfff0
    0x10004DED:  jae      0x10004df5
    0x10004DEF:  add      edi, 0x10
    0x10004DF2:  mov      dword ptr [ebp - 8], edi
    0x10004DF5:  cmp      esi, edi
    0x10004DF7:  ja       0x10004eaa
    0x10004DFD:  lea      ecx, [ecx]
    0x10004E00:  lea      ecx, [ebp + 0xf]
    0x10004E03:  push     ecx
    0x10004E04:  push     esi
    0x10004E05:  mov      ecx, ebx
    0x10004E07:  call     0x100031f0
    0x10004E0C:  push     0
    0x10004E0E:  lea      edx, [ebp - 0x1c]
    0x10004E11:  push     2
    0x10004E13:  push     edx
    0x10004E14:  call     dword ptr [0x10009074]
    0x10004E1A:  mov      ecx, dword ptr [0x10009064]
    0x10004E20:  add      esp, 0xc
    0x10004E23:  mov      edi, ecx
    0x10004E25:  test     ecx, ecx
    0x10004E27:  jne      0x10004e3b
    0x10004E29:  xor      edx, edx
    0x10004E2B:  jmp      0x10004e42
    0x10004E2D:  pop      edi
    0x10004E2E:  pop      esi
    0x10004E2F:  mov      eax, 2
    0x10004E34:  pop      ebx
    0x10004E35:  mov      esp, ebp
    0x10004E37:  pop      ebp
    0x10004E38:  ret      0xc

// Function: ?m_WriteReg@CSimU8core@@QAEHEI@Z (RVA: 0x5220, VA: 0x10005220)
    0x10005220:  push     ebp
    0x10005221:  mov      ebp, esp
    0x10005223:  push     esi
    0x10005224:  mov      esi, ecx
    0x10005226:  cmp      dword ptr [esi + 0xbc], 0
    0x1000522D:  jne      0x10005234
    0x1000522F:  call     0x10003f30
    0x10005234:  mov      eax, dword ptr [ebp + 0xc]
    0x10005237:  mov      ecx, dword ptr [ebp + 8]
    0x1000523A:  push     eax
    0x1000523B:  push     ecx
    0x1000523C:  lea      ecx, [esi + 0x80]
    0x10005242:  call     0x10001710
    0x10005247:  pop      esi
    0x10005248:  cmp      eax, -1
    0x1000524B:  jne      0x10005252
    0x1000524D:  mov      eax, 4
    0x10005252:  pop      ebp
    0x10005253:  ret      8
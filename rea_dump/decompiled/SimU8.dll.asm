// DECOMPILED DISASSEMBLY OF SimU8.dll
// Base: 0x10000000


// Function: GetCount (RVA: 0x3010, VA: 0x10003010)
    0x10003010:  push     ebp
    0x10003011:  mov      ebp, esp
    0x10003013:  push     -1
    0x10003015:  push     0x10115db0
    0x1000301A:  mov      eax, dword ptr fs:[0]
    0x10003020:  push     eax
    0x10003021:  sub      esp, 0x18
    0x10003024:  push     ebx
    0x10003025:  push     esi
    0x10003026:  push     edi
    0x10003027:  mov      eax, dword ptr [0x1016b4ac]
    0x1000302C:  xor      eax, ebp
    0x1000302E:  push     eax
    0x1000302F:  lea      eax, [ebp - 0xc]
    0x10003032:  mov      dword ptr fs:[0], eax
    0x10003038:  mov      dword ptr [ebp - 0x10], esp
    0x1000303B:  call     0x100067c6
    0x10003040:  push     eax
    0x10003041:  lea      ecx, [ebp - 0x1c]
    0x10003044:  call     0x1000b0c7
    0x10003049:  xor      ebx, ebx
    0x1000304B:  lea      ecx, [ebp - 0x24]
    0x1000304E:  mov      dword ptr [ebp - 4], ebx
    0x10003051:  call     0x1000a7c3
    0x10003056:  mov      eax, dword ptr [0x1016d938]
    0x1000305B:  push     0xbb8
    0x10003060:  push     eax
    0x10003061:  mov      byte ptr [ebp - 4], 2
    0x10003065:  call     0x10001250
    0x1000306A:  add      esp, 8
    0x1000306D:  test     eax, eax
    0x1000306F:  jne      0x100030c0
    0x10003071:  mov      ecx, dword ptr [ebp + 8]
    0x10003074:  push     ecx
    0x10003075:  mov      ecx, 0x1016ce20
    0x1000307A:  call     0x100067a8
    0x1000307F:  mov      edx, dword ptr [0x1016d938]
    0x10003085:  push     ebx
    0x10003086:  push     1
    0x10003088:  push     edx
    0x10003089:  mov      esi, eax
    0x1000308B:  call     0x100012d0
    0x10003090:  add      esp, 0xc
    0x10003093:  mov      dword ptr [ebp - 4], ebx
    0x10003096:  call     0x1000a7db
    0x1000309B:  lea      ecx, [ebp - 0x1c]
    0x1000309E:  mov      dword ptr [ebp - 4], 0xffffffff
    0x100030A5:  call     0x1000a7ff
    0x100030AA:  mov      eax, esi
    0x100030AC:  mov      ecx, dword ptr [ebp - 0xc]
    0x100030AF:  mov      dword ptr fs:[0], ecx
    0x100030B6:  pop      ecx
    0x100030B7:  pop      edi
    0x100030B8:  pop      esi
    0x100030B9:  pop      ebx
    0x100030BA:  mov      esp, ebp
    0x100030BC:  pop      ebp
    0x100030BD:  ret      4

// Function: LoadHexFile (RVA: 0x20D0, VA: 0x100020D0)
    0x100020D0:  push     ebp
    0x100020D1:  mov      ebp, esp
    0x100020D3:  push     -1
    0x100020D5:  push     0x10115b40
    0x100020DA:  mov      eax, dword ptr fs:[0]
    0x100020E0:  push     eax
    0x100020E1:  sub      esp, 0x18
    0x100020E4:  push     ebx
    0x100020E5:  push     esi
    0x100020E6:  push     edi
    0x100020E7:  mov      eax, dword ptr [0x1016b4ac]
    0x100020EC:  xor      eax, ebp
    0x100020EE:  push     eax
    0x100020EF:  lea      eax, [ebp - 0xc]
    0x100020F2:  mov      dword ptr fs:[0], eax
    0x100020F8:  mov      dword ptr [ebp - 0x10], esp
    0x100020FB:  call     0x100067c6
    0x10002100:  push     eax
    0x10002101:  lea      ecx, [ebp - 0x1c]
    0x10002104:  call     0x1000b0c7
    0x10002109:  xor      ebx, ebx
    0x1000210B:  lea      ecx, [ebp - 0x24]
    0x1000210E:  mov      dword ptr [ebp - 4], ebx
    0x10002111:  call     0x1000a7c3
    0x10002116:  mov      eax, dword ptr [0x1016d938]
    0x1000211B:  push     0xbb8
    0x10002120:  push     eax
    0x10002121:  mov      byte ptr [ebp - 4], 2
    0x10002125:  call     0x10001250
    0x1000212A:  add      esp, 8
    0x1000212D:  test     eax, eax
    0x1000212F:  jne      0x1000218e
    0x10002131:  mov      cl, byte ptr [0x1016d924]
    0x10002137:  test     cl, cl
    0x10002139:  je       0x10002140
    0x1000213B:  lea      esi, [ebx + 1]
    0x1000213E:  jmp      0x10002150
    0x10002140:  mov      edx, dword ptr [ebp + 8]
    0x10002143:  push     edx
    0x10002144:  mov      ecx, 0x1016ce20
    0x10002149:  call     0x10006760
    0x1000214E:  mov      esi, eax
    0x10002150:  mov      eax, dword ptr [0x1016d938]
    0x10002155:  push     ebx
    0x10002156:  push     1
    0x10002158:  push     eax
    0x10002159:  call     0x100012d0
    0x1000215E:  add      esp, 0xc
    0x10002161:  mov      dword ptr [ebp - 4], ebx
    0x10002164:  call     0x1000a7db
    0x10002169:  lea      ecx, [ebp - 0x1c]
    0x1000216C:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002173:  call     0x1000a7ff
    0x10002178:  mov      eax, esi
    0x1000217A:  mov      ecx, dword ptr [ebp - 0xc]
    0x1000217D:  mov      dword ptr fs:[0], ecx
    0x10002184:  pop      ecx
    0x10002185:  pop      edi
    0x10002186:  pop      esi
    0x10002187:  pop      ebx
    0x10002188:  mov      esp, ebp
    0x1000218A:  pop      ebp
    0x1000218B:  ret      4

// Function: LogStart (RVA: 0x2B70, VA: 0x10002B70)
    0x10002B70:  push     ebp
    0x10002B71:  mov      ebp, esp
    0x10002B73:  push     -1
    0x10002B75:  push     0x10115cf0
    0x10002B7A:  mov      eax, dword ptr fs:[0]
    0x10002B80:  push     eax
    0x10002B81:  sub      esp, 0x18
    0x10002B84:  push     ebx
    0x10002B85:  push     esi
    0x10002B86:  push     edi
    0x10002B87:  mov      eax, dword ptr [0x1016b4ac]
    0x10002B8C:  xor      eax, ebp
    0x10002B8E:  push     eax
    0x10002B8F:  lea      eax, [ebp - 0xc]
    0x10002B92:  mov      dword ptr fs:[0], eax
    0x10002B98:  mov      dword ptr [ebp - 0x10], esp
    0x10002B9B:  call     0x100067c6
    0x10002BA0:  push     eax
    0x10002BA1:  lea      ecx, [ebp - 0x1c]
    0x10002BA4:  call     0x1000b0c7
    0x10002BA9:  xor      ebx, ebx
    0x10002BAB:  lea      ecx, [ebp - 0x24]
    0x10002BAE:  mov      dword ptr [ebp - 4], ebx
    0x10002BB1:  call     0x1000a7c3
    0x10002BB6:  mov      eax, dword ptr [0x1016d938]
    0x10002BBB:  push     0xbb8
    0x10002BC0:  push     eax
    0x10002BC1:  mov      byte ptr [ebp - 4], 2
    0x10002BC5:  call     0x10001250
    0x10002BCA:  add      esp, 8
    0x10002BCD:  test     eax, eax
    0x10002BCF:  jne      0x10002c1a
    0x10002BD1:  mov      ecx, 0x1016ce20
    0x10002BD6:  call     0x10006790
    0x10002BDB:  mov      ecx, dword ptr [0x1016d938]
    0x10002BE1:  push     ebx
    0x10002BE2:  push     1
    0x10002BE4:  push     ecx
    0x10002BE5:  mov      esi, eax
    0x10002BE7:  call     0x100012d0
    0x10002BEC:  add      esp, 0xc
    0x10002BEF:  mov      dword ptr [ebp - 4], ebx
    0x10002BF2:  call     0x1000a7db
    0x10002BF7:  lea      ecx, [ebp - 0x1c]
    0x10002BFA:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002C01:  call     0x1000a7ff
    0x10002C06:  mov      eax, esi
    0x10002C08:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002C0B:  mov      dword ptr fs:[0], ecx
    0x10002C12:  pop      ecx
    0x10002C13:  pop      edi
    0x10002C14:  pop      esi
    0x10002C15:  pop      ebx
    0x10002C16:  mov      esp, ebp
    0x10002C18:  pop      ebp
    0x10002C19:  ret      

// Function: LogStart2 (RVA: 0x2C90, VA: 0x10002C90)
    0x10002C90:  push     ebp
    0x10002C91:  mov      ebp, esp
    0x10002C93:  push     -1
    0x10002C95:  push     0x10115d20
    0x10002C9A:  mov      eax, dword ptr fs:[0]
    0x10002CA0:  push     eax
    0x10002CA1:  sub      esp, 0x18
    0x10002CA4:  push     ebx
    0x10002CA5:  push     esi
    0x10002CA6:  push     edi
    0x10002CA7:  mov      eax, dword ptr [0x1016b4ac]
    0x10002CAC:  xor      eax, ebp
    0x10002CAE:  push     eax
    0x10002CAF:  lea      eax, [ebp - 0xc]
    0x10002CB2:  mov      dword ptr fs:[0], eax
    0x10002CB8:  mov      dword ptr [ebp - 0x10], esp
    0x10002CBB:  call     0x100067c6
    0x10002CC0:  push     eax
    0x10002CC1:  lea      ecx, [ebp - 0x1c]
    0x10002CC4:  call     0x1000b0c7
    0x10002CC9:  xor      ebx, ebx
    0x10002CCB:  lea      ecx, [ebp - 0x24]
    0x10002CCE:  mov      dword ptr [ebp - 4], ebx
    0x10002CD1:  call     0x1000a7c3
    0x10002CD6:  mov      eax, dword ptr [0x1016d938]
    0x10002CDB:  push     0xbb8
    0x10002CE0:  push     eax
    0x10002CE1:  mov      byte ptr [ebp - 4], 2
    0x10002CE5:  call     0x10001250
    0x10002CEA:  add      esp, 8
    0x10002CED:  test     eax, eax
    0x10002CEF:  jne      0x10002d40
    0x10002CF1:  mov      ecx, dword ptr [ebp + 8]
    0x10002CF4:  push     ecx
    0x10002CF5:  mov      ecx, 0x1016ce20
    0x10002CFA:  call     0x10006796
    0x10002CFF:  mov      edx, dword ptr [0x1016d938]
    0x10002D05:  push     ebx
    0x10002D06:  push     1
    0x10002D08:  push     edx
    0x10002D09:  mov      esi, eax
    0x10002D0B:  call     0x100012d0
    0x10002D10:  add      esp, 0xc
    0x10002D13:  mov      dword ptr [ebp - 4], ebx
    0x10002D16:  call     0x1000a7db
    0x10002D1B:  lea      ecx, [ebp - 0x1c]
    0x10002D1E:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002D25:  call     0x1000a7ff
    0x10002D2A:  mov      eax, esi
    0x10002D2C:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002D2F:  mov      dword ptr fs:[0], ecx
    0x10002D36:  pop      ecx
    0x10002D37:  pop      edi
    0x10002D38:  pop      esi
    0x10002D39:  pop      ebx
    0x10002D3A:  mov      esp, ebp
    0x10002D3C:  pop      ebp
    0x10002D3D:  ret      4

// Function: LogStop (RVA: 0x2DC0, VA: 0x10002DC0)
    0x10002DC0:  push     ebp
    0x10002DC1:  mov      ebp, esp
    0x10002DC3:  push     -1
    0x10002DC5:  push     0x10115d50
    0x10002DCA:  mov      eax, dword ptr fs:[0]
    0x10002DD0:  push     eax
    0x10002DD1:  sub      esp, 0x18
    0x10002DD4:  push     ebx
    0x10002DD5:  push     esi
    0x10002DD6:  push     edi
    0x10002DD7:  mov      eax, dword ptr [0x1016b4ac]
    0x10002DDC:  xor      eax, ebp
    0x10002DDE:  push     eax
    0x10002DDF:  lea      eax, [ebp - 0xc]
    0x10002DE2:  mov      dword ptr fs:[0], eax
    0x10002DE8:  mov      dword ptr [ebp - 0x10], esp
    0x10002DEB:  call     0x100067c6
    0x10002DF0:  push     eax
    0x10002DF1:  lea      ecx, [ebp - 0x1c]
    0x10002DF4:  call     0x1000b0c7
    0x10002DF9:  xor      ebx, ebx
    0x10002DFB:  lea      ecx, [ebp - 0x24]
    0x10002DFE:  mov      dword ptr [ebp - 4], ebx
    0x10002E01:  call     0x1000a7c3
    0x10002E06:  mov      eax, dword ptr [0x1016d938]
    0x10002E0B:  push     0xbb8
    0x10002E10:  push     eax
    0x10002E11:  mov      byte ptr [ebp - 4], 2
    0x10002E15:  call     0x10001250
    0x10002E1A:  add      esp, 8
    0x10002E1D:  test     eax, eax
    0x10002E1F:  jne      0x10002e68
    0x10002E21:  mov      ecx, 0x1016ce20
    0x10002E26:  call     0x1000679c
    0x10002E2B:  mov      ecx, dword ptr [0x1016d938]
    0x10002E31:  push     ebx
    0x10002E32:  push     1
    0x10002E34:  push     ecx
    0x10002E35:  call     0x100012d0
    0x10002E3A:  add      esp, 0xc
    0x10002E3D:  mov      dword ptr [ebp - 4], ebx
    0x10002E40:  call     0x1000a7db
    0x10002E45:  lea      ecx, [ebp - 0x1c]
    0x10002E48:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002E4F:  call     0x1000a7ff
    0x10002E54:  xor      eax, eax
    0x10002E56:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002E59:  mov      dword ptr fs:[0], ecx
    0x10002E60:  pop      ecx
    0x10002E61:  pop      edi
    0x10002E62:  pop      esi
    0x10002E63:  pop      ebx
    0x10002E64:  mov      esp, ebp
    0x10002E66:  pop      ebp
    0x10002E67:  ret      

// Function: ReadCodeMemory (RVA: 0x2EE0, VA: 0x10002EE0)
    0x10002EE0:  push     ebp
    0x10002EE1:  mov      ebp, esp
    0x10002EE3:  push     -1
    0x10002EE5:  push     0x10115d80
    0x10002EEA:  mov      eax, dword ptr fs:[0]
    0x10002EF0:  push     eax
    0x10002EF1:  sub      esp, 0x18
    0x10002EF4:  push     ebx
    0x10002EF5:  push     esi
    0x10002EF6:  push     edi
    0x10002EF7:  mov      eax, dword ptr [0x1016b4ac]
    0x10002EFC:  xor      eax, ebp
    0x10002EFE:  push     eax
    0x10002EFF:  lea      eax, [ebp - 0xc]
    0x10002F02:  mov      dword ptr fs:[0], eax
    0x10002F08:  mov      dword ptr [ebp - 0x10], esp
    0x10002F0B:  call     0x100067c6
    0x10002F10:  push     eax
    0x10002F11:  lea      ecx, [ebp - 0x1c]
    0x10002F14:  call     0x1000b0c7
    0x10002F19:  xor      ebx, ebx
    0x10002F1B:  lea      ecx, [ebp - 0x24]
    0x10002F1E:  mov      dword ptr [ebp - 4], ebx
    0x10002F21:  call     0x1000a7c3
    0x10002F26:  mov      eax, dword ptr [0x1016d938]
    0x10002F2B:  push     0xbb8
    0x10002F30:  push     eax
    0x10002F31:  mov      byte ptr [ebp - 4], 2
    0x10002F35:  call     0x10001250
    0x10002F3A:  add      esp, 8
    0x10002F3D:  test     eax, eax
    0x10002F3F:  jne      0x10002f98
    0x10002F41:  mov      ecx, dword ptr [ebp + 0x10]
    0x10002F44:  mov      edx, dword ptr [ebp + 0xc]
    0x10002F47:  mov      eax, dword ptr [ebp + 8]
    0x10002F4A:  push     ecx
    0x10002F4B:  push     edx
    0x10002F4C:  push     eax
    0x10002F4D:  mov      ecx, 0x1016ce20
    0x10002F52:  call     0x100067a2
    0x10002F57:  mov      ecx, dword ptr [0x1016d938]
    0x10002F5D:  push     ebx
    0x10002F5E:  push     1
    0x10002F60:  push     ecx
    0x10002F61:  mov      esi, eax
    0x10002F63:  call     0x100012d0
    0x10002F68:  add      esp, 0xc
    0x10002F6B:  mov      dword ptr [ebp - 4], ebx
    0x10002F6E:  call     0x1000a7db
    0x10002F73:  lea      ecx, [ebp - 0x1c]
    0x10002F76:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002F7D:  call     0x1000a7ff
    0x10002F82:  mov      eax, esi
    0x10002F84:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002F87:  mov      dword ptr fs:[0], ecx
    0x10002F8E:  pop      ecx
    0x10002F8F:  pop      edi
    0x10002F90:  pop      esi
    0x10002F91:  pop      ebx
    0x10002F92:  mov      esp, ebp
    0x10002F94:  pop      ebp
    0x10002F95:  ret      0xc

// Function: ReadDataMemory (RVA: 0x2580, VA: 0x10002580)
    0x10002580:  push     ebp
    0x10002581:  mov      ebp, esp
    0x10002583:  push     -1
    0x10002585:  push     0x10115c00
    0x1000258A:  mov      eax, dword ptr fs:[0]
    0x10002590:  push     eax
    0x10002591:  sub      esp, 0x18
    0x10002594:  push     ebx
    0x10002595:  push     esi
    0x10002596:  push     edi
    0x10002597:  mov      eax, dword ptr [0x1016b4ac]
    0x1000259C:  xor      eax, ebp
    0x1000259E:  push     eax
    0x1000259F:  lea      eax, [ebp - 0xc]
    0x100025A2:  mov      dword ptr fs:[0], eax
    0x100025A8:  mov      dword ptr [ebp - 0x10], esp
    0x100025AB:  call     0x100067c6
    0x100025B0:  push     eax
    0x100025B1:  lea      ecx, [ebp - 0x1c]
    0x100025B4:  call     0x1000b0c7
    0x100025B9:  xor      ebx, ebx
    0x100025BB:  lea      ecx, [ebp - 0x24]
    0x100025BE:  mov      dword ptr [ebp - 4], ebx
    0x100025C1:  call     0x1000a7c3
    0x100025C6:  mov      eax, dword ptr [0x1016d938]
    0x100025CB:  push     0xbb8
    0x100025D0:  push     eax
    0x100025D1:  mov      byte ptr [ebp - 4], 2
    0x100025D5:  call     0x10001250
    0x100025DA:  add      esp, 8
    0x100025DD:  test     eax, eax
    0x100025DF:  jne      0x10002638
    0x100025E1:  mov      ecx, dword ptr [ebp + 0x10]
    0x100025E4:  mov      edx, dword ptr [ebp + 0xc]
    0x100025E7:  mov      eax, dword ptr [ebp + 8]
    0x100025EA:  push     ecx
    0x100025EB:  push     edx
    0x100025EC:  push     eax
    0x100025ED:  mov      ecx, 0x1016ce20
    0x100025F2:  call     0x10006772
    0x100025F7:  mov      ecx, dword ptr [0x1016d938]
    0x100025FD:  push     ebx
    0x100025FE:  push     1
    0x10002600:  push     ecx
    0x10002601:  mov      esi, eax
    0x10002603:  call     0x100012d0
    0x10002608:  add      esp, 0xc
    0x1000260B:  mov      dword ptr [ebp - 4], ebx
    0x1000260E:  call     0x1000a7db
    0x10002613:  lea      ecx, [ebp - 0x1c]
    0x10002616:  mov      dword ptr [ebp - 4], 0xffffffff
    0x1000261D:  call     0x1000a7ff
    0x10002622:  mov      eax, esi
    0x10002624:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002627:  mov      dword ptr fs:[0], ecx
    0x1000262E:  pop      ecx
    0x1000262F:  pop      edi
    0x10002630:  pop      esi
    0x10002631:  pop      ebx
    0x10002632:  mov      esp, ebp
    0x10002634:  pop      ebp
    0x10002635:  ret      0xc

// Function: ReadReg (RVA: 0x2910, VA: 0x10002910)
    0x10002910:  push     ebp
    0x10002911:  mov      ebp, esp
    0x10002913:  push     -1
    0x10002915:  push     0x10115c90
    0x1000291A:  mov      eax, dword ptr fs:[0]
    0x10002920:  push     eax
    0x10002921:  sub      esp, 0x18
    0x10002924:  push     ebx
    0x10002925:  push     esi
    0x10002926:  push     edi
    0x10002927:  mov      eax, dword ptr [0x1016b4ac]
    0x1000292C:  xor      eax, ebp
    0x1000292E:  push     eax
    0x1000292F:  lea      eax, [ebp - 0xc]
    0x10002932:  mov      dword ptr fs:[0], eax
    0x10002938:  mov      dword ptr [ebp - 0x10], esp
    0x1000293B:  call     0x100067c6
    0x10002940:  push     eax
    0x10002941:  lea      ecx, [ebp - 0x1c]
    0x10002944:  call     0x1000b0c7
    0x10002949:  xor      ebx, ebx
    0x1000294B:  lea      ecx, [ebp - 0x24]
    0x1000294E:  mov      dword ptr [ebp - 4], ebx
    0x10002951:  call     0x1000a7c3
    0x10002956:  mov      eax, dword ptr [0x1016d938]
    0x1000295B:  push     0xbb8
    0x10002960:  push     eax
    0x10002961:  mov      byte ptr [ebp - 4], 2
    0x10002965:  call     0x10001250
    0x1000296A:  add      esp, 8
    0x1000296D:  test     eax, eax
    0x1000296F:  jne      0x100029c3
    0x10002971:  mov      ecx, dword ptr [ebp + 0xc]
    0x10002974:  mov      edx, dword ptr [ebp + 8]
    0x10002977:  push     ecx
    0x10002978:  push     edx
    0x10002979:  mov      ecx, 0x1016ce20
    0x1000297E:  call     0x10006784
    0x10002983:  push     ebx
    0x10002984:  mov      esi, eax
    0x10002986:  mov      eax, dword ptr [0x1016d938]
    0x1000298B:  push     1
    0x1000298D:  push     eax
    0x1000298E:  call     0x100012d0
    0x10002993:  add      esp, 0xc
    0x10002996:  mov      dword ptr [ebp - 4], ebx
    0x10002999:  call     0x1000a7db
    0x1000299E:  lea      ecx, [ebp - 0x1c]
    0x100029A1:  mov      dword ptr [ebp - 4], 0xffffffff
    0x100029A8:  call     0x1000a7ff
    0x100029AD:  mov      eax, esi
    0x100029AF:  mov      ecx, dword ptr [ebp - 0xc]
    0x100029B2:  mov      dword ptr fs:[0], ecx
    0x100029B9:  pop      ecx
    0x100029BA:  pop      edi
    0x100029BB:  pop      esi
    0x100029BC:  pop      ebx
    0x100029BD:  mov      esp, ebp
    0x100029BF:  pop      ebp
    0x100029C0:  ret      8

// Function: SetCallbackFunc (RVA: 0x1C00, VA: 0x10001C00)
    0x10001C00:  push     ebp
    0x10001C01:  mov      ebp, esp
    0x10001C03:  push     -1
    0x10001C05:  push     0x10115a80
    0x10001C0A:  mov      eax, dword ptr fs:[0]
    0x10001C10:  push     eax
    0x10001C11:  sub      esp, 0x18
    0x10001C14:  push     ebx
    0x10001C15:  push     esi
    0x10001C16:  push     edi
    0x10001C17:  mov      eax, dword ptr [0x1016b4ac]
    0x10001C1C:  xor      eax, ebp
    0x10001C1E:  push     eax
    0x10001C1F:  lea      eax, [ebp - 0xc]
    0x10001C22:  mov      dword ptr fs:[0], eax
    0x10001C28:  mov      dword ptr [ebp - 0x10], esp
    0x10001C2B:  call     0x100067c6
    0x10001C30:  push     eax
    0x10001C31:  lea      ecx, [ebp - 0x1c]
    0x10001C34:  call     0x1000b0c7
    0x10001C39:  xor      ebx, ebx
    0x10001C3B:  lea      ecx, [ebp - 0x24]
    0x10001C3E:  mov      dword ptr [ebp - 4], ebx
    0x10001C41:  xor      esi, esi
    0x10001C43:  call     0x1000a7c3
    0x10001C48:  mov      eax, dword ptr [0x1016d938]
    0x10001C4D:  push     0xbb8
    0x10001C52:  push     eax
    0x10001C53:  call     0x10001250
    0x10001C58:  add      esp, 8
    0x10001C5B:  test     eax, eax
    0x10001C5D:  jne      0x10001cbe
    0x10001C5F:  mov      cl, byte ptr [0x1016d924]
    0x10001C65:  test     cl, cl
    0x10001C67:  je       0x10001c6e
    0x10001C69:  lea      esi, [ebx + 1]
    0x10001C6C:  jmp      0x10001c7f
    0x10001C6E:  mov      edx, dword ptr [ebp + 8]
    0x10001C71:  mov      eax, dword ptr [ebp + 0xc]
    0x10001C74:  mov      dword ptr [0x1016d92c], edx
    0x10001C7A:  mov      dword ptr [0x1016d930], eax
    0x10001C7F:  mov      ecx, dword ptr [0x1016d938]
    0x10001C85:  push     ebx
    0x10001C86:  push     1
    0x10001C88:  push     ecx
    0x10001C89:  call     0x100012d0
    0x10001C8E:  add      esp, 0xc
    0x10001C91:  mov      dword ptr [ebp - 4], ebx
    0x10001C94:  call     0x1000a7db
    0x10001C99:  lea      ecx, [ebp - 0x1c]
    0x10001C9C:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10001CA3:  call     0x1000a7ff
    0x10001CA8:  mov      eax, esi
    0x10001CAA:  mov      ecx, dword ptr [ebp - 0xc]
    0x10001CAD:  mov      dword ptr fs:[0], ecx
    0x10001CB4:  pop      ecx
    0x10001CB5:  pop      edi
    0x10001CB6:  pop      esi
    0x10001CB7:  pop      ebx
    0x10001CB8:  mov      esp, ebp
    0x10001CBA:  pop      ebp
    0x10001CBB:  ret      8

// Function: SetCodeMemoryDefaultCode (RVA: 0x1FA0, VA: 0x10001FA0)
    0x10001FA0:  push     ebp
    0x10001FA1:  mov      ebp, esp
    0x10001FA3:  push     -1
    0x10001FA5:  push     0x10115b10
    0x10001FAA:  mov      eax, dword ptr fs:[0]
    0x10001FB0:  push     eax
    0x10001FB1:  sub      esp, 0x18
    0x10001FB4:  push     ebx
    0x10001FB5:  push     esi
    0x10001FB6:  push     edi
    0x10001FB7:  mov      eax, dword ptr [0x1016b4ac]
    0x10001FBC:  xor      eax, ebp
    0x10001FBE:  push     eax
    0x10001FBF:  lea      eax, [ebp - 0xc]
    0x10001FC2:  mov      dword ptr fs:[0], eax
    0x10001FC8:  mov      dword ptr [ebp - 0x10], esp
    0x10001FCB:  call     0x100067c6
    0x10001FD0:  push     eax
    0x10001FD1:  lea      ecx, [ebp - 0x1c]
    0x10001FD4:  call     0x1000b0c7
    0x10001FD9:  xor      ebx, ebx
    0x10001FDB:  lea      ecx, [ebp - 0x24]
    0x10001FDE:  mov      dword ptr [ebp - 4], ebx
    0x10001FE1:  call     0x1000a7c3
    0x10001FE6:  mov      eax, dword ptr [0x1016d938]
    0x10001FEB:  push     0xbb8
    0x10001FF0:  push     eax
    0x10001FF1:  mov      byte ptr [ebp - 4], 2
    0x10001FF5:  call     0x10001250
    0x10001FFA:  add      esp, 8
    0x10001FFD:  test     eax, eax
    0x10001FFF:  jne      0x1000205e
    0x10002001:  mov      cl, byte ptr [0x1016d924]
    0x10002007:  test     cl, cl
    0x10002009:  je       0x10002010
    0x1000200B:  lea      esi, [ebx + 1]
    0x1000200E:  jmp      0x10002020
    0x10002010:  mov      edx, dword ptr [ebp + 8]
    0x10002013:  push     edx
    0x10002014:  mov      ecx, 0x1016ce20
    0x10002019:  call     0x1000675a
    0x1000201E:  mov      esi, eax
    0x10002020:  mov      eax, dword ptr [0x1016d938]
    0x10002025:  push     ebx
    0x10002026:  push     1
    0x10002028:  push     eax
    0x10002029:  call     0x100012d0
    0x1000202E:  add      esp, 0xc
    0x10002031:  mov      dword ptr [ebp - 4], ebx
    0x10002034:  call     0x1000a7db
    0x10002039:  lea      ecx, [ebp - 0x1c]
    0x1000203C:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002043:  call     0x1000a7ff
    0x10002048:  mov      eax, esi
    0x1000204A:  mov      ecx, dword ptr [ebp - 0xc]
    0x1000204D:  mov      dword ptr fs:[0], ecx
    0x10002054:  pop      ecx
    0x10002055:  pop      edi
    0x10002056:  pop      esi
    0x10002057:  pop      ebx
    0x10002058:  mov      esp, ebp
    0x1000205A:  pop      ebp
    0x1000205B:  ret      4

// Function: SetCodeMemorySize (RVA: 0x1980, VA: 0x10001980)
    0x10001980:  push     ebp
    0x10001981:  mov      ebp, esp
    0x10001983:  push     -1
    0x10001985:  push     0x10115a20
    0x1000198A:  mov      eax, dword ptr fs:[0]
    0x10001990:  push     eax
    0x10001991:  sub      esp, 0x18
    0x10001994:  push     ebx
    0x10001995:  push     esi
    0x10001996:  push     edi
    0x10001997:  mov      eax, dword ptr [0x1016b4ac]
    0x1000199C:  xor      eax, ebp
    0x1000199E:  push     eax
    0x1000199F:  lea      eax, [ebp - 0xc]
    0x100019A2:  mov      dword ptr fs:[0], eax
    0x100019A8:  mov      dword ptr [ebp - 0x10], esp
    0x100019AB:  call     0x100067c6
    0x100019B0:  push     eax
    0x100019B1:  lea      ecx, [ebp - 0x1c]
    0x100019B4:  call     0x1000b0c7
    0x100019B9:  xor      ebx, ebx
    0x100019BB:  lea      ecx, [ebp - 0x24]
    0x100019BE:  mov      dword ptr [ebp - 4], ebx
    0x100019C1:  call     0x1000a7c3
    0x100019C6:  mov      eax, dword ptr [0x1016d938]
    0x100019CB:  push     0xbb8
    0x100019D0:  push     eax
    0x100019D1:  mov      byte ptr [ebp - 4], 2
    0x100019D5:  call     0x10001250
    0x100019DA:  add      esp, 8
    0x100019DD:  test     eax, eax
    0x100019DF:  jne      0x10001a43
    0x100019E1:  mov      cl, byte ptr [0x1016d924]
    0x100019E7:  test     cl, cl
    0x100019E9:  je       0x100019f0
    0x100019EB:  lea      esi, [ebx + 1]
    0x100019EE:  jmp      0x10001a04
    0x100019F0:  mov      edx, dword ptr [ebp + 0xc]
    0x100019F3:  mov      eax, dword ptr [ebp + 8]
    0x100019F6:  push     edx
    0x100019F7:  push     eax
    0x100019F8:  mov      ecx, 0x1016ce20
    0x100019FD:  call     0x10006748
    0x10001A02:  mov      esi, eax
    0x10001A04:  mov      ecx, dword ptr [0x1016d938]
    0x10001A0A:  push     ebx
    0x10001A0B:  push     1
    0x10001A0D:  push     ecx
    0x10001A0E:  call     0x100012d0
    0x10001A13:  add      esp, 0xc
    0x10001A16:  mov      dword ptr [ebp - 4], ebx
    0x10001A19:  call     0x1000a7db
    0x10001A1E:  lea      ecx, [ebp - 0x1c]
    0x10001A21:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10001A28:  call     0x1000a7ff
    0x10001A2D:  mov      eax, esi
    0x10001A2F:  mov      ecx, dword ptr [ebp - 0xc]
    0x10001A32:  mov      dword ptr fs:[0], ecx
    0x10001A39:  pop      ecx
    0x10001A3A:  pop      edi
    0x10001A3B:  pop      esi
    0x10001A3C:  pop      ebx
    0x10001A3D:  mov      esp, ebp
    0x10001A3F:  pop      ebp
    0x10001A40:  ret      8

// Function: SetDataMemorySize (RVA: 0x1AC0, VA: 0x10001AC0)
    0x10001AC0:  push     ebp
    0x10001AC1:  mov      ebp, esp
    0x10001AC3:  push     -1
    0x10001AC5:  push     0x10115a50
    0x10001ACA:  mov      eax, dword ptr fs:[0]
    0x10001AD0:  push     eax
    0x10001AD1:  sub      esp, 0x18
    0x10001AD4:  push     ebx
    0x10001AD5:  push     esi
    0x10001AD6:  push     edi
    0x10001AD7:  mov      eax, dword ptr [0x1016b4ac]
    0x10001ADC:  xor      eax, ebp
    0x10001ADE:  push     eax
    0x10001ADF:  lea      eax, [ebp - 0xc]
    0x10001AE2:  mov      dword ptr fs:[0], eax
    0x10001AE8:  mov      dword ptr [ebp - 0x10], esp
    0x10001AEB:  call     0x100067c6
    0x10001AF0:  push     eax
    0x10001AF1:  lea      ecx, [ebp - 0x1c]
    0x10001AF4:  call     0x1000b0c7
    0x10001AF9:  xor      ebx, ebx
    0x10001AFB:  lea      ecx, [ebp - 0x24]
    0x10001AFE:  mov      dword ptr [ebp - 4], ebx
    0x10001B01:  call     0x1000a7c3
    0x10001B06:  mov      eax, dword ptr [0x1016d938]
    0x10001B0B:  push     0xbb8
    0x10001B10:  push     eax
    0x10001B11:  mov      byte ptr [ebp - 4], 2
    0x10001B15:  call     0x10001250
    0x10001B1A:  add      esp, 8
    0x10001B1D:  test     eax, eax
    0x10001B1F:  jne      0x10001b83
    0x10001B21:  mov      cl, byte ptr [0x1016d924]
    0x10001B27:  test     cl, cl
    0x10001B29:  je       0x10001b30
    0x10001B2B:  lea      esi, [ebx + 1]
    0x10001B2E:  jmp      0x10001b44
    0x10001B30:  mov      edx, dword ptr [ebp + 0xc]
    0x10001B33:  mov      eax, dword ptr [ebp + 8]
    0x10001B36:  push     edx
    0x10001B37:  push     eax
    0x10001B38:  mov      ecx, 0x1016ce20
    0x10001B3D:  call     0x1000674e
    0x10001B42:  mov      esi, eax
    0x10001B44:  mov      ecx, dword ptr [0x1016d938]
    0x10001B4A:  push     ebx
    0x10001B4B:  push     1
    0x10001B4D:  push     ecx
    0x10001B4E:  call     0x100012d0
    0x10001B53:  add      esp, 0xc
    0x10001B56:  mov      dword ptr [ebp - 4], ebx
    0x10001B59:  call     0x1000a7db
    0x10001B5E:  lea      ecx, [ebp - 0x1c]
    0x10001B61:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10001B68:  call     0x1000a7ff
    0x10001B6D:  mov      eax, esi
    0x10001B6F:  mov      ecx, dword ptr [ebp - 0xc]
    0x10001B72:  mov      dword ptr fs:[0], ecx
    0x10001B79:  pop      ecx
    0x10001B7A:  pop      edi
    0x10001B7B:  pop      esi
    0x10001B7C:  pop      ebx
    0x10001B7D:  mov      esp, ebp
    0x10001B7F:  pop      ebp
    0x10001B80:  ret      8

// Function: SetInterruptTable (RVA: 0x3270, VA: 0x10003270)
    0x10003270:  push     ebp
    0x10003271:  mov      ebp, esp
    0x10003273:  push     -1
    0x10003275:  push     0x10115e10
    0x1000327A:  mov      eax, dword ptr fs:[0]
    0x10003280:  push     eax
    0x10003281:  sub      esp, 0x18
    0x10003284:  push     ebx
    0x10003285:  push     esi
    0x10003286:  push     edi
    0x10003287:  mov      eax, dword ptr [0x1016b4ac]
    0x1000328C:  xor      eax, ebp
    0x1000328E:  push     eax
    0x1000328F:  lea      eax, [ebp - 0xc]
    0x10003292:  mov      dword ptr fs:[0], eax
    0x10003298:  mov      dword ptr [ebp - 0x10], esp
    0x1000329B:  call     0x100067c6
    0x100032A0:  push     eax
    0x100032A1:  lea      ecx, [ebp - 0x1c]
    0x100032A4:  call     0x1000b0c7
    0x100032A9:  xor      ebx, ebx
    0x100032AB:  lea      ecx, [ebp - 0x24]
    0x100032AE:  mov      dword ptr [ebp - 4], ebx
    0x100032B1:  call     0x1000a7c3
    0x100032B6:  mov      eax, dword ptr [0x1016d938]
    0x100032BB:  push     0xbb8
    0x100032C0:  push     eax
    0x100032C1:  mov      byte ptr [ebp - 4], 2
    0x100032C5:  call     0x10001250
    0x100032CA:  add      esp, 8
    0x100032CD:  test     eax, eax
    0x100032CF:  jne      0x10003333
    0x100032D1:  mov      cl, byte ptr [0x1016d924]
    0x100032D7:  test     cl, cl
    0x100032D9:  je       0x100032e0
    0x100032DB:  lea      esi, [ebx + 1]
    0x100032DE:  jmp      0x100032f4
    0x100032E0:  mov      edx, dword ptr [ebp + 0xc]
    0x100032E3:  mov      eax, dword ptr [ebp + 8]
    0x100032E6:  push     edx
    0x100032E7:  push     eax
    0x100032E8:  mov      ecx, 0x1016ce20
    0x100032ED:  call     0x100067b4
    0x100032F2:  mov      esi, eax
    0x100032F4:  mov      ecx, dword ptr [0x1016d938]
    0x100032FA:  push     ebx
    0x100032FB:  push     1
    0x100032FD:  push     ecx
    0x100032FE:  call     0x100012d0
    0x10003303:  add      esp, 0xc
    0x10003306:  mov      dword ptr [ebp - 4], ebx
    0x10003309:  call     0x1000a7db
    0x1000330E:  lea      ecx, [ebp - 0x1c]
    0x10003311:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10003318:  call     0x1000a7ff
    0x1000331D:  mov      eax, esi
    0x1000331F:  mov      ecx, dword ptr [ebp - 0xc]
    0x10003322:  mov      dword ptr fs:[0], ecx
    0x10003329:  pop      ecx
    0x1000332A:  pop      edi
    0x1000332B:  pop      esi
    0x1000332C:  pop      ebx
    0x1000332D:  mov      esp, ebp
    0x1000332F:  pop      ebp
    0x10003330:  ret      8

// Function: SetMemoryModel (RVA: 0x3140, VA: 0x10003140)
    0x10003140:  push     ebp
    0x10003141:  mov      ebp, esp
    0x10003143:  push     -1
    0x10003145:  push     0x10115de0
    0x1000314A:  mov      eax, dword ptr fs:[0]
    0x10003150:  push     eax
    0x10003151:  sub      esp, 0x18
    0x10003154:  push     ebx
    0x10003155:  push     esi
    0x10003156:  push     edi
    0x10003157:  mov      eax, dword ptr [0x1016b4ac]
    0x1000315C:  xor      eax, ebp
    0x1000315E:  push     eax
    0x1000315F:  lea      eax, [ebp - 0xc]
    0x10003162:  mov      dword ptr fs:[0], eax
    0x10003168:  mov      dword ptr [ebp - 0x10], esp
    0x1000316B:  call     0x100067c6
    0x10003170:  push     eax
    0x10003171:  lea      ecx, [ebp - 0x1c]
    0x10003174:  call     0x1000b0c7
    0x10003179:  xor      ebx, ebx
    0x1000317B:  lea      ecx, [ebp - 0x24]
    0x1000317E:  mov      dword ptr [ebp - 4], ebx
    0x10003181:  call     0x1000a7c3
    0x10003186:  mov      eax, dword ptr [0x1016d938]
    0x1000318B:  push     0xbb8
    0x10003190:  push     eax
    0x10003191:  mov      byte ptr [ebp - 4], 2
    0x10003195:  call     0x10001250
    0x1000319A:  add      esp, 8
    0x1000319D:  test     eax, eax
    0x1000319F:  jne      0x100031fe
    0x100031A1:  mov      cl, byte ptr [0x1016d924]
    0x100031A7:  test     cl, cl
    0x100031A9:  je       0x100031b0
    0x100031AB:  lea      esi, [ebx + 1]
    0x100031AE:  jmp      0x100031c0
    0x100031B0:  mov      edx, dword ptr [ebp + 8]
    0x100031B3:  push     edx
    0x100031B4:  mov      ecx, 0x1016ce20
    0x100031B9:  call     0x100067ae
    0x100031BE:  mov      esi, eax
    0x100031C0:  mov      eax, dword ptr [0x1016d938]
    0x100031C5:  push     ebx
    0x100031C6:  push     1
    0x100031C8:  push     eax
    0x100031C9:  call     0x100012d0
    0x100031CE:  add      esp, 0xc
    0x100031D1:  mov      dword ptr [ebp - 4], ebx
    0x100031D4:  call     0x1000a7db
    0x100031D9:  lea      ecx, [ebp - 0x1c]
    0x100031DC:  mov      dword ptr [ebp - 4], 0xffffffff
    0x100031E3:  call     0x1000a7ff
    0x100031E8:  mov      eax, esi
    0x100031EA:  mov      ecx, dword ptr [ebp - 0xc]
    0x100031ED:  mov      dword ptr fs:[0], ecx
    0x100031F4:  pop      ecx
    0x100031F5:  pop      edi
    0x100031F6:  pop      esi
    0x100031F7:  pop      ebx
    0x100031F8:  mov      esp, ebp
    0x100031FA:  pop      ebp
    0x100031FB:  ret      4

// Function: SetRomWindowSize (RVA: 0x1E60, VA: 0x10001E60)
    0x10001E60:  push     ebp
    0x10001E61:  mov      ebp, esp
    0x10001E63:  push     -1
    0x10001E65:  push     0x10115ae0
    0x10001E6A:  mov      eax, dword ptr fs:[0]
    0x10001E70:  push     eax
    0x10001E71:  sub      esp, 0x18
    0x10001E74:  push     ebx
    0x10001E75:  push     esi
    0x10001E76:  push     edi
    0x10001E77:  mov      eax, dword ptr [0x1016b4ac]
    0x10001E7C:  xor      eax, ebp
    0x10001E7E:  push     eax
    0x10001E7F:  lea      eax, [ebp - 0xc]
    0x10001E82:  mov      dword ptr fs:[0], eax
    0x10001E88:  mov      dword ptr [ebp - 0x10], esp
    0x10001E8B:  call     0x100067c6
    0x10001E90:  push     eax
    0x10001E91:  lea      ecx, [ebp - 0x1c]
    0x10001E94:  call     0x1000b0c7
    0x10001E99:  xor      ebx, ebx
    0x10001E9B:  lea      ecx, [ebp - 0x24]
    0x10001E9E:  mov      dword ptr [ebp - 4], ebx
    0x10001EA1:  call     0x1000a7c3
    0x10001EA6:  mov      eax, dword ptr [0x1016d938]
    0x10001EAB:  push     0xbb8
    0x10001EB0:  push     eax
    0x10001EB1:  mov      byte ptr [ebp - 4], 2
    0x10001EB5:  call     0x10001250
    0x10001EBA:  add      esp, 8
    0x10001EBD:  test     eax, eax
    0x10001EBF:  jne      0x10001f23
    0x10001EC1:  mov      cl, byte ptr [0x1016d924]
    0x10001EC7:  test     cl, cl
    0x10001EC9:  je       0x10001ed0
    0x10001ECB:  lea      esi, [ebx + 1]
    0x10001ECE:  jmp      0x10001ee4
    0x10001ED0:  mov      edx, dword ptr [ebp + 0xc]
    0x10001ED3:  mov      eax, dword ptr [ebp + 8]
    0x10001ED6:  push     edx
    0x10001ED7:  push     eax
    0x10001ED8:  mov      ecx, 0x1016ce20
    0x10001EDD:  call     0x10006754
    0x10001EE2:  mov      esi, eax
    0x10001EE4:  mov      ecx, dword ptr [0x1016d938]
    0x10001EEA:  push     ebx
    0x10001EEB:  push     1
    0x10001EED:  push     ecx
    0x10001EEE:  call     0x100012d0
    0x10001EF3:  add      esp, 0xc
    0x10001EF6:  mov      dword ptr [ebp - 4], ebx
    0x10001EF9:  call     0x1000a7db
    0x10001EFE:  lea      ecx, [ebp - 0x1c]
    0x10001F01:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10001F08:  call     0x1000a7ff
    0x10001F0D:  mov      eax, esi
    0x10001F0F:  mov      ecx, dword ptr [ebp - 0xc]
    0x10001F12:  mov      dword ptr fs:[0], ecx
    0x10001F19:  pop      ecx
    0x10001F1A:  pop      edi
    0x10001F1B:  pop      esi
    0x10001F1C:  pop      ebx
    0x10001F1D:  mov      esp, ebp
    0x10001F1F:  pop      ebp
    0x10001F20:  ret      8

// Function: SetWait (RVA: 0x1D30, VA: 0x10001D30)
    0x10001D30:  push     ebp
    0x10001D31:  mov      ebp, esp
    0x10001D33:  push     -1
    0x10001D35:  push     0x10115ab0
    0x10001D3A:  mov      eax, dword ptr fs:[0]
    0x10001D40:  push     eax
    0x10001D41:  sub      esp, 0x18
    0x10001D44:  push     ebx
    0x10001D45:  push     esi
    0x10001D46:  push     edi
    0x10001D47:  mov      eax, dword ptr [0x1016b4ac]
    0x10001D4C:  xor      eax, ebp
    0x10001D4E:  push     eax
    0x10001D4F:  lea      eax, [ebp - 0xc]
    0x10001D52:  mov      dword ptr fs:[0], eax
    0x10001D58:  mov      dword ptr [ebp - 0x10], esp
    0x10001D5B:  call     0x100067c6
    0x10001D60:  push     eax
    0x10001D61:  lea      ecx, [ebp - 0x1c]
    0x10001D64:  call     0x1000b0c7
    0x10001D69:  xor      ebx, ebx
    0x10001D6B:  lea      ecx, [ebp - 0x24]
    0x10001D6E:  mov      dword ptr [ebp - 4], ebx
    0x10001D71:  xor      esi, esi
    0x10001D73:  call     0x1000a7c3
    0x10001D78:  mov      eax, dword ptr [0x1016d938]
    0x10001D7D:  push     0xbb8
    0x10001D82:  push     eax
    0x10001D83:  call     0x10001250
    0x10001D88:  add      esp, 8
    0x10001D8B:  test     eax, eax
    0x10001D8D:  jne      0x10001de7
    0x10001D8F:  mov      cl, byte ptr [0x1016d924]
    0x10001D95:  test     cl, cl
    0x10001D97:  je       0x10001d9e
    0x10001D99:  lea      esi, [ebx + 1]
    0x10001D9C:  jmp      0x10001da9
    0x10001D9E:  mov      dx, word ptr [ebp + 8]
    0x10001DA2:  mov      word ptr [0x1016d934], dx
    0x10001DA9:  mov      eax, dword ptr [0x1016d938]
    0x10001DAE:  push     ebx
    0x10001DAF:  push     1
    0x10001DB1:  push     eax
    0x10001DB2:  call     0x100012d0
    0x10001DB7:  add      esp, 0xc
    0x10001DBA:  mov      dword ptr [ebp - 4], ebx
    0x10001DBD:  call     0x1000a7db
    0x10001DC2:  lea      ecx, [ebp - 0x1c]
    0x10001DC5:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10001DCC:  call     0x1000a7ff
    0x10001DD1:  mov      eax, esi
    0x10001DD3:  mov      ecx, dword ptr [ebp - 0xc]
    0x10001DD6:  mov      dword ptr fs:[0], ecx
    0x10001DDD:  pop      ecx
    0x10001DDE:  pop      edi
    0x10001DDF:  pop      esi
    0x10001DE0:  pop      ebx
    0x10001DE1:  mov      esp, ebp
    0x10001DE3:  pop      ebp
    0x10001DE4:  ret      4

// Function: SimReset (RVA: 0x2200, VA: 0x10002200)
    0x10002200:  push     ebp
    0x10002201:  mov      ebp, esp
    0x10002203:  push     -1
    0x10002205:  push     0x10115b70
    0x1000220A:  mov      eax, dword ptr fs:[0]
    0x10002210:  push     eax
    0x10002211:  sub      esp, 0x18
    0x10002214:  push     ebx
    0x10002215:  push     esi
    0x10002216:  push     edi
    0x10002217:  mov      eax, dword ptr [0x1016b4ac]
    0x1000221C:  xor      eax, ebp
    0x1000221E:  push     eax
    0x1000221F:  lea      eax, [ebp - 0xc]
    0x10002222:  mov      dword ptr fs:[0], eax
    0x10002228:  mov      dword ptr [ebp - 0x10], esp
    0x1000222B:  call     0x100067c6
    0x10002230:  push     eax
    0x10002231:  lea      ecx, [ebp - 0x1c]
    0x10002234:  call     0x1000b0c7
    0x10002239:  xor      ebx, ebx
    0x1000223B:  lea      ecx, [ebp - 0x24]
    0x1000223E:  mov      dword ptr [ebp - 4], ebx
    0x10002241:  call     0x1000a7c3
    0x10002246:  mov      eax, dword ptr [0x1016d938]
    0x1000224B:  push     0xbb8
    0x10002250:  push     eax
    0x10002251:  mov      byte ptr [ebp - 4], 2
    0x10002255:  call     0x10001250
    0x1000225A:  add      esp, 8
    0x1000225D:  test     eax, eax
    0x1000225F:  jne      0x100022aa
    0x10002261:  mov      ecx, 0x1016ce20
    0x10002266:  call     0x10006766
    0x1000226B:  mov      ecx, dword ptr [0x1016d938]
    0x10002271:  push     ebx
    0x10002272:  push     1
    0x10002274:  push     ecx
    0x10002275:  mov      esi, eax
    0x10002277:  call     0x100012d0
    0x1000227C:  add      esp, 0xc
    0x1000227F:  mov      dword ptr [ebp - 4], ebx
    0x10002282:  call     0x1000a7db
    0x10002287:  lea      ecx, [ebp - 0x1c]
    0x1000228A:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002291:  call     0x1000a7ff
    0x10002296:  mov      eax, esi
    0x10002298:  mov      ecx, dword ptr [ebp - 0xc]
    0x1000229B:  mov      dword ptr fs:[0], ecx
    0x100022A2:  pop      ecx
    0x100022A3:  pop      edi
    0x100022A4:  pop      esi
    0x100022A5:  pop      ebx
    0x100022A6:  mov      esp, ebp
    0x100022A8:  pop      ebp
    0x100022A9:  ret      

// Function: SimStart (RVA: 0x62C0, VA: 0x100062C0)
    0x100062C0:  push     ebp
    0x100062C1:  mov      ebp, esp
    0x100062C3:  push     -1
    0x100062C5:  push     0x101161a0
    0x100062CA:  mov      eax, dword ptr fs:[0]
    0x100062D0:  push     eax
    0x100062D1:  sub      esp, 0x18
    0x100062D4:  push     ebx
    0x100062D5:  push     esi
    0x100062D6:  push     edi
    0x100062D7:  mov      eax, dword ptr [0x1016b4ac]
    0x100062DC:  xor      eax, ebp
    0x100062DE:  push     eax
    0x100062DF:  lea      eax, [ebp - 0xc]
    0x100062E2:  mov      dword ptr fs:[0], eax
    0x100062E8:  mov      dword ptr [ebp - 0x10], esp
    0x100062EB:  call     0x100067c6
    0x100062F0:  push     eax
    0x100062F1:  lea      ecx, [ebp - 0x1c]
    0x100062F4:  call     0x1000b0c7
    0x100062F9:  xor      ebx, ebx
    0x100062FB:  lea      ecx, [ebp - 0x24]
    0x100062FE:  mov      dword ptr [ebp - 4], ebx
    0x10006301:  xor      esi, esi
    0x10006303:  call     0x1000a7c3
    0x10006308:  mov      eax, dword ptr [0x1016d938]
    0x1000630D:  push     0xbb8
    0x10006312:  push     eax
    0x10006313:  mov      byte ptr [ebp - 4], 2
    0x10006317:  call     0x10001250
    0x1000631C:  add      esp, 8
    0x1000631F:  test     eax, eax
    0x10006321:  jne      0x10006374
    0x10006323:  mov      cl, byte ptr [0x1016d924]
    0x10006329:  test     cl, cl
    0x1000632B:  je       0x10006332
    0x1000632D:  lea      esi, [ebx + 1]
    0x10006330:  jmp      0x10006337
    0x10006332:  call     0x10006240
    0x10006337:  mov      edx, dword ptr [0x1016d938]
    0x1000633D:  push     ebx
    0x1000633E:  push     1
    0x10006340:  push     edx
    0x10006341:  call     0x100012d0
    0x10006346:  add      esp, 0xc
    0x10006349:  mov      dword ptr [ebp - 4], ebx
    0x1000634C:  call     0x1000a7db
    0x10006351:  lea      ecx, [ebp - 0x1c]
    0x10006354:  mov      dword ptr [ebp - 4], 0xffffffff
    0x1000635B:  call     0x1000a7ff
    0x10006360:  mov      eax, esi
    0x10006362:  mov      ecx, dword ptr [ebp - 0xc]
    0x10006365:  mov      dword ptr fs:[0], ecx
    0x1000636C:  pop      ecx
    0x1000636D:  pop      edi
    0x1000636E:  pop      esi
    0x1000636F:  pop      ebx
    0x10006370:  mov      esp, ebp
    0x10006372:  pop      ebp
    0x10006373:  ret      

// Function: SimStop (RVA: 0x2320, VA: 0x10002320)
    0x10002320:  push     ebp
    0x10002321:  mov      ebp, esp
    0x10002323:  push     -1
    0x10002325:  push     0x10115ba0
    0x1000232A:  mov      eax, dword ptr fs:[0]
    0x10002330:  push     eax
    0x10002331:  sub      esp, 0x18
    0x10002334:  push     ebx
    0x10002335:  push     esi
    0x10002336:  push     edi
    0x10002337:  mov      eax, dword ptr [0x1016b4ac]
    0x1000233C:  xor      eax, ebp
    0x1000233E:  push     eax
    0x1000233F:  lea      eax, [ebp - 0xc]
    0x10002342:  mov      dword ptr fs:[0], eax
    0x10002348:  mov      dword ptr [ebp - 0x10], esp
    0x1000234B:  call     0x100067c6
    0x10002350:  push     eax
    0x10002351:  lea      ecx, [ebp - 0x1c]
    0x10002354:  call     0x1000b0c7
    0x10002359:  xor      ebx, ebx
    0x1000235B:  lea      ecx, [ebp - 0x24]
    0x1000235E:  mov      dword ptr [ebp - 4], ebx
    0x10002361:  call     0x1000a7c3
    0x10002366:  mov      eax, dword ptr [0x1016d938]
    0x1000236B:  push     0xbb8
    0x10002370:  push     eax
    0x10002371:  call     0x10001250
    0x10002376:  add      esp, 8
    0x10002379:  test     eax, eax
    0x1000237B:  jne      0x100023cc
    0x1000237D:  mov      cl, byte ptr [0x1016d924]
    0x10002383:  cmp      cl, 1
    0x10002386:  jne      0x1000238f
    0x10002388:  mov      byte ptr [0x1016d924], 2
    0x1000238F:  mov      edx, dword ptr [0x1016d938]
    0x10002395:  push     ebx
    0x10002396:  push     1
    0x10002398:  push     edx
    0x10002399:  call     0x100012d0
    0x1000239E:  add      esp, 0xc
    0x100023A1:  mov      dword ptr [ebp - 4], ebx
    0x100023A4:  call     0x1000a7db
    0x100023A9:  lea      ecx, [ebp - 0x1c]
    0x100023AC:  mov      dword ptr [ebp - 4], 0xffffffff
    0x100023B3:  call     0x1000a7ff
    0x100023B8:  xor      eax, eax
    0x100023BA:  mov      ecx, dword ptr [ebp - 0xc]
    0x100023BD:  mov      dword ptr fs:[0], ecx
    0x100023C4:  pop      ecx
    0x100023C5:  pop      edi
    0x100023C6:  pop      esi
    0x100023C7:  pop      ebx
    0x100023C8:  mov      esp, ebp
    0x100023CA:  pop      ebp
    0x100023CB:  ret      

// Function: WriteBitDataMemory (RVA: 0x27E0, VA: 0x100027E0)
    0x100027E0:  push     ebp
    0x100027E1:  mov      ebp, esp
    0x100027E3:  push     -1
    0x100027E5:  push     0x10115c60
    0x100027EA:  mov      eax, dword ptr fs:[0]
    0x100027F0:  push     eax
    0x100027F1:  sub      esp, 0x18
    0x100027F4:  push     ebx
    0x100027F5:  push     esi
    0x100027F6:  push     edi
    0x100027F7:  mov      eax, dword ptr [0x1016b4ac]
    0x100027FC:  xor      eax, ebp
    0x100027FE:  push     eax
    0x100027FF:  lea      eax, [ebp - 0xc]
    0x10002802:  mov      dword ptr fs:[0], eax
    0x10002808:  mov      dword ptr [ebp - 0x10], esp
    0x1000280B:  call     0x100067c6
    0x10002810:  push     eax
    0x10002811:  lea      ecx, [ebp - 0x1c]
    0x10002814:  call     0x1000b0c7
    0x10002819:  xor      ebx, ebx
    0x1000281B:  lea      ecx, [ebp - 0x24]
    0x1000281E:  mov      dword ptr [ebp - 4], ebx
    0x10002821:  call     0x1000a7c3
    0x10002826:  mov      eax, dword ptr [0x1016d938]
    0x1000282B:  push     0xbb8
    0x10002830:  push     eax
    0x10002831:  mov      byte ptr [ebp - 4], 2
    0x10002835:  call     0x10001250
    0x1000283A:  add      esp, 8
    0x1000283D:  test     eax, eax
    0x1000283F:  jne      0x10002898
    0x10002841:  mov      ecx, dword ptr [ebp + 0x10]
    0x10002844:  mov      edx, dword ptr [ebp + 0xc]
    0x10002847:  mov      eax, dword ptr [ebp + 8]
    0x1000284A:  push     ecx
    0x1000284B:  push     edx
    0x1000284C:  push     eax
    0x1000284D:  mov      ecx, 0x1016ce20
    0x10002852:  call     0x1000677e
    0x10002857:  mov      ecx, dword ptr [0x1016d938]
    0x1000285D:  push     ebx
    0x1000285E:  push     1
    0x10002860:  push     ecx
    0x10002861:  mov      esi, eax
    0x10002863:  call     0x100012d0
    0x10002868:  add      esp, 0xc
    0x1000286B:  mov      dword ptr [ebp - 4], ebx
    0x1000286E:  call     0x1000a7db
    0x10002873:  lea      ecx, [ebp - 0x1c]
    0x10002876:  mov      dword ptr [ebp - 4], 0xffffffff
    0x1000287D:  call     0x1000a7ff
    0x10002882:  mov      eax, esi
    0x10002884:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002887:  mov      dword ptr fs:[0], ecx
    0x1000288E:  pop      ecx
    0x1000288F:  pop      edi
    0x10002890:  pop      esi
    0x10002891:  pop      ebx
    0x10002892:  mov      esp, ebp
    0x10002894:  pop      ebp
    0x10002895:  ret      0xc

// Function: WriteCodeMemory (RVA: 0x2440, VA: 0x10002440)
    0x10002440:  push     ebp
    0x10002441:  mov      ebp, esp
    0x10002443:  push     -1
    0x10002445:  push     0x10115bd0
    0x1000244A:  mov      eax, dword ptr fs:[0]
    0x10002450:  push     eax
    0x10002451:  sub      esp, 0x18
    0x10002454:  push     ebx
    0x10002455:  push     esi
    0x10002456:  push     edi
    0x10002457:  mov      eax, dword ptr [0x1016b4ac]
    0x1000245C:  xor      eax, ebp
    0x1000245E:  push     eax
    0x1000245F:  lea      eax, [ebp - 0xc]
    0x10002462:  mov      dword ptr fs:[0], eax
    0x10002468:  mov      dword ptr [ebp - 0x10], esp
    0x1000246B:  call     0x100067c6
    0x10002470:  push     eax
    0x10002471:  lea      ecx, [ebp - 0x1c]
    0x10002474:  call     0x1000b0c7
    0x10002479:  xor      ebx, ebx
    0x1000247B:  lea      ecx, [ebp - 0x24]
    0x1000247E:  mov      dword ptr [ebp - 4], ebx
    0x10002481:  call     0x1000a7c3
    0x10002486:  mov      eax, dword ptr [0x1016d938]
    0x1000248B:  push     0xbb8
    0x10002490:  push     eax
    0x10002491:  mov      byte ptr [ebp - 4], 2
    0x10002495:  call     0x10001250
    0x1000249A:  add      esp, 8
    0x1000249D:  test     eax, eax
    0x1000249F:  jne      0x10002507
    0x100024A1:  mov      cl, byte ptr [0x1016d924]
    0x100024A7:  test     cl, cl
    0x100024A9:  je       0x100024b0
    0x100024AB:  lea      esi, [ebx + 1]
    0x100024AE:  jmp      0x100024c8
    0x100024B0:  mov      edx, dword ptr [ebp + 0x10]
    0x100024B3:  mov      eax, dword ptr [ebp + 0xc]
    0x100024B6:  mov      ecx, dword ptr [ebp + 8]
    0x100024B9:  push     edx
    0x100024BA:  push     eax
    0x100024BB:  push     ecx
    0x100024BC:  mov      ecx, 0x1016ce20
    0x100024C1:  call     0x1000676c
    0x100024C6:  mov      esi, eax
    0x100024C8:  mov      edx, dword ptr [0x1016d938]
    0x100024CE:  push     ebx
    0x100024CF:  push     1
    0x100024D1:  push     edx
    0x100024D2:  call     0x100012d0
    0x100024D7:  add      esp, 0xc
    0x100024DA:  mov      dword ptr [ebp - 4], ebx
    0x100024DD:  call     0x1000a7db
    0x100024E2:  lea      ecx, [ebp - 0x1c]
    0x100024E5:  mov      dword ptr [ebp - 4], 0xffffffff
    0x100024EC:  call     0x1000a7ff
    0x100024F1:  mov      eax, esi
    0x100024F3:  mov      ecx, dword ptr [ebp - 0xc]
    0x100024F6:  mov      dword ptr fs:[0], ecx
    0x100024FD:  pop      ecx
    0x100024FE:  pop      edi
    0x100024FF:  pop      esi
    0x10002500:  pop      ebx
    0x10002501:  mov      esp, ebp
    0x10002503:  pop      ebp
    0x10002504:  ret      0xc

// Function: WriteDataMemory (RVA: 0x26B0, VA: 0x100026B0)
    0x100026B0:  push     ebp
    0x100026B1:  mov      ebp, esp
    0x100026B3:  push     -1
    0x100026B5:  push     0x10115c30
    0x100026BA:  mov      eax, dword ptr fs:[0]
    0x100026C0:  push     eax
    0x100026C1:  sub      esp, 0x18
    0x100026C4:  push     ebx
    0x100026C5:  push     esi
    0x100026C6:  push     edi
    0x100026C7:  mov      eax, dword ptr [0x1016b4ac]
    0x100026CC:  xor      eax, ebp
    0x100026CE:  push     eax
    0x100026CF:  lea      eax, [ebp - 0xc]
    0x100026D2:  mov      dword ptr fs:[0], eax
    0x100026D8:  mov      dword ptr [ebp - 0x10], esp
    0x100026DB:  call     0x100067c6
    0x100026E0:  push     eax
    0x100026E1:  lea      ecx, [ebp - 0x1c]
    0x100026E4:  call     0x1000b0c7
    0x100026E9:  xor      ebx, ebx
    0x100026EB:  lea      ecx, [ebp - 0x24]
    0x100026EE:  mov      dword ptr [ebp - 4], ebx
    0x100026F1:  call     0x1000a7c3
    0x100026F6:  mov      eax, dword ptr [0x1016d938]
    0x100026FB:  push     0xbb8
    0x10002700:  push     eax
    0x10002701:  mov      byte ptr [ebp - 4], 2
    0x10002705:  call     0x10001250
    0x1000270A:  add      esp, 8
    0x1000270D:  test     eax, eax
    0x1000270F:  jne      0x10002768
    0x10002711:  mov      ecx, dword ptr [ebp + 0x10]
    0x10002714:  mov      edx, dword ptr [ebp + 0xc]
    0x10002717:  mov      eax, dword ptr [ebp + 8]
    0x1000271A:  push     ecx
    0x1000271B:  push     edx
    0x1000271C:  push     eax
    0x1000271D:  mov      ecx, 0x1016ce20
    0x10002722:  call     0x10006778
    0x10002727:  mov      ecx, dword ptr [0x1016d938]
    0x1000272D:  push     ebx
    0x1000272E:  push     1
    0x10002730:  push     ecx
    0x10002731:  mov      esi, eax
    0x10002733:  call     0x100012d0
    0x10002738:  add      esp, 0xc
    0x1000273B:  mov      dword ptr [ebp - 4], ebx
    0x1000273E:  call     0x1000a7db
    0x10002743:  lea      ecx, [ebp - 0x1c]
    0x10002746:  mov      dword ptr [ebp - 4], 0xffffffff
    0x1000274D:  call     0x1000a7ff
    0x10002752:  mov      eax, esi
    0x10002754:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002757:  mov      dword ptr fs:[0], ecx
    0x1000275E:  pop      ecx
    0x1000275F:  pop      edi
    0x10002760:  pop      esi
    0x10002761:  pop      ebx
    0x10002762:  mov      esp, ebp
    0x10002764:  pop      ebp
    0x10002765:  ret      0xc

// Function: WriteReg (RVA: 0x2A40, VA: 0x10002A40)
    0x10002A40:  push     ebp
    0x10002A41:  mov      ebp, esp
    0x10002A43:  push     -1
    0x10002A45:  push     0x10115cc0
    0x10002A4A:  mov      eax, dword ptr fs:[0]
    0x10002A50:  push     eax
    0x10002A51:  sub      esp, 0x18
    0x10002A54:  push     ebx
    0x10002A55:  push     esi
    0x10002A56:  push     edi
    0x10002A57:  mov      eax, dword ptr [0x1016b4ac]
    0x10002A5C:  xor      eax, ebp
    0x10002A5E:  push     eax
    0x10002A5F:  lea      eax, [ebp - 0xc]
    0x10002A62:  mov      dword ptr fs:[0], eax
    0x10002A68:  mov      dword ptr [ebp - 0x10], esp
    0x10002A6B:  call     0x100067c6
    0x10002A70:  push     eax
    0x10002A71:  lea      ecx, [ebp - 0x1c]
    0x10002A74:  call     0x1000b0c7
    0x10002A79:  xor      ebx, ebx
    0x10002A7B:  lea      ecx, [ebp - 0x24]
    0x10002A7E:  mov      dword ptr [ebp - 4], ebx
    0x10002A81:  call     0x1000a7c3
    0x10002A86:  mov      eax, dword ptr [0x1016d938]
    0x10002A8B:  push     0xbb8
    0x10002A90:  push     eax
    0x10002A91:  mov      byte ptr [ebp - 4], 2
    0x10002A95:  call     0x10001250
    0x10002A9A:  add      esp, 8
    0x10002A9D:  test     eax, eax
    0x10002A9F:  jne      0x10002af3
    0x10002AA1:  mov      ecx, dword ptr [ebp + 0xc]
    0x10002AA4:  mov      edx, dword ptr [ebp + 8]
    0x10002AA7:  push     ecx
    0x10002AA8:  push     edx
    0x10002AA9:  mov      ecx, 0x1016ce20
    0x10002AAE:  call     0x1000678a
    0x10002AB3:  push     ebx
    0x10002AB4:  mov      esi, eax
    0x10002AB6:  mov      eax, dword ptr [0x1016d938]
    0x10002ABB:  push     1
    0x10002ABD:  push     eax
    0x10002ABE:  call     0x100012d0
    0x10002AC3:  add      esp, 0xc
    0x10002AC6:  mov      dword ptr [ebp - 4], ebx
    0x10002AC9:  call     0x1000a7db
    0x10002ACE:  lea      ecx, [ebp - 0x1c]
    0x10002AD1:  mov      dword ptr [ebp - 4], 0xffffffff
    0x10002AD8:  call     0x1000a7ff
    0x10002ADD:  mov      eax, esi
    0x10002ADF:  mov      ecx, dword ptr [ebp - 0xc]
    0x10002AE2:  mov      dword ptr fs:[0], ecx
    0x10002AE9:  pop      ecx
    0x10002AEA:  pop      edi
    0x10002AEB:  pop      esi
    0x10002AEC:  pop      ebx
    0x10002AED:  mov      esp, ebp
    0x10002AEF:  pop      ebp
    0x10002AF0:  ret      8
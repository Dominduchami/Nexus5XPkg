/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250404 (64-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembly of DBG2.aml
 *
 * ACPI Data Table [DBG2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "DBG2"    [Debug Port Table type 2]
[004h 0004 004h]                Table Length : 000002FC
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 71
[00Ah 0010 006h]                      Oem ID : "QCOM  "
[010h 0016 008h]                Oem Table ID : "QCOMEDK2"
[018h 0024 004h]                Oem Revision : 00008994
[01Ch 0028 004h]             Asl Compiler ID : "INTL"
[020h 0032 004h]       Asl Compiler Revision : 20190108

[024h 0036 004h]                 Info Offset : 0000002C
[028h 0040 004h]                  Info Count : 00000005

[02Ch 0044 001h]                    Revision : 01
[02Dh 0045 002h]                      Length : 0030
[02Fh 0047 001h]              Register Count : 01
[030h 0048 002h]             Namepath Length : 000A
[032h 0050 002h]             Namepath Offset : 0026
[034h 0052 002h]             OEM Data Length : 0000 [Optional field not present]
[036h 0054 002h]             OEM Data Offset : 0000 [Optional field not present]
[038h 0056 002h]                   Port Type : 8000
[03Ah 0058 002h]                Port Subtype : 0004 //0012
[03Ch 0060 002h]                    Reserved : 0000
[03Eh 0062 002h]         Base Address Offset : 0016
[040h 0064 002h]         Address Size Offset : 0022

[042h 0066 00Ch]       Base Address Register : [Generic Address Structure]
[042h 0066 001h]                    Space ID : 00 [SystemMemory]
[043h 0067 001h]                   Bit Width : 20
[044h 0068 001h]                  Bit Offset : 00
[045h 0069 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[046h 0070 008h]                     Address : 00000000F991E000

[04Eh 0078 004h]                Address Size : 00001000

[052h 0082 00Ah]                    Namepath : "\_SB.UAR1"

[05Ch 0092 001h]                    Revision : 01
[05Dh 0093 002h]                      Length : 00AC
[05Fh 0095 001h]              Register Count : 02
[060h 0096 002h]             Namepath Length : 000A
[062h 0098 002h]             Namepath Offset : 0036
[064h 0100 002h]             OEM Data Length : 006C
[066h 0102 002h]             OEM Data Offset : 0040
[068h 0104 002h]                   Port Type : 8003
[06Ah 0106 002h]                Port Subtype : 5143
[06Ch 0108 002h]                    Reserved : 0000
[06Eh 0110 002h]         Base Address Offset : 0016
[070h 0112 002h]         Address Size Offset : 002E

[072h 0114 00Ch]       Base Address Register : [Generic Address Structure]
[072h 0114 001h]                    Space ID : 00 [SystemMemory]
[073h 0115 001h]                   Bit Width : 20
[074h 0116 001h]                  Bit Offset : 00
[075h 0117 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[076h 0118 008h]                     Address : 00000000F9A55000


[07Eh 0126 00Ch]       Base Address Register : [Generic Address Structure]
[07Eh 0126 001h]                    Space ID : 00 [SystemMemory]
[07Fh 0127 001h]                   Bit Width : 20
[080h 0128 001h]                  Bit Offset : 00
[081h 0129 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[082h 0130 008h]                     Address : 00000000FD4AB000

[08Ah 0138 004h]                Address Size : 00001000
[08Eh 0142 004h]                Address Size : 00001000

[092h 0146 00Ah]                    Namepath : "\_SB.URS0"
[040h 0064 06Ch]                    OEM Data : 01 AC 00 02 0A 00 36 00 6C 00 40 00 03 80 43 51 /* ......6.l.@...CQ */\
/* 050h 0080  16 */                            00 00 16 00 2E 00 00 20 00 20 00 50 A5 F9 00 00 /* ....... . .P.... */\
/* 060h 0096  16 */                            00 00 00 20 00 20 00 B0 4A FD 00 00 00 00 00 10 /* ... . ..J....... */\
/* 070h 0112  16 */                            00 00 00 10 00 00 5C 5F 53 42 2E 55 52 53 30 00 /* ......\_SB.URS0. */\
/* 080h 0128  16 */                            03 00 00 00 31 58 49 46 08 00 00 00 01 00 00 00 /* ....1XIF........ */\
/* 090h 0144  16 */                            00 00 00 00 00 00 00 00 00 00 40 00 00 00 00 00 /* ..........@..... */\
/* 0A0h 0160  12 */                            4E 45 54 31 00 00 90 00 00 00 00 00             /* NET1........ */\

[108h 0264 001h]                    Revision : 01
[109h 0265 002h]                      Length : 00AC
[10Bh 0267 001h]              Register Count : 02
[10Ch 0268 002h]             Namepath Length : 000A
[10Eh 0270 002h]             Namepath Offset : 0036
[110h 0272 002h]             OEM Data Length : 006C
[112h 0274 002h]             OEM Data Offset : 0040
[114h 0276 002h]                   Port Type : 8003
[116h 0278 002h]                Port Subtype : 5143
[118h 0280 002h]                    Reserved : 0000
[11Ah 0282 002h]         Base Address Offset : 0016
[11Ch 0284 002h]         Address Size Offset : 002E

[11Eh 0286 00Ch]       Base Address Register : [Generic Address Structure]
[11Eh 0286 001h]                    Space ID : 00 [SystemMemory]
[11Fh 0287 001h]                   Bit Width : 20
[120h 0288 001h]                  Bit Offset : 00
[121h 0289 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[122h 0290 008h]                     Address : 00000000F9A55000


[12Ah 0298 00Ch]       Base Address Register : [Generic Address Structure]
[12Ah 0298 001h]                    Space ID : 00 [SystemMemory]
[12Bh 0299 001h]                   Bit Width : 20
[12Ch 0300 001h]                  Bit Offset : 00
[12Dh 0301 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[12Eh 0302 008h]                     Address : 00000000FD4AB000

[136h 0310 004h]                Address Size : 00001000
[13Ah 0314 004h]                Address Size : 00001000

[13Eh 0318 00Ah]                    Namepath : "\_SB.UFN1"
[040h 0064 06Ch]                    OEM Data : 01 AC 00 02 0A 00 36 00 6C 00 40 00 03 80 43 51 /* ......6.l.@...CQ */\
/* 050h 0080  16 */                            00 00 16 00 2E 00 00 20 00 20 00 50 A5 F9 00 00 /* ....... . .P.... */\
/* 060h 0096  16 */                            00 00 00 20 00 20 00 B0 4A FD 00 00 00 00 00 10 /* ... . ..J....... */\
/* 070h 0112  16 */                            00 00 00 10 00 00 5C 5F 53 42 2E 55 46 4E 31 00 /* ......\_SB.UFN1. */\
/* 080h 0128  16 */                            03 00 00 00 31 58 49 46 08 00 00 00 01 00 00 00 /* ....1XIF........ */\
/* 090h 0144  16 */                            00 00 00 00 01 00 00 00 00 00 90 00 00 00 00 00 /* ................ */\
/* 0A0h 0160  12 */                            00 00 00 00 00 00 40 00 00 00 00 00             /* ......@..... */\

[1B4h 0436 001h]                    Revision : 01
[1B5h 0437 002h]                      Length : 00A4
[1B7h 0439 001h]              Register Count : 01
[1B8h 0440 002h]             Namepath Length : 000A
[1BAh 0442 002h]             Namepath Offset : 0026
[1BCh 0444 002h]             OEM Data Length : 0074
[1BEh 0446 002h]             OEM Data Offset : 0030
[1C0h 0448 002h]                   Port Type : 8002
[1C2h 0450 002h]                Port Subtype : 0004
[1C4h 0452 002h]                    Reserved : 0000
[1C6h 0454 002h]         Base Address Offset : 0016
[1C8h 0456 002h]         Address Size Offset : 0022

[1CAh 0458 00Ch]       Base Address Register : [Generic Address Structure]
[1CAh 0458 001h]                    Space ID : 00 [SystemMemory]
[1CBh 0459 001h]                   Bit Width : 20
[1CCh 0460 001h]                  Bit Offset : 00
[1CDh 0461 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[1CEh 0462 008h]                     Address : 00000000F9A55000

[1D6h 0470 004h]                Address Size : 000001AF

[1DAh 0474 00Ah]                    Namepath : "\_SB.URS0"
[030h 0048 074h]                    OEM Data : 01 A4 00 01 0A 00 26 00 74 00 30 00 02 80 04 00 /* ......&.t.0..... */\
/* 040h 0064  16 */                            00 00 16 00 22 00 00 20 00 20 00 50 A5 F9 00 00 /* ....".. . .P.... */\
/* 050h 0080  16 */                            00 00 AF 01 00 00 5C 5F 53 42 2E 55 52 53 30 00 /* ......\_SB.URS0. */\
/* 060h 0096  16 */                            74 00 00 00 00 50 A5 F9 00 00 00 00 00 10 00 00 /* t....P.......... */\
/* 070h 0112  16 */                            07 00 00 00 40 00 00 00 90 00 00 00 98 00 00 00 /* ....@........... */\
/* 080h 0128  16 */                            9C 00 00 00 70 01 00 00 A0 00 00 00 40 01 00 00 /* ....p.......@... */\
/* 090h 0144  16 */                            00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 0A0h 0160   4 */                            00 00 00 00                                     /* .... */\

[258h 0600 001h]                    Revision : 00
[259h 0601 002h]                      Length : 00A4
[25Bh 0603 001h]              Register Count : 01
[25Ch 0604 002h]             Namepath Length : 000A
[25Eh 0606 002h]             Namepath Offset : 0026
[260h 0608 002h]             OEM Data Length : 0074
[262h 0610 002h]             OEM Data Offset : 0030
[264h 0612 002h]                   Port Type : 8002
[266h 0614 002h]                Port Subtype : 0001
[268h 0616 002h]                    Reserved : 0000
[26Ah 0618 002h]         Base Address Offset : 0016
[26Ch 0620 002h]         Address Size Offset : 0022

[26Eh 0622 00Ch]       Base Address Register : [Generic Address Structure]
[26Eh 0622 001h]                    Space ID : 00 [SystemMemory]
[26Fh 0623 001h]                   Bit Width : 20
[270h 0624 001h]                  Bit Offset : 00
[271h 0625 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[272h 0626 008h]                     Address : 00000000F9200000

[27Ah 0634 004h]                Address Size : 000FFFFF

[27Eh 0638 00Ah]                    Namepath : "\_SB.URS0"
[030h 0048 074h]                    OEM Data : 00 A4 00 01 0A 00 26 00 74 00 30 00 02 80 01 00 /* ......&.t.0..... */\
/* 040h 0064  16 */                            00 00 16 00 22 00 00 20 00 20 00 00 20 F9 00 00 /* ....".. . .. ... */\
/* 050h 0080  16 */                            00 00 FF FF 0F 00 5C 5F 53 42 2E 55 52 53 30 00 /* ......\_SB.URS0. */\
/* 060h 0096  16 */                            74 00 00 00 00 B0 4A FD 00 00 00 00 00 10 00 00 /* t.....J......... */\
/* 070h 0112  16 */                            01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 080h 0128  16 */                            00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 090h 0144  16 */                            00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 0A0h 0160   4 */                            00 00 00 00                                     /* .... */\

Raw Table Data: Length 764 (0x2FC)

    0000: 44 42 47 32 FC 02 00 00 01 71 51 43 4F 4D 20 20  // DBG2.....qQCOM  
    0010: 51 43 4F 4D 45 44 4B 32 94 89 00 00 49 4E 54 4C  // QCOMEDK2....INTL
    0020: 08 01 19 20 2C 00 00 00 05 00 00 00 01 30 00 01  // ... ,........0..
    0030: 0A 00 26 00 00 00 00 00 00 80 04 00 00 00 16 00  // ..&.............
    0040: 22 00 00 20 00 20 00 E0 91 F9 00 00 00 00 00 10  // ".. . ..........
    0050: 00 00 5C 5F 53 42 2E 55 41 52 31 00 01 AC 00 02  // ..\_SB.UAR1.....
    0060: 0A 00 36 00 6C 00 40 00 03 80 43 51 00 00 16 00  // ..6.l.@...CQ....
    0070: 2E 00 00 20 00 20 00 50 A5 F9 00 00 00 00 00 20  // ... . .P....... 
    0080: 00 20 00 B0 4A FD 00 00 00 00 00 10 00 00 00 10  // . ..J...........
    0090: 00 00 5C 5F 53 42 2E 55 52 53 30 00 03 00 00 00  // ..\_SB.URS0.....
    00A0: 31 58 49 46 08 00 00 00 01 00 00 00 00 00 00 00  // 1XIF............
    00B0: 00 00 00 00 00 00 40 00 00 00 00 00 4E 45 54 31  // ......@.....NET1
    00C0: 00 00 90 00 00 00 00 00 00 00 00 00 00 00 98 00  // ................
    00D0: 00 00 00 00 08 00 00 00 00 00 9C 00 00 00 00 00  // ................
    00E0: B0 0C 00 00 00 00 70 01 00 00 00 00 03 00 96 60  // ......p........`
    00F0: 00 00 A0 00 00 00 00 00 E0 FF 00 00 00 00 40 01  // ..............@.
    0100: 00 00 00 00 00 00 08 02 01 AC 00 02 0A 00 36 00  // ..............6.
    0110: 6C 00 40 00 03 80 43 51 00 00 16 00 2E 00 00 20  // l.@...CQ....... 
    0120: 00 20 00 50 A5 F9 00 00 00 00 00 20 00 20 00 B0  // . .P....... . ..
    0130: 4A FD 00 00 00 00 00 10 00 00 00 10 00 00 5C 5F  // J.............\_
    0140: 53 42 2E 55 46 4E 31 00 03 00 00 00 31 58 49 46  // SB.UFN1.....1XIF
    0150: 08 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
    0160: 00 00 90 00 00 00 00 00 00 00 00 00 00 00 40 00  // ..............@.
    0170: 00 00 00 00 4E 45 54 32 00 00 98 00 00 00 00 00  // ....NET2........
    0180: 08 00 00 00 00 00 9C 00 00 00 00 00 B0 0C 00 00  // ................
    0190: 00 00 70 01 00 00 00 00 03 00 96 60 00 00 A0 00  // ..p........`....
    01A0: 00 00 00 00 E0 FF 00 00 00 00 40 01 00 00 00 00  // ..........@.....
    01B0: 00 00 08 02 01 A4 00 01 0A 00 26 00 74 00 30 00  // ..........&.t.0.
    01C0: 02 80 04 00 00 00 16 00 22 00 00 20 00 20 00 50  // ........".. . .P
    01D0: A5 F9 00 00 00 00 AF 01 00 00 5C 5F 53 42 2E 55  // ..........\_SB.U
    01E0: 52 53 30 00 74 00 00 00 00 50 A5 F9 00 00 00 00  // RS0.t....P......
    01F0: 00 10 00 00 07 00 00 00 40 00 00 00 90 00 00 00  // ........@.......
    0200: 98 00 00 00 9C 00 00 00 70 01 00 00 A0 00 00 00  // ........p.......
    0210: 40 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // @...............
    0220: 00 00 00 00 00 00 00 00 55 53 42 31 00 00 00 00  // ........USB1....
    0230: 08 00 00 00 B0 0C 00 00 03 00 96 60 E0 FF 00 00  // ...........`....
    0240: 00 00 08 02 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0250: 00 00 00 00 00 00 00 00 00 A4 00 01 0A 00 26 00  // ..............&.
    0260: 74 00 30 00 02 80 01 00 00 00 16 00 22 00 00 20  // t.0.........".. 
    0270: 00 20 00 00 20 F9 00 00 00 00 FF FF 0F 00 5C 5F  // . .. .........\_
    0280: 53 42 2E 55 52 53 30 00 74 00 00 00 00 B0 4A FD  // SB.URS0.t.....J.
    0290: 00 00 00 00 00 10 00 00 01 00 00 00 00 00 00 00  // ................
    02A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    02B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    02C0: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  // ................
    02D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    02E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    02F0: 00 00 00 00 00 00 00 00 00 00 00 00              // ............

/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250404 (64-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembly of 8974dbg2.aml
 *
 * ACPI Data Table [DBG2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "DBG2"    [Debug Port Table type 2]
[004h 0004 004h]                Table Length : 000002B0
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 00     /* Incorrect checksum, should be 80 */
[00Ah 0010 006h]                      Oem ID : "QCOM  "
[010h 0016 008h]                Oem Table ID : "QCOMEDK2"
[018h 0024 004h]                Oem Revision : 00000001
[01Ch 0028 004h]             Asl Compiler ID : "QCOM"
[020h 0032 004h]       Asl Compiler Revision : 00000001

[024h 0036 004h]                 Info Offset : 0000002C
[028h 0040 004h]                  Info Count : 00000004

[02Ch 0044 001h]                    Revision : 01
[02Dh 0045 002h]                      Length : 0046
[02Fh 0047 001h]              Register Count : 01
[030h 0048 002h]             Namepath Length : 000A
[032h 0050 002h]             Namepath Offset : 0026
[034h 0052 002h]             OEM Data Length : 0000 [Optional field not present]
[036h 0054 002h]             OEM Data Offset : 0000 [Optional field not present]
[038h 0056 002h]                   Port Type : 8000
[03Ah 0058 002h]                Port Subtype : 0004
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

[072h 0114 001h]                    Revision : 01
[073h 0115 002h]                      Length : 00C2
[075h 0117 001h]              Register Count : 02
[076h 0118 002h]             Namepath Length : 000A
[078h 0120 002h]             Namepath Offset : 0036
[07Ah 0122 002h]             OEM Data Length : 006C
[07Ch 0124 002h]             OEM Data Offset : 0056
[07Eh 0126 002h]                   Port Type : 8003
[080h 0128 002h]                Port Subtype : 5143
[082h 0130 002h]                    Reserved : 0000
[084h 0132 002h]         Base Address Offset : 0016
[086h 0134 002h]         Address Size Offset : 002E

[088h 0136 00Ch]       Base Address Register : [Generic Address Structure]
[088h 0136 001h]                    Space ID : 00 [SystemMemory]
[089h 0137 001h]                   Bit Width : 20
[08Ah 0138 001h]                  Bit Offset : 00
[08Bh 0139 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[08Ch 0140 008h]                     Address : 00000000F9A55000


[094h 0148 00Ch]       Base Address Register : [Generic Address Structure]
[094h 0148 001h]                    Space ID : 00 [SystemMemory]
[095h 0149 001h]                   Bit Width : 20
[096h 0150 001h]                  Bit Offset : 00
[097h 0151 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[098h 0152 008h]                     Address : 00000000FD4AB000

[0A0h 0160 004h]                Address Size : 00001000
[0A4h 0164 004h]                Address Size : 00001000

[0A8h 0168 00Ah]                    Namepath : "\_SB.UFN0"
[056h 0086 06Ch]                    OEM Data : 01 C2 00 02 0A 00 36 00 6C 00 56 00 03 80 43 51 /* ......6.l.V...CQ */\
/* 066h 0102  16 */                            00 00 16 00 2E 00 00 20 00 20 00 50 A5 F9 00 00 /* ....... . .P.... */\
/* 076h 0118  16 */                            00 00 00 20 00 20 00 B0 4A FD 00 00 00 00 00 10 /* ... . ..J....... */\
/* 086h 0134  16 */                            00 00 00 10 00 00 5C 5F 53 42 2E 55 46 4E 30 00 /* ......\_SB.UFN0. */\
/* 096h 0150  16 */                            00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 0A6h 0166  16 */                            00 00 00 00 00 00 01 00 00 00 31 58 49 46 05 00 /* ..........1XIF.. */\
/* 0B6h 0182  12 */                            00 00 01 00 00 00 00 00 00 00 00 00             /* ............ */\

[134h 0308 001h]                    Revision : 01
[135h 0309 002h]                      Length : 00C2
[137h 0311 001h]              Register Count : 02
[138h 0312 002h]             Namepath Length : 000A
[13Ah 0314 002h]             Namepath Offset : 0036
[13Ch 0316 002h]             OEM Data Length : 006C
[13Eh 0318 002h]             OEM Data Offset : 0056
[140h 0320 002h]                   Port Type : 8003
[142h 0322 002h]                Port Subtype : 5143
[144h 0324 002h]                    Reserved : 0000
[146h 0326 002h]         Base Address Offset : 0016
[148h 0328 002h]         Address Size Offset : 002E

[14Ah 0330 00Ch]       Base Address Register : [Generic Address Structure]
[14Ah 0330 001h]                    Space ID : 00 [SystemMemory]
[14Bh 0331 001h]                   Bit Width : 20
[14Ch 0332 001h]                  Bit Offset : 00
[14Dh 0333 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[14Eh 0334 008h]                     Address : 00000000F9A55000


[156h 0342 00Ch]       Base Address Register : [Generic Address Structure]
[156h 0342 001h]                    Space ID : 00 [SystemMemory]
[157h 0343 001h]                   Bit Width : 20
[158h 0344 001h]                  Bit Offset : 00
[159h 0345 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[15Ah 0346 008h]                     Address : 00000000FD4AB000

[162h 0354 004h]                Address Size : 00001000
[166h 0358 004h]                Address Size : 00001000

[16Ah 0362 00Ah]                    Namepath : "\_SB.USB2"
[056h 0086 06Ch]                    OEM Data : 01 C2 00 02 0A 00 36 00 6C 00 56 00 03 80 43 51 /* ......6.l.V...CQ */\
/* 066h 0102  16 */                            00 00 16 00 2E 00 00 20 00 20 00 50 A5 F9 00 00 /* ....... . .P.... */\
/* 076h 0118  16 */                            00 00 00 20 00 20 00 B0 4A FD 00 00 00 00 00 10 /* ... . ..J....... */\
/* 086h 0134  16 */                            00 00 00 10 00 00 5C 5F 53 42 2E 55 53 42 32 00 /* ......\_SB.USB2. */\
/* 096h 0150  16 */                            00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 0A6h 0166  16 */                            00 00 00 00 00 00 01 00 00 00 31 58 49 46 06 00 /* ..........1XIF.. */\
/* 0B6h 0182  12 */                            00 00 01 00 00 00 00 00 00 00 01 00             /* ............ */\

[1F6h 0502 001h]                    Revision : 01
[1F7h 0503 002h]                      Length : 00BA
[1F9h 0505 001h]              Register Count : 01
[1FAh 0506 002h]             Namepath Length : 000A
[1FCh 0508 002h]             Namepath Offset : 0026
[1FEh 0510 002h]             OEM Data Length : 0074
[200h 0512 002h]             OEM Data Offset : 0046
[202h 0514 002h]                   Port Type : 8002
[204h 0516 002h]                Port Subtype : 0004
[206h 0518 002h]                    Reserved : 0000
[208h 0520 002h]         Base Address Offset : 0016
[20Ah 0522 002h]         Address Size Offset : 0022

[20Ch 0524 00Ch]       Base Address Register : [Generic Address Structure]
[20Ch 0524 001h]                    Space ID : 00 [SystemMemory]
[20Dh 0525 001h]                   Bit Width : 20
[20Eh 0526 001h]                  Bit Offset : 00
[20Fh 0527 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[210h 0528 008h]                     Address : 00000000F9A55000

[218h 0536 004h]                Address Size : 000001AF

[21Ch 0540 00Ah]                    Namepath : "\_SB.UFN0"
[046h 0070 074h]                    OEM Data : 01 BA 00 01 0A 00 26 00 74 00 46 00 02 80 04 00 /* ......&.t.F..... */\
/* 056h 0086  16 */                            00 00 16 00 22 00 00 20 00 20 00 50 A5 F9 00 00 /* ....".. . .P.... */\
/* 066h 0102  16 */                            00 00 AF 01 00 00 5C 5F 53 42 2E 55 46 4E 30 00 /* ......\_SB.UFN0. */\
/* 076h 0118  16 */                            00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 086h 0134  16 */                            00 00 00 00 00 00 74 00 00 00 00 50 A5 F9 00 00 /* ......t....P.... */\
/* 096h 0150  16 */                            00 00 00 10 00 00 04 00 00 00 90 00 00 00 98 00 /* ................ */\
/* 0A6h 0166  16 */                            00 00 9C 00 00 00 78 02 00 00 00 00 00 00 00 00 /* ......x......... */\
/* 0B6h 0182   4 */                            00 00 00 00                                     /* .... */\

Raw Table Data: Length 688 (0x2B0)

    0000: 44 42 47 32 B0 02 00 00 01 00 51 43 4F 4D 20 20  // DBG2......QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 01 00 00 00 51 43 4F 4D  // QCOMEDK2....QCOM
    0020: 01 00 00 00 2C 00 00 00 04 00 00 00 01 46 00 01  // ....,........F..
    0030: 0A 00 26 00 00 00 00 00 00 80 04 00 00 00 16 00  // ..&.............
    0040: 22 00 00 20 00 20 00 E0 91 F9 00 00 00 00 00 10  // ".. . ..........
    0050: 00 00 5C 5F 53 42 2E 55 41 52 31 00 00 00 00 00  // ..\_SB.UAR1.....
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 01 C2 00 02 0A 00 36 00 6C 00 56 00 03 80  // ........6.l.V...
    0080: 43 51 00 00 16 00 2E 00 00 20 00 20 00 50 A5 F9  // CQ....... . .P..
    0090: 00 00 00 00 00 20 00 20 00 B0 4A FD 00 00 00 00  // ..... . ..J.....
    00A0: 00 10 00 00 00 10 00 00 5C 5F 53 42 2E 55 46 4E  // ........\_SB.UFN
    00B0: 30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // 0...............
    00C0: 00 00 00 00 00 00 00 00 01 00 00 00 31 58 49 46  // ............1XIF
    00D0: 05 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  // ................
    00E0: 00 00 40 00 00 00 00 00 4E 45 54 31 00 00 90 00  // ..@.....NET1....
    00F0: 00 00 00 00 00 00 00 00 00 00 98 00 00 00 00 00  // ................
    0100: 08 00 00 00 00 00 9C 00 00 00 00 00 B0 0C 00 00  // ................
    0110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0130: 00 00 00 00 01 C2 00 02 0A 00 36 00 6C 00 56 00  // ..........6.l.V.
    0140: 03 80 43 51 00 00 16 00 2E 00 00 20 00 20 00 50  // ..CQ....... . .P
    0150: A5 F9 00 00 00 00 00 20 00 20 00 B0 4A FD 00 00  // ....... . ..J...
    0160: 00 00 00 10 00 00 00 10 00 00 5C 5F 53 42 2E 55  // ..........\_SB.U
    0170: 53 42 32 00 00 00 00 00 00 00 00 00 00 00 00 00  // SB2.............
    0180: 00 00 00 00 00 00 00 00 00 00 01 00 00 00 31 58  // ..............1X
    0190: 49 46 06 00 00 00 01 00 00 00 00 00 00 00 01 00  // IF..............
    01A0: 00 00 00 00 40 00 00 00 00 00 4E 45 54 32 00 00  // ....@.....NET2..
    01B0: 90 00 00 00 00 00 00 00 00 00 00 00 98 00 00 00  // ................
    01C0: 00 00 08 00 00 00 00 00 9C 00 00 00 00 00 B0 0C  // ................
    01D0: 00 00 00 00 78 02 00 00 00 00 32 3C 0D 00 00 00  // ....x.....2<....
    01E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01F0: 00 00 00 00 00 00 01 BA 00 01 0A 00 26 00 74 00  // ............&.t.
    0200: 46 00 02 80 04 00 00 00 16 00 22 00 00 20 00 20  // F.........".. . 
    0210: 00 50 A5 F9 00 00 00 00 AF 01 00 00 5C 5F 53 42  // .P..........\_SB
    0220: 2E 55 46 4E 30 00 00 00 00 00 00 00 00 00 00 00  // .UFN0...........
    0230: 00 00 00 00 00 00 00 00 00 00 00 00 74 00 00 00  // ............t...
    0240: 00 50 A5 F9 00 00 00 00 00 10 00 00 04 00 00 00  // .P..............
    0250: 90 00 00 00 98 00 00 00 9C 00 00 00 78 02 00 00  // ............x...
    0260: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0270: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0280: 00 00 00 00 08 00 00 00 B0 0C 00 00 32 3C 0D 00  // ............2<..
    0290: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    02A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................

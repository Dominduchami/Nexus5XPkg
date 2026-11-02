/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250404 (64-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembly of BULLHEAD_DBG2.aml
 *
 * ACPI Data Table [DBG2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "DBG2"    [Debug Port Table type 2]
[004h 0004 004h]                Table Length : 000000D0
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : B8
[00Ah 0010 006h]                      Oem ID : "QCOM  "
[010h 0016 008h]                Oem Table ID : "QCOMEDK2"
[018h 0024 004h]                Oem Revision : 00008994
[01Ch 0028 004h]             Asl Compiler ID : "INTL"
[020h 0032 004h]       Asl Compiler Revision : 20250404

[024h 0036 004h]                 Info Offset : 0000002C
[028h 0040 004h]                  Info Count : 00000005

[02Ch 0044 001h]                    Revision : 00
[02Dh 0045 002h]                      Length : 00A4
[02Fh 0047 001h]              Register Count : 01
[030h 0048 002h]             Namepath Length : 000A
[032h 0050 002h]             Namepath Offset : 0026
[034h 0052 002h]             OEM Data Length : 0074
[036h 0054 002h]             OEM Data Offset : 0030
[038h 0056 002h]                   Port Type : 8002
[03Ah 0058 002h]                Port Subtype : 0001
[03Ch 0060 002h]                    Reserved : 0000
[03Eh 0062 002h]         Base Address Offset : 0016
[040h 0064 002h]         Address Size Offset : 0022

[042h 0066 00Ch]       Base Address Register : [Generic Address Structure]
[042h 0066 001h]                    Space ID : 00 [SystemMemory]
[043h 0067 001h]                   Bit Width : 20
[044h 0068 001h]                  Bit Offset : 00
[045h 0069 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[046h 0070 008h]                     Address : 00000000F9200000

[04Eh 0078 004h]                Address Size : 000FFFFF

[052h 0082 00Ah]                    Namepath : "\_SB.URS0"
[030h 0048 074h]                    OEM Data : 00 A4 00 01 0A 00 26 00 74 00 30 00 02 80 01 00 /* ......&.t.0..... */\
/* 040h 0064  16 */                            00 00 16 00 22 00 00 20 00 20 00 00 20 F9 00 00 /* ....".. . .. ... */\
/* 050h 0080  16 */                            00 00 FF FF 0F 00 5C 5F 53 42 2E 55 52 53 30 00 /* ......\_SB.URS0. */\
/* 060h 0096  16 */                            00 A4 00 01 0A 00 26 00 74 00 30 00 02 80 01 00 /* ......&.t.0..... */\
/* 070h 0112  16 */                            00 00 16 00 22 00 00 20 00 20 00 00 20 F9 00 00 /* ....".. . .. ... */\
/* 080h 0128  16 */                            00 00 FF FF 0F 00 5C 5F 53 42 2E 55 52 53 30 00 /* ......\_SB.URS0. */\
/* 090h 0144  16 */                            74 00 00 00 00 B0 4A FD 00 00 00 00 00 10 00 00 /* t.....J......... */\
/* 0A0h 0160   4 */                            01 00 00 00                                     /* .... */\

Raw Table Data: Length 208 (0xD0)

    0000: 44 42 47 32 D0 00 00 00 01 B8 51 43 4F 4D 20 20  // DBG2......QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 94 89 00 00 49 4E 54 4C  // QCOMEDK2....INTL
    0020: 04 04 25 20 2C 00 00 00 05 00 00 00 00 A4 00 01  // ..% ,...........
    0030: 0A 00 26 00 74 00 30 00 02 80 01 00 00 00 16 00  // ..&.t.0.........
    0040: 22 00 00 20 00 20 00 00 20 F9 00 00 00 00 FF FF  // ".. . .. .......
    0050: 0F 00 5C 5F 53 42 2E 55 52 53 30 00 00 A4 00 01  // ..\_SB.URS0.....
    0060: 0A 00 26 00 74 00 30 00 02 80 01 00 00 00 16 00  // ..&.t.0.........
    0070: 22 00 00 20 00 20 00 00 20 F9 00 00 00 00 FF FF  // ".. . .. .......
    0080: 0F 00 5C 5F 53 42 2E 55 52 53 30 00 74 00 00 00  // ..\_SB.URS0.t...
    0090: 00 B0 4A FD 00 00 00 00 00 10 00 00 01 00 00 00  // ..J.............
    00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................

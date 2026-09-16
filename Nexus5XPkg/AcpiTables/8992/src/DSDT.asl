/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250404 (64-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of DSDT_BULLHEAD.aml
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00001836 (6198)
 *     Revision         0x02
 *     Checksum         0x69
 *     OEM ID           "QCOMM "
 *     OEM Table ID     "MSM8994 "
 *     OEM Revision     0x00000003 (3)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x05000000 (83886080)
 */
DefinitionBlock ("", "DSDT", 2, "QCOMM ", "MSM8994 ", 0x00000003)
{
    Scope (\_SB)
    {
        Name (SOID, 0xFB)
        Name (SIDS, "899200000000000")
        Name (SIDV, 0x00010000)
        Name (SVMJ, One)
        Name (SVMI, Zero)
        Name (SDFE, 0x39)
        Name (SFES, "899200000000000")
        Name (SIDM, 0xFFFF00FF)
        Name (SSBS, "899400000000000")
        Name (NCPU, "6")
        Name (PSCI, "000")
        Name (RMTB, 0x06F00000)
        Name (RMTX, 0x00180000)
        Name (RFMB, 0x07090000)
        Name (RFMS, 0x00010000)
        Name (RFAB, 0x07080000)
        Name (RFAS, 0x00010000)
        Device (SDC1)
        {
            Name (_HID, "QCOM24BF")  // _HID: Hardware ID
            Name (_CID, "ACPIQCOM24BF")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF9824900,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000009B,
                    }
                })
                Return (RBUF) /* \_SB_.SDC1._CRS.RBUF */
            }

            Device (EMMC)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return (0x08)
                }

                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    Return (Zero)
                }
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (ABD)
        {
            Name (_HID, "QCOM2431")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            OperationRegion (ROP1, GenericSerialBus, Zero, 0x0100)
            Name (AVBL, Zero)
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x09))
                {
                    AVBL = Arg1
                }
            }
        }

        Name (ESNL, 0x14)
        Name (DBFL, 0x17)
        Device (PMIC)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.SPMI
            })
            Name (_HID, "QCOM2455")  // _HID: Hardware ID
            Method (PMCF, 0, NotSerialized)
            {
                Name (CFG0, Package (0x03)
                {
                    0x02, 
                    Package (0x02)
                    {
                        Zero, 
                        One
                    }, 

                    Package (0x02)
                    {
                        0x02, 
                        0x03
                    }
                })
                Return (CFG0) /* \_SB_.PMIC.PMCF.CFG0 */
            }
        }

        Device (PM01)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMIC
            })
            Name (_HID, "QCOM2458")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000DE,
                    }
                })
                Return (RBUF) /* \_SB_.PM01._CRS.RBUF */
            }

            Method (PMIO, 0, NotSerialized)
            {
                Name (CFG0, Package (0x0B)
                {
                    Zero, 
                    Zero, 
                    0x1040, 
                    0x40, 
                    0x16, 
                    0xC0, 
                    0x08, 
                    0xA0, 
                    0xFC4C0000, 
                    0x00100000, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PM01.PMIO.CFG0 */
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.PM01._DSM._T_0 */
                    If ((_T_0 == ToUUID ("4f248f40-d5e2-499f-834c-27758ea1cd3f") /* GPIO Controller */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (Package (0x02)
                                {
                                    0x40, 
                                    0x41
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    Break
                }
            }
        }

        Device (PM02)
        {
            Name (_HID, "QCOM2458")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMIC
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000DE,
                    }
                })
                Return (RBUF) /* \_SB_.PM02._CRS.RBUF */
            }

            Method (PMIO, 0, NotSerialized)
            {
                Name (CFG0, Package (0x0B)
                {
                    One, 
                    0x02, 
                    0x1040, 
                    0x40, 
                    0x0A, 
                    0xC0, 
                    0x04, 
                    0xA0, 
                    0xFC4C0000, 
                    0x00100000, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PM02.PMIO.CFG0 */
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.PM02._DSM._T_0 */
                    If ((_T_0 == ToUUID ("4f248f40-d5e2-499f-834c-27758ea1cd3f") /* GPIO Controller */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (Package (0x02)
                                {
                                    0x1001, 
                                    0x1002
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    Break
                }
            }
        }

        Device (PMBT)
        {
            Name (_HID, "QCOM2453")  // _HID: Hardware ID
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMIC
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0080
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0210
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0211
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0220
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x009C
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0087
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x020A
                        }
                    GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x020E
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x009D
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0098
                        }
                })
                Return (RBUF) /* \_SB_.PMBT._CRS.RBUF */
            }

            Method (BMNR, 0, NotSerialized)
            {
                Name (CFG0, Package (0x04)
                {
                    One, 
                    Zero, 
                    One, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PMBT.BMNR.CFG0 */
            }

            Method (BTIM, 0, NotSerialized)
            {
                Name (CFG0, Package (0x08)
                {
                    0x7530, 
                    0x2710, 
                    0x000493E0, 
                    0x0001D4C0, 
                    Zero, 
                    Zero, 
                    0x01AC7780, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PMBT.BTIM.CFG0 */
            }

            Method (BBAT, 0, NotSerialized)
            {
                Name (CFG0, Package (0x0D)
                {
                    One, 
                    0x4C494F4E, 
                    0x2CEC, 
                    0x2CEC, 
                    0x023F, 
                    0x040B, 
                    "QCOMBATT01", 
                    "Qualcomm", 
                    "QCOMBAT01_07012011", 
                    "07012011", 
                    0x13, 
                    0x04, 
                    0x07DE
                })
                Return (CFG0) /* \_SB_.PMBT.BBAT.CFG0 */
            }

            Method (BPCH, 0, NotSerialized)
            {
                Name (CFG0, Package (0x02)
                {
                    0x05DC, 
                    0x05DC
                })
                Return (CFG0) /* \_SB_.PMBT.BPCH.CFG0 */
            }

            Method (BCCC, 0, NotSerialized)
            {
                Name (CFG0, Package (0x03)
                {
                    One, 
                    Zero, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PMBT.BCCC.CFG0 */
            }

            Method (BRCH, 0, NotSerialized)
            {
                Name (CFG0, Package (0x02)
                {
                    0x64, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PMBT.BRCH.CFG0 */
            }

            Method (_BQI, 0, NotSerialized)
            {
                Name (CFG0, Package (0x01)
                {
                    Zero
                })
                Return (CFG0) /* \_SB_.PMBT._BQI.CFG0 */
            }

            Method (BIRQ, 0, NotSerialized)
            {
                Name (CFG0, Package (0x0A)
                {
                    "ChgError", 
                    "BclIrq1", 
                    "BclIrq2", 
                    "MEMIFaccess", 
                    "OtgOc", 
                    "TccReached", 
                    "VbatLow", 
                    "BattMissing", 
                    "AiclDone", 
                    "UsbUv"
                })
                Return (CFG0) /* \_SB_.PMBT.BIRQ.CFG0 */
            }

            Method (BPLT, 0, NotSerialized)
            {
                Name (CFG0, Package (0x25)
                {
                    0x03FC, 
                    0x0ED8, 
                    0x0DAC, 
                    0x0D48, 
                    0x0384, 
                    One, 
                    0x32, 
                    0x32, 
                    0x1388, 
                    0x08, 
                    One, 
                    0x50, 
                    0xFFFFFFEC, 
                    0x48, 
                    0x64, 
                    0x1E, 
                    0x05, 
                    0x06, 
                    0x01F4, 
                    0x7E, 
                    0x0190, 
                    0x1194, 
                    0x0BB8, 
                    0x012C, 
                    0x01F4, 
                    0x05DC, 
                    0x14, 
                    0x16, 
                    0x02EE, 
                    One, 
                    One, 
                    0x1068, 
                    0x32, 
                    One, 
                    Zero, 
                    Zero, 
                    One
                })
                Return (CFG0) /* \_SB_.PMBT.BPLT.CFG0 */
            }

            Method (BPTM, 0, NotSerialized)
            {
                Name (CFG0, Package (0x02)
                {
                    0x3A98, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PMBT.BPTM.CFG0 */
            }

            Method (BJTA, 0, NotSerialized)
            {
                Name (CFG0, Package (0x11)
                {
                    One, 
                    0x10FE, 
                    0x0834, 
                    Zero, 
                    0x3C, 
                    0x02, 
                    0x04, 
                    0x02, 
                    0x10FE, 
                    0x03E8, 
                    0x0A, 
                    0x1090, 
                    0x0834, 
                    0x2D, 
                    0x1054, 
                    0x0834, 
                    0x32
                })
                Return (CFG0) /* \_SB_.PMBT.BJTA.CFG0 */
            }

            Method (BTHM, 0, NotSerialized)
            {
                Name (CFG0, Package (0x07)
                {
                    0x0BB8, 
                    0x03E8, 
                    0x46, 
                    0x50, 
                    0x01F4, 
                    0x46, 
                    0x50
                })
                Return (CFG0) /* \_SB_.PMBT.BTHM.CFG0 */
            }

            Method (BEHC, 0, NotSerialized)
            {
                Name (CFG0, Package (0x08)
                {
                    One, 
                    0x08, 
                    One, 
                    One, 
                    0x02, 
                    0x02, 
                    0x02, 
                    0x08
                })
                Return (CFG0) /* \_SB_.PMBT.BEHC.CFG0 */
            }

            Method (CTMC, 0, NotSerialized)
            {
                Name (CFG0, Package (0x07)
                {
                    Zero, 
                    0x36B0, 
                    0x4A38, 
                    0x000222E0, 
                    0x0003A980, 
                    0x0006DDD0, 
                    One
                })
                Return (CFG0) /* \_SB_.PMBT.CTMC.CFG0 */
            }

            Method (BCT1, 0, NotSerialized)
            {
                Name (CFG0, Package (0x15)
                {
                    Zero, 
                    0xFFFFFFEC, 
                    0x50, 
                    Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    One, 
                    0x10FE, 
                    0x0834, 
                    Zero, 
                    0x3C, 
                    0x02, 
                    0x04, 
                    0x02, 
                    0x10FE, 
                    0x03E8, 
                    0x0A, 
                    0x1090, 
                    0x0834, 
                    0x2D, 
                    0x1054, 
                    0x0834, 
                    0x32
                })
                Return (CFG0) /* \_SB_.PMBT.BCT1.CFG0 */
            }
        }

        Device (PMBM)
        {
            Name (_HID, "QCOM2452")  // _HID: Hardware ID
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMBT
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.PMBM._CRS.RBUF */
            }
        }

        Device (PBTD)
        {
            Name (_HID, "QCOM24C3")  // _HID: Hardware ID
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMBT
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.PBTD._CRS.RBUF */
            }
        }

        Device (PMAP)
        {
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PMIC, 
                \_SB.ABD, 
                \_SB.SCM0
            })
            Name (_HID, "QCOM2457")  // _HID: Hardware ID
            Method (GEPT, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x04){})
                CreateByteField (BUFF, Zero, STAT)
                CreateWordField (BUFF, 0x02, DATA)
                DATA = 0x02
                Return (DATA) /* \_SB_.PMAP.GEPT.DATA */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x1000
                        }
                    GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x08
                        })
                        {   // Pin list
                            0x0EC2
                        }
                    GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x08
                        })
                        {   // Pin list
                            0x0EE2
                        }
                    GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x08
                        })
                        {   // Pin list
                            0x0EF1
                        }
                })
                Return (RBUF) /* \_SB_.PMAP._CRS.RBUF */
            }

            Method (_WFH, 0, NotSerialized)
            {
                Name (CFG0, Package (0x02)
                {
                    0x05, 
                    0x2710
                })
                Return (CFG0) /* \_SB_.PMAP._WFH.CFG0 */
            }

            Method (_IBB, 0, NotSerialized)
            {
                Name (CFG0, Package (0x02)
                {
                    0x05, 
                    0x2710
                })
                Return (CFG0) /* \_SB_.PMAP._IBB.CFG0 */
            }
        }

        Device (PRTC)
        {
            Name (_HID, "ACPI000E" /* Time and Alarm Device */)  // _HID: Hardware ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                "\\_SB.PMAP"
            })
            Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
            {
                Return (0x05)
            }

            Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
            {
                Connection (
                    I2cSerialBusV2 (0x0002, ControllerInitiated, 0x00000000,
                        AddressingMode7Bit, "\\_SB.ABD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                ), 
                AccessAs (BufferAcc, AttribRawBytes (0x18)), 
                FLD0,   192
            }

            Method (_GRT, 0, NotSerialized)  // _GRT: Get Real Time
            {
                Name (BUFF, Buffer (0x1A){})
                CreateField (BUFF, 0x10, 0x80, TME1)
                CreateField (BUFF, 0x90, 0x20, ACT1)
                CreateField (BUFF, 0xB0, 0x20, ACW1)
                BUFF = FLD0 /* \_SB_.PRTC.FLD0 */
                Return (TME1) /* \_SB_.PRTC._GRT.TME1 */
            }

            Method (_TIV, 0, NotSerialized)  // _TIV: Timer Values
            {
                Name (BUFF, Buffer (0x1A){})
                CreateField (BUFF, 0x10, 0x80, TME1)
                CreateField (BUFF, 0x90, 0x20, ACT1)
                CreateField (BUFF, 0xB0, 0x20, ACW1)
                BUFF = FLD0 /* \_SB_.PRTC.FLD0 */
                Return (ACT1) /* \_SB_.PRTC._TIV.ACT1 */
            }

            Method (_GWS, 0, NotSerialized)  // _GWS: Get Wake Status
            {
                Name (BUFF, Buffer (0x1A){})
                CreateField (BUFF, 0x10, 0x80, TME1)
                CreateField (BUFF, 0x90, 0x20, ACT1)
                CreateField (BUFF, 0xB0, 0x20, ACW1)
                BUFF = FLD0 /* \_SB_.PRTC.FLD0 */
                Return (ACW1) /* \_SB_.PRTC._GWS.ACW1 */
            }

            Method (_STV, 2, NotSerialized)  // _STV: Set Timer Value
            {
                If ((Arg0 == Zero))
                {
                    Name (BUFF, Buffer (0x32){})
                    CreateByteField (BUFF, Zero, STAT)
                    CreateField (BUFF, 0x10, 0x80, TME1)
                    CreateField (BUFF, 0x90, 0x20, ACT1)
                    CreateField (BUFF, 0xB0, 0x20, ACW1)
                    ACT1 = Arg1
                    TME1 = Zero
                    ACW1 = Zero
                    BUFF = FLD0 = BUFF /* \_SB_.PRTC._STV.BUFF */
                    If ((STAT != Zero))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Return (One)
            }

            Method (_SRT, 1, NotSerialized)  // _SRT: Set Real Time
            {
                Name (BUFF, Buffer (0x32){})
                CreateByteField (BUFF, Zero, STAT)
                CreateField (BUFF, 0x10, 0x80, TME1)
                CreateField (BUFF, 0x90, 0x20, ACT1)
                CreateField (BUFF, 0xB0, 0x20, ACW1)
                ACT1 = Zero
                TME1 = Arg0
                ACW1 = Zero
                BUFF = FLD0 = BUFF /* \_SB_.PRTC._SRT.BUFF */
                If ((STAT != Zero))
                {
                    Return (One)
                }

                Return (Zero)
            }

            Method (_CWS, 1, NotSerialized)  // _CWS: Clear Wake Alarm Status
            {
                Name (BUFF, Buffer (0x32){})
                CreateByteField (BUFF, Zero, STAT)
                CreateField (BUFF, 0x10, 0x80, TME1)
                CreateField (BUFF, 0x90, 0x20, ACT1)
                CreateField (BUFF, 0xB0, 0x20, ACW1)
                ACT1 = Zero
                TME1 = Zero
                ACW1 = Arg0
                BUFF = FLD0 = BUFF /* \_SB_.PRTC._CWS.BUFF */
                If ((STAT != Zero))
                {
                    Return (One)
                }

                Return (Zero)
            }
        }

        Device (PMPB)
        {
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PMIC, 
                \_SB.PM02, 
                \_SB.SPMI
            })
            Name (_HID, "QCOM2459")  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (INTB, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00D9
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00DC
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM02", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00DD
                        }
                })
                Name (NAM, Buffer (0x0A)
                {
                    "\\_SB.SPMI"
                })
                Name (BSIB, Buffer (0x0C)
                {
                    /* 0000 */  0x8E, 0x13, 0x00, 0x01, 0x00, 0xC1, 0x02, 0x02,  // ........
                    /* 0008 */  0x1B, 0x01, 0x00, 0x00                           // ....
                })
                Name (END, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Concatenate (BSIB, NAM, Local1)
                Concatenate (Local1, INTB, Local0)
                Return (Local0)
            }

            Method (MPCF, 0, NotSerialized)
            {
                Name (CFG0, Package (0x05)
                {
                    One, 
                    0x11, 
                    Zero, 
                    Zero, 
                    0x08
                })
                Return (CFG0) /* \_SB_.PMPB.MPCF.CFG0 */
            }
        }

        Device (PMBD)
        {
            Name (_HID, "QCOM24C2")  // _HID: Hardware ID
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMPB
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.PMBD._CRS.RBUF */
            }
        }

        Device (PBAD)
        {
            Name (_HID, "QCOM24C4")  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.PBAD._CRS.RBUF */
            }
        }

        Device (BAM0)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF9984000,         // Address Base
                        0x00015000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000007E,
                    }
                })
                Return (RBUF) /* \_SB_.BAM0._CRS.RBUF */
            }
        }

        Device (BAM1)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFD404000,         // Address Base
                        0x00009000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000EF,
                    }
                })
                Return (RBUF) /* \_SB_.BAM1._CRS.RBUF */
            }
        }

        Device (BAM2)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFD444000,         // Address Base
                        0x00009000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000010C,
                    }
                })
                Return (RBUF) /* \_SB_.BAM2._CRS.RBUF */
            }
        }

        Device (BAM3)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF9904000,         // Address Base
                        0x00019000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000010E,
                    }
                })
                Return (RBUF) /* \_SB_.BAM3._CRS.RBUF */
            }
        }

        Device (BAM4)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF9944000,         // Address Base
                        0x00019000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000010F,
                    }
                })
                Return (RBUF) /* \_SB_.BAM4._CRS.RBUF */
            }
        }

        Device (BAM5)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFE184000,         // Address Base
                        0x00014000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000144,
                    }
                })
                Return (RBUF) /* \_SB_.BAM5._CRS.RBUF */
            }
        }

        Device (BAM6)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFE104000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000C4,
                    }
                })
                Return (RBUF) /* \_SB_.BAM6._CRS.RBUF */
            }
        }

        Device (BAM7)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF99C4000,         // Address Base
                        0x00011000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000009A,
                    }
                })
                Return (RBUF) /* \_SB_.BAM7._CRS.RBUF */
            }
        }

        Device (BAM8)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFD3C4000,         // Address Base
                        0x00009000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000149,
                    }
                })
                Return (RBUF) /* \_SB_.BAM8._CRS.RBUF */
            }
        }

        Device (BAMC)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x0C)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF9A44000,         // Address Base
                        0x00011000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000A7,
                    }
                })
                Return (RBUF) /* \_SB_.BAMC._CRS.RBUF */
            }
        }

        Device (BAMD)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x0D)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF9304000,         // Address Base
                        0x00009000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000A4,
                    }
                })
                Return (RBUF) /* \_SB_.BAMD._CRS.RBUF */
            }
        }

        Device (BAME)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x0E)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFD4C4000,         // Address Base
                        0x00015000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000014C,
                    }
                })
                Return (RBUF) /* \_SB_.BAME._CRS.RBUF */
            }
        }

        Device (I2C2)
        {
            Name (_HID, "QCOM240E")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.BAM3
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF9924000,         // Address Base
                        0x00000800,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000060,
                    }
                })
                Return (RBUF) /* \_SB_.I2C2._CRS.RBUF */
            }

            Method (FNOC, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x02, 0x01, 0x00, 0x40, 0x90, 0xF9, 0x0F, 0x0E,  // ...@....
                    /* 0008 */  0x00, 0x04, 0x00, 0xF8, 0x24, 0x01               // ....$.
                })
                Return (RBUF) /* \_SB_.I2C2.FNOC.RBUF */
            }
        }

        Device (SCM0)
        {
            Name (_HID, "QCOM2402")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (GCFG, 0, NotSerialized)
            {
                Return (0x0100)
            }
        }

        Device (TREE)
        {
            Name (_HID, "QCOM24BA")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (SPMI)
        {
            Name (_HID, "QCOM2404")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFC4C0000,         // Address Base
                        0x00100000,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.SPMI._CRS.RBUF */
            }

            Method (CONF, 0, NotSerialized)
            {
                Name (XBUF, Buffer (0x02)
                {
                     0x00, 0x01                                       // ..
                })
                Return (XBUF) /* \_SB_.SPMI.CONF.XBUF */
            }
        }

        Device (GIO0)
        {
            Name (_HID, "QCOM2405")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFD510000,         // Address Base
                        0x00002000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000F0,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000F0,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000F0,
                    }
                })
                Return (RBUF) /* \_SB_.GIO0._CRS.RBUF */
            }

            Method (OFNI, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x92, 0x00                                       // ..
                })
                Return (RBUF) /* \_SB_.GIO0.OFNI.RBUF */
            }

            Name (AVBL, Zero)
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x08))
                {
                    AVBL = Arg1
                }
            }
        }

        Device (SMD0)
        {
            Name (_HID, "QCOM2407")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x06A00000,         // Address Base
                        0x00200000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFD484000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFE805FF0,         // Address Base
                        0x00000010,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFC428000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xF900D008,         // Address Base
                        0x00000004,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000039,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000BC,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000003B,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000BE,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000003A,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000BD,
                    }
                })
                Return (RBUF) /* \_SB_.SMD0._CRS.RBUF */
            }

            Method (INTR, 0, NotSerialized)
            {
                Name (RBUF, Package (0x1C)
                {
                    0x03, 
                    0x02, 
                    0x02, 
                    0x02, 
                    One, 
                    0xF900D008, 
                    0x1000, 
                    Zero, 
                    0x02, 
                    0xF900D008, 
                    0x0100, 
                    Zero, 
                    One, 
                    0xF900D008, 
                    0x4000, 
                    Zero, 
                    0x02, 
                    0xF900D008, 
                    0x0400, 
                    Zero, 
                    One, 
                    0xF900D008, 
                    0x2000, 
                    Zero, 
                    0x02, 
                    0xF900D008, 
                    0x0200, 
                    Zero
                })
                Return (RBUF) /* \_SB_.SMD0.INTR.RBUF */
            }
        }

        Device (CPU0)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (CPU1)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
        }

        Device (CPU2)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
        }

        Device (CPU3)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
        }

        Device (CPU4)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
        }

        Device (CPU5)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
        }

        Device (TSC1)
        {
            Name (_HID, "QCOM2418")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0020, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2C2",
                        0x00, ResourceConsumer, , Exclusive,
                        RawDataBuffer (0x08)  // Vendor Data
                        {
                            0x50, 0xC3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                    GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0016
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0008
                        }
                })
                Return (RBUF) /* \_SB_.TSC1._CRS.RBUF */
            }
        }

        Device (BTNS)
        {
            Name (_HID, "ACPI0011" /* Generic Buttons Device */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveBoth, Exclusive, PullDown, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0040
                        }
                    GpioInt (Edge, ActiveBoth, SharedAndWake, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x03)  // Vendor Data
                        {
                            0x40, 0x40, 0x40
                        })
                        {   // Pin list
                            0x0610
                        }
                    GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0041
                        }
                })
                Return (RBUF) /* \_SB_.BTNS._CRS.RBUF */
            }

            Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
            {
                ToUUID ("fa6bd625-9ce8-470d-a2c7-b3ca36c4282e") /* Generic Buttons Device */, 
                Package (0x04)
                {
                    Package (0x05)
                    {
                        Zero, 
                        One, 
                        Zero, 
                        One, 
                        0x0D
                    }, 

                    Package (0x05)
                    {
                        One, 
                        Zero, 
                        One, 
                        One, 
                        0x81
                    }, 

                    Package (0x05)
                    {
                        One, 
                        One, 
                        One, 
                        0x0C, 
                        0xE9
                    }, 

                    Package (0x05)
                    {
                        One, 
                        0x02, 
                        One, 
                        0x0C, 
                        0xEA
                    }
                }
            })
        }

        Device (LNK0)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (LNK1)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
        }

        Device (LNK2)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
        }

        Device (LNK3)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
        }

        Device (LNK4)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
        }

        Device (LNK5)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
        }

        Device (LNK6)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
        }

        Device (LNK7)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
        }

        Device (LNK8)
        {
            Name (_HID, "QCOM24A7")  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
        }
    }
}


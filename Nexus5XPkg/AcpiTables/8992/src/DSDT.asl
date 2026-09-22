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
 *     Length           0x0000C831 (51249)
 *     Revision         0x02
 *     Checksum         0xF0
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
        Name (SIDV, 0x00010000)
        Name (SVMJ, One)
        Name (SVMI, Zero)
        Name (SDFE, 0x39)
        Name (SFES, "899200000000000")
        Name (SIDM, 0xFFFF00FF)
        Name (SSBV, One)
        Name (SSBS, "899200000000000")
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
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
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

        Device (PEP0)
        {
            Name (_HID, "QCOM2425")  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, ,, )
                {
                    0x000000D8,
                }
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                {
                    0x000000C8,
                }
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                {
                    0x000000C9,
                }
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                {
                    0x000000CB,
                }
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                {
                    0x00000030,
                }
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                {
                    0x00000033,
                }
                Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, ,, )
                {
                    0x000000D7,
                }
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                {
                    0x0000016C,
                }
            })
            Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
            {
                Connection (
                    I2cSerialBusV2 (0x0001, ControllerInitiated, 0x00000000,
                        AddressingMode7Bit, "\\_SB.ABD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                ), 
                AccessAs (BufferAcc, AttribRawBytes (0x15)), 
                FLD0,   168
            }

            Method (GEPT, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x04){})
                CreateByteField (BUFF, Zero, STAT)
                CreateWordField (BUFF, 0x02, DATA)
                DATA = One
                Return (DATA) /* \_SB_.PEP0.GEPT.DATA */
            }

            Name (ROST, Zero)
            Method (NPUR, 1, NotSerialized)
            {
            }

            Method (INTR, 0, NotSerialized)
            {
                Name (RBUF, Package (0x18)
                {
                    0x02, 
                    One, 
                    0x03, 
                    One, 
                    0x06, 
                    0xF900D008, 
                    One, 
                    Zero, 
                    0x06A00000, 
                    0x00200000, 
                    Zero, 
                    Zero, 
                    0xFC428000, 
                    0x4000, 
                    Zero, 
                    Zero, 
                    0xFE802FF0, 
                    0x10, 
                    Zero, 
                    Zero, 
                    0xF900D008, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (RBUF) /* \_SB_.PEP0.INTR.RBUF */
            }

            Method (CRTC, 0, NotSerialized)
            {
                Return (CTRX) /* \_SB_.PEP0.CTRX */
            }

            Name (CTRX, Package (0x09)
            {
                "MMVD", 
                "DSGP", 
                "NCDA", 
                "CCGP", 
                "MTPS", 
                "CPGP", 
                "DMPP", 
                "GBDL", 
                "SRDL"
            })
            Method (STND, 0, NotSerialized)
            {
                Return (STNX) /* \_SB_.PEP0.STNX */
            }

            Name (STNX, Package (0x14)
            {
                "DMCO", 
                "DMPA", 
                "DMPC", 
                "DMPB", 
                "DMSB", 
                "DMPG", 
                "DMPS", 
                "DMRC", 
                "DMPL", 
                "DMTB", 
                "DMDQ", 
                "DMMT", 
                "DMPI", 
                "DMWE", 
                "DMHC", 
                "XMPC", 
                "XMPL", 
                "XMPN", 
                "XMID", 
                "XMHC"
            })
            Method (ADCN, 0, NotSerialized)
            {
                Return (VADL) /* \_SB_.PEP0.VADL */
            }

            Name (VADL, Package (0x08)
            {
                "SYS_THERM1", 
                "SYS_THERM2", 
                "PA_THERM", 
                "PA_THERM1", 
                "SYS_THERM3", 
                "PMIC_THERM", 
                "VPH_PWR", 
                "USB_ID"
            })
            Method (CTPM, 0, NotSerialized)
            {
                Name (CTPN, Package (0x03)
                {
                    "CORE_TOPOLOGY", 
                    0x04, 
                    0x02
                })
                Return (CTPN) /* \_SB_.PEP0.CTPM.CTPN */
            }

            Name (CCFG, Package (0x06)
            {
                Package (0x02)
                {
                    "\\_SB.CPU0", 
                    0x10
                }, 

                Package (0x02)
                {
                    "\\_SB.CPU1", 
                    0x11
                }, 

                Package (0x02)
                {
                    "\\_SB.CPU2", 
                    0x12
                }, 

                Package (0x02)
                {
                    "\\_SB.CPU3", 
                    0x13
                }, 

                Package (0x02)
                {
                    "\\_SB.CPU4", 
                    0x14
                }, 

                Package (0x02)
                {
                    "\\_SB.CPU5", 
                    0x15
                }
            })
            Method (PGCC, 0, NotSerialized)
            {
                Return (CCFG) /* \_SB_.PEP0.CCFG */
            }

            Name (DCVS, Zero)
            Method (PGDS, 0, NotSerialized)
            {
                Return (DCVS) /* \_SB_.PEP0.DCVS */
            }

            Name (PPPP, Package (0x4E)
            {
                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS2_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS3_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS4_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS5_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS6_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS7_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS8_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS9_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS10_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS11_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS12_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS1_B", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS2_B", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_SMPS3_B", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_BOOST1_B", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_BOOST_BYPASS1_B", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO2_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO3_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO4_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO5_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO6_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO7_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO8_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO9_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO10_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO11_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO12_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO13_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO14_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO15_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO16_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO17_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO18_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO19_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO20_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO21_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO22_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO23_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO24_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO25_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO26_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO27_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO28_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO29_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO30_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO31_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO32_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LDO1_B", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LVS1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_LVS2_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK3_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK3_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_DIFFCLK1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_CLK_DIST_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_SLEEPCLK1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK2_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK3_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_CXO_CLOCK_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_PMIC_GPIO_DV2", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_PMIC_GPIO_DV3", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_PMIC_MPP_DV1", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_PMIC_MPP_DV2", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_PMIC_MPP_DV3", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_TLMM_GPIO_DV1", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_TLMM_GPIO_DV2", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_TLMM_GPIO_DV3", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_DIV_CLK_1_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_DIV_CLK_2_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_DIV_CLK_3_A", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                    "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
                }
            })
            Method (PPPM, 0, NotSerialized)
            {
                Return (PPPP) /* \_SB_.PEP0.PPPP */
            }

            Name (PRRP, Package (0x27)
            {
                "PPP_RESOURCE_RANGE_INFO_SMPS_A", 
                "PPP_RESOURCE_ID_SMPS1_A", 
                "PPP_RESOURCE_ID_SMPS12_A", 
                "PPP_RESOURCE_RANGE_INFO_SMPS_B", 
                "PPP_RESOURCE_ID_SMPS1_B", 
                "PPP_RESOURCE_ID_SMPS3_B", 
                "PPP_RESOURCE_RANGE_INFO_BOOST_B", 
                "PPP_RESOURCE_ID_BOOST1_B", 
                "PPP_RESOURCE_ID_BOOST1_B", 
                "PPP_RESOURCE_RANGE_INFO_BOOST_BYPASS_B", 
                "PPP_RESOURCE_ID_BOOST_BYPASS1_B", 
                "PPP_RESOURCE_ID_BOOST_BYPASS1_B", 
                "PPP_RESOURCE_RANGE_INFO_LDO_A", 
                "PPP_RESOURCE_ID_LDO1_A", 
                "PPP_RESOURCE_ID_LDO32_A", 
                "PPP_RESOURCE_RANGE_INFO_LDO_B", 
                "PPP_RESOURCE_ID_LDO1_B", 
                "PPP_RESOURCE_ID_LDO1_B", 
                "PPP_RESOURCE_RANGE_INFO_LVS_A", 
                "PPP_RESOURCE_ID_LVS1_A", 
                "PPP_RESOURCE_ID_LVS2_A", 
                "PPP_RESOURCE_RANGE_INFO_CXO_BUFFERS_A", 
                "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK1_A", 
                "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK3_A", 
                "PPP_RESOURCE_RANGE_INFO_CXO_CLOCK_A", 
                "PPP_RESOURCE_ID_CXO_CLOCK_A", 
                "PPP_RESOURCE_ID_CXO_CLOCK_A", 
                "PPP_RESOURCE_RANGE_INFO_PMIC_GPIO_DV", 
                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                "PPP_RESOURCE_ID_PMIC_GPIO_DV3", 
                "PPP_RESOURCE_RANGE_INFO_PMIC_MPP_DV", 
                "PPP_RESOURCE_ID_PMIC_MPP_DV1", 
                "PPP_RESOURCE_ID_PMIC_MPP_DV3", 
                "PPP_RESOURCE_RANGE_INFO_TLMM_GPIO_DV", 
                "PPP_RESOURCE_ID_TLMM_GPIO_DV1", 
                "PPP_RESOURCE_ID_TLMM_GPIO_DV3", 
                "PPP_RESOURCE_RANGE_INFO_DIV_CLK_A", 
                "PPP_RESOURCE_ID_DIV_CLK_1_A", 
                "PPP_RESOURCE_ID_DIV_CLK_3_A"
            })
            Method (PPRR, 0, NotSerialized)
            {
                Return (PRRP) /* \_SB_.PEP0.PRRP */
            }

            Method (PGSD, 0, NotSerialized)
            {
                Return (SDFR) /* \_SB_.PEP0.SDFR */
            }

            Name (FPDP, Zero)
            Method (FPMD, 0, NotSerialized)
            {
                Return (FPDP) /* \_SB_.PEP0.FPDP */
            }

            Name (PPPC, Zero)
            Method (PGPC, 0, NotSerialized)
            {
                Return (PPPC) /* \_SB_.PEP0.PPPC */
            }

            Name (CPRD, Package (0x02)
            {
                Package (0x05)
                {
                    Package (0x02)
                    {
                        "info", 
                        "CPR ACPI config table"
                    }, 

                    Package (0x02)
                    {
                        "chip_id", 
                        0xFB
                    }, 

                    Package (0x02)
                    {
                        "chip_version", 
                        One
                    }, 

                    Package (0x15)
                    {
                        Package (0x02)
                        {
                            "instance_num", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "num_clients", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "apc_rail_name", 
                            "/vdd/apc0"
                        }, 

                        Package (0x02)
                        {
                            "measurement_period_ms", 
                            0x05
                        }, 

                        Package (0x02)
                        {
                            "step_quotient", 
                            0x10
                        }, 

                        Package (0x02)
                        {
                            "max_pmic_step_up", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "max_pmic_step_dn", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "pmic_step_size", 
                            0x1388
                        }, 

                        Package (0x02)
                        {
                            "up_threshold", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "dn_threshold", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "consecutive_up", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "consecutive_dn", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "clamp_timer_interval", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "rbcpr_base_addr", 
                            0xF9019000
                        }, 

                        Package (0x02)
                        {
                            "rbcpr_size", 
                            0x0164
                        }, 

                        Package (0x02)
                        {
                            "security_control_base_addr", 
                            0xFC4B8000
                        }, 

                        Package (0x02)
                        {
                            "security_control_size", 
                            0x8000
                        }, 

                        Package (0x02)
                        {
                            "target_quotient_multiplier", 
                            0x0A
                        }, 

                        Package (0x02)
                        {
                            "quotient_offset_multiplier", 
                            0x0A
                        }, 

                        Package (0x02)
                        {
                            "hw_errata_flag", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "workitem_affinity", 
                            0x0F
                        }
                    }, 

                    Package (0x15)
                    {
                        Package (0x02)
                        {
                            "instance_num", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "num_clients", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "apc_rail_name", 
                            "/vdd/apc1"
                        }, 

                        Package (0x02)
                        {
                            "measurement_period_ms", 
                            0x05
                        }, 

                        Package (0x02)
                        {
                            "step_quotient", 
                            0x0A
                        }, 

                        Package (0x02)
                        {
                            "max_pmic_step_up", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "max_pmic_step_dn", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "pmic_step_size", 
                            0x1388
                        }, 

                        Package (0x02)
                        {
                            "up_threshold", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "dn_threshold", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "consecutive_up", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "consecutive_dn", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "clamp_timer_interval", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "rbcpr_base_addr", 
                            0xF901A000
                        }, 

                        Package (0x02)
                        {
                            "rbcpr_size", 
                            0x0164
                        }, 

                        Package (0x02)
                        {
                            "security_control_base_addr", 
                            0xFC4B8000
                        }, 

                        Package (0x02)
                        {
                            "security_control_size", 
                            0x8000
                        }, 

                        Package (0x02)
                        {
                            "target_quotient_multiplier", 
                            0x0A
                        }, 

                        Package (0x02)
                        {
                            "quotient_offset_multiplier", 
                            0x0A
                        }, 

                        Package (0x02)
                        {
                            "hw_errata_flag", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "workitem_affinity", 
                            0xF0
                        }
                    }
                }, 

                Package (0x05)
                {
                    Package (0x02)
                    {
                        "info", 
                        "CPR ACPI config table"
                    }, 

                    Package (0x02)
                    {
                        "chip_id", 
                        0xFB
                    }, 

                    Package (0x02)
                    {
                        "chip_version", 
                        0x02
                    }, 

                    Package (0x15)
                    {
                        Package (0x02)
                        {
                            "instance_num", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "num_clients", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "apc_rail_name", 
                            "/vdd/apc0"
                        }, 

                        Package (0x02)
                        {
                            "measurement_period_ms", 
                            0x05
                        }, 

                        Package (0x02)
                        {
                            "step_quotient", 
                            0x0C
                        }, 

                        Package (0x02)
                        {
                            "max_pmic_step_up", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "max_pmic_step_dn", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "pmic_step_size", 
                            0x1388
                        }, 

                        Package (0x02)
                        {
                            "up_threshold", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "dn_threshold", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "consecutive_up", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "consecutive_dn", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "clamp_timer_interval", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "rbcpr_base_addr", 
                            0xF9019000
                        }, 

                        Package (0x02)
                        {
                            "rbcpr_size", 
                            0x0164
                        }, 

                        Package (0x02)
                        {
                            "security_control_base_addr", 
                            0xFC4B8000
                        }, 

                        Package (0x02)
                        {
                            "security_control_size", 
                            0x8000
                        }, 

                        Package (0x02)
                        {
                            "target_quotient_multiplier", 
                            0x0A
                        }, 

                        Package (0x02)
                        {
                            "quotient_offset_multiplier", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "hw_errata_flag", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "workitem_affinity", 
                            0x0F
                        }
                    }, 

                    Package (0x15)
                    {
                        Package (0x02)
                        {
                            "instance_num", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "num_clients", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "apc_rail_name", 
                            "/vdd/apc1"
                        }, 

                        Package (0x02)
                        {
                            "measurement_period_ms", 
                            0x05
                        }, 

                        Package (0x02)
                        {
                            "step_quotient", 
                            0x0C
                        }, 

                        Package (0x02)
                        {
                            "max_pmic_step_up", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "max_pmic_step_dn", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "pmic_step_size", 
                            0x1388
                        }, 

                        Package (0x02)
                        {
                            "up_threshold", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "dn_threshold", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "consecutive_up", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "consecutive_dn", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "clamp_timer_interval", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "rbcpr_base_addr", 
                            0xF901A000
                        }, 

                        Package (0x02)
                        {
                            "rbcpr_size", 
                            0x0164
                        }, 

                        Package (0x02)
                        {
                            "security_control_base_addr", 
                            0xFC4B8000
                        }, 

                        Package (0x02)
                        {
                            "security_control_size", 
                            0x8000
                        }, 

                        Package (0x02)
                        {
                            "target_quotient_multiplier", 
                            0x0A
                        }, 

                        Package (0x02)
                        {
                            "quotient_offset_multiplier", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "hw_errata_flag", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "workitem_affinity", 
                            0xF0
                        }
                    }
                }
            })
            Method (CPUS, 0, NotSerialized)
            {
                Name (PKGG, Package (0x02)
                {
                    "000000000", 
                    "000000000"
                })
                PKGG [Zero] = NCPU /* \_SB_.NCPU */
                PKGG [One] = PSCI /* \_SB_.PSCI */
                Return (PKGG) /* \_SB_.PEP0.CPUS.PKGG */
            }

            Method (CPRM, 0, NotSerialized)
            {
                Return (CPRD) /* \_SB_.PEP0.CPRD */
            }
        }

        Scope (\_SB.PEP0)
        {
            Method (LMPM, 0, NotSerialized)
            {
                Return (NMPM) /* \_SB_.PEP0.NMPM */
            }

            Name (NMPM, Package (0x02)
            {
                Package (0x02)
                {
                    "MPM_SCALAR_CONFIG", 
                    Package (0x05)
                    {
                        0xFC428000, 
                        0x4000, 
                        0xF900D000, 
                        0x1000, 
                        0x01D0
                    }
                }, 

                Package (0x02)
                {
                    "MPM_INTERRUPT_CONFIG", 
                    Package (0x09)
                    {
                        Package (0x04)
                        {
                            0x30, 
                            0xAC, 
                            Zero, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x31, 
                            0xAC, 
                            Zero, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x3A, 
                            0xAC, 
                            Zero, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x32, 
                            0x9B, 
                            Zero, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x33, 
                            0x9C, 
                            Zero, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x38, 
                            0x9D, 
                            Zero, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x39, 
                            0x9E, 
                            Zero, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x0D, 
                            0x25, 
                            One, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x3E, 
                            0xDE, 
                            Zero, 
                            0x04
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LSPM, 0, NotSerialized)
            {
                Return (NSPM) /* \_SB_.PEP0.NSPM */
            }

            Name (NSPM, Package (0x07)
            {
                "SPM_CONFIG", 
                0x0B, 
                0x03, 
                Package (0x04)
                {
                    "SPM_CLUSTER_CONFIG", 
                    0x05, 
                    0x05, 
                    One
                }, 

                Package (0x0C)
                {
                    "SPM_PHYS_CONFIG", 
                    0xF9089000, 
                    0xF9099000, 
                    0xF90A9000, 
                    0xF90B9000, 
                    0xF9012000, 
                    0xF90C9000, 
                    0xF90D9000, 
                    0xF90E9000, 
                    0xF90F9000, 
                    0xF9013000, 
                    0xF9065000
                }, 

                Package (0x0C)
                {
                    "SPM_QCHANNEL_CONFIG", 
                    0xF908B060, 
                    0xF909B060, 
                    0xF90AB060, 
                    0xF90BB060, 
                    0xF900D210, 
                    0xF90CB060, 
                    0xF90DB060, 
                    0xF90EB060, 
                    0xF90FB060, 
                    0xF900F210, 
                    Zero
                }, 

                Package (0x04)
                {
                    "SPM_GLB_CONFIG", 
                    0xF900D000, 
                    0xF900F000, 
                    0xF900D000
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LVDD, 0, NotSerialized)
            {
                Return (NVDD) /* \_SB_.PEP0.NVDD */
            }

            Name (NVDD, Package (0x03)
            {
                Package (0x02)
                {
                    "PEP_VDD_CX", 
                    Package (0x0B)
                    {
                        "PPP_RESOURCE_ID_SMPS1_A", 
                        0x02, 
                        0x07, 
                        0x04, 
                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x02, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x03, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x04, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x06, 
                            Zero
                        }
                    }
                }, 

                Package (0x02)
                {
                    "PEP_VDD_MX", 
                    Package (0x0B)
                    {
                        "PPP_RESOURCE_ID_SMPS2_A", 
                        0x02, 
                        0x07, 
                        0x06, 
                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x02, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x03, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x04, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x06, 
                            Zero
                        }
                    }
                }, 

                Package (0x02)
                {
                    "PEP_VDD_HFPLL1", 
                    Package (0x07)
                    {
                        "PPP_RESOURCE_ID_SMPS12_A", 
                        0x02, 
                        0x03, 
                        One, 
                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            0x0010C8E0, 
                            0x0FA0, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            0x0010C8E0, 
                            0x2328, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Name (DVMP, Package (0x02)
            {
                Package (0x04)
                {
                    "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                    "PPP_RESOURCE_TYPE_DISCRETE_PMIC_GPIO", 
                    Package (0x02)
                    {
                        "PM_DISCRETE_VREG_STATE_ON", 
                        Package (0x0A)
                        {
                            Zero, 
                            0x08, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            0x05
                        }
                    }, 

                    Package (0x02)
                    {
                        "PM_DISCRETE_VREG_STATE_OFF", 
                        Package (0x0A)
                        {
                            Zero, 
                            0x08, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            0x05
                        }
                    }
                }, 

                Package (0x04)
                {
                    "PPP_RESOURCE_ID_PMIC_MPP_DV1", 
                    "PPP_RESOURCE_TYPE_DISCRETE_PMIC_MPP", 
                    Package (0x02)
                    {
                        "PM_DISCRETE_VREG_STATE_ON", 
                        Package (0x06)
                        {
                            Zero, 
                            0x03, 
                            Zero, 
                            0x02, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PM_DISCRETE_VREG_STATE_OFF", 
                        Package (0x06)
                        {
                            Zero, 
                            0x03, 
                            Zero, 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }
                }
            })
            Method (DVMM, 0, NotSerialized)
            {
                Return (DVMP) /* \_SB_.PEP0.DVMP */
            }
        }

        Scope (\_SB.PEP0)
        {
            Method (LDBG, 0, NotSerialized)
            {
                Return (NDBG) /* \_SB_.PEP0.NDBG */
            }

            Name (NDBG, Package (0x04)
            {
                "DEBUGGERS", 
                Package (0x05)
                {
                    "TYPE", 
                    "SERIAL", 
                    Package (0x02)
                    {
                        "INSTANCES", 
                        "\\_SB.UAR1"
                    }, 

                    Package (0x04)
                    {
                        "DEBUG_ON", 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_blsp1_uart2_apps_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_blsp1_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_blsp1_ahb_clk", 
                                0x09, 
                                0x0C
                            }
                        }
                    }, 

                    Package (0x01)
                    {
                        "DEBUG_OFF"
                    }
                }, 

                Package (0x06)
                {
                    "TYPE", 
                    "USB2.0", 
                    Package (0x03)
                    {
                        "DEBUG_INSTANCES", 
                        "\\_SB.URS0", 
                        "\\_SB.UFN1"
                    }, 

                    Package (0x02)
                    {
                        "DRIVER_INSTANCES", 
                        "\\_SB.UFN1"
                    }, 

                    Package (0x09)
                    {
                        "DEBUG_ON", 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/pnoc", 
                                0x000186A0
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb_hs_system_clk", 
                                0x08, 
                                0x3C, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_hs_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB_HS1", 
                                "ICBID_SLAVE_EBI1", 
                                0x5DC00000, 
                                0x03C00000
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x002EEBB8, 
                                0x16A8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                0x48A8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x0C)
                    {
                        "DEBUG_OFF", 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb_hs_system_clk", 
                                0x08, 
                                0x3C, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_hs_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/pnoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_hs_system_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_hs_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB_HS1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x002EEBB8, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "TYPE", 
                    "USB3.0", 
                    Package (0x02)
                    {
                        "INSTANCES", 
                        "\\_SB.NULL"
                    }, 

                    Package (0x01)
                    {
                        "DEBUG_ON"
                    }, 

                    Package (0x01)
                    {
                        "DEBUG_OFF"
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LDRS, 0, NotSerialized)
            {
                Return (NDRS) /* \_SB_.PEP0.NDRS */
            }

            Name (NDRS, Package (0x05)
            {
                "DEFAULT_RESOURCES", 
                Package (0x04)
                {
                    "OPTIMIZATION", 
                    "CRYPTO_OFF", 
                    "BOOT", 
                    Package (0x07)
                    {
                        "RESOURCES", 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/ce1", 
                                0x64
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/ce2", 
                                0x64
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/ce3", 
                                0x64
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/ce3", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/ce2", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/ce1", 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "WORKAROUND", 
                    "PNOC_DEFAULT_ON", 
                    "BOOT", 
                    Package (0x02)
                    {
                        "RESOURCES", 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/pnoc", 
                                One
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "OPTIMIZATION", 
                    "PCIE0_OFF", 
                    "BOOT", 
                    Package (0x03)
                    {
                        "RESOURCES", 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_PCIE_0", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_PCIE_0", 
                                0x02
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "OPTIMIZATION", 
                    "UFS_OFF", 
                    "BOOT", 
                    Package (0x05)
                    {
                        "RESOURCES", 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_UFS", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_UFS", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO31_A", 
                                One, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO31_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (UIDL, 0, NotSerialized)
            {
                Return (NIDL) /* \_SB_.PEP0.NIDL */
            }

            Name (NIDL, Package (0x09)
            {
                "MICROPEP_IDLE", 
                One, 
                Package (0x06)
                {
                    "LPR", 
                    "A53Core0", 
                    Zero, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x03E8, 
                        0x0FA0, 
                        0x10, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x1388, 
                        0x6978, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x06)
                {
                    "LPR", 
                    "A53Core1", 
                    One, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x03E8, 
                        0x0FA0, 
                        0x10, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x1388, 
                        0x6978, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x06)
                {
                    "LPR", 
                    "A53Core2", 
                    0x02, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x03E8, 
                        0x0FA0, 
                        0x10, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x1388, 
                        0x6978, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x06)
                {
                    "LPR", 
                    "A53Core3", 
                    0x03, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x03E8, 
                        0x0FA0, 
                        0x10, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x1388, 
                        0x6978, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x05)
                {
                    "LPR", 
                    "A53L2", 
                    0xFFFFFFFF, 
                    Package (0x0B)
                    {
                        "MODE", 
                        "D2D", 
                        0x0514, 
                        0x1D4C, 
                        0x10, 
                        0x02, 
                        Zero, 
                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core0", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core0", 
                                "C2D", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core0", 
                                "C3", 
                                0x03
                            }
                        }, 

                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core1", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core1", 
                                "C2D", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core1", 
                                "C3", 
                                0x03
                            }
                        }, 

                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core2", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core2", 
                                "C2D", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core2", 
                                "C3", 
                                0x03
                            }
                        }, 

                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core3", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core3", 
                                "C2D", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core3", 
                                "C3", 
                                0x03
                            }
                        }
                    }, 

                    Package (0x0B)
                    {
                        "MODE", 
                        "D3", 
                        0x2328, 
                        0xD2F0, 
                        Zero, 
                        One, 
                        0x04, 
                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core0", 
                                "C3", 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core1", 
                                "C3", 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core2", 
                                "C3", 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core3", 
                                "C3", 
                                0x07
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "LPR", 
                    "CCI", 
                    0xFFFFFFFF, 
                    Package (0x08)
                    {
                        "MODE", 
                        "E1", 
                        0x1388, 
                        0x2710, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Package (0x03)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53L2", 
                                "D2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53L2", 
                                "D3", 
                                0x07
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "MODE", 
                        "E3", 
                        0x2AF8, 
                        0x00038270, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53L2", 
                                "D3", 
                                0x07
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "LPR", 
                    "platform", 
                    0xFFFFFFFF, 
                    Package (0x08)
                    {
                        "MODE", 
                        "xo", 
                        0x2EE0, 
                        0x00050910, 
                        0x20, 
                        Zero, 
                        0x10, 
                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "CCI", 
                                "E3", 
                                0x07
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (OIDL, 0, NotSerialized)
            {
                Return (MIDL) /* \_SB_.PEP0.MIDL */
            }

            Name (MIDL, Package (0x0C)
            {
                "MICROPEP_IDLE", 
                One, 
                Package (0x06)
                {
                    "LPR", 
                    "A53Core0", 
                    Zero, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x03E8, 
                        0x0FA0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x0BB8, 
                        0xAFC8, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x06)
                {
                    "LPR", 
                    "A53Core1", 
                    One, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x03E8, 
                        0x0FA0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x0BB8, 
                        0xAFC8, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x06)
                {
                    "LPR", 
                    "A53Core2", 
                    0x02, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x03E8, 
                        0x0FA0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x0BB8, 
                        0xAFC8, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x06)
                {
                    "LPR", 
                    "A53Core3", 
                    0x03, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x03E8, 
                        0x0FA0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x0BB8, 
                        0xAFC8, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x06)
                {
                    "LPR", 
                    "A57Core0", 
                    0x04, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x0320, 
                        0x1770, 
                        0x10, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x0384, 
                        0x00011170, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x06)
                {
                    "LPR", 
                    "A57Core1", 
                    0x05, 
                    Package (0x07)
                    {
                        "MODE", 
                        "C1", 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C2D", 
                        0x0320, 
                        0x1770, 
                        0x10, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "MODE", 
                        "C3", 
                        0x0384, 
                        0x00011170, 
                        0x03, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x05)
                {
                    "LPR", 
                    "A53L2", 
                    0xFFFFFFFF, 
                    Package (0x0B)
                    {
                        "MODE", 
                        "D2D", 
                        0x0514, 
                        0x0BB8, 
                        Zero, 
                        0x02, 
                        Zero, 
                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core0", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core0", 
                                "C2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core0", 
                                "C3", 
                                0x03
                            }
                        }, 

                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core1", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core1", 
                                "C2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core1", 
                                "C3", 
                                0x03
                            }
                        }, 

                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core2", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core2", 
                                "C2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core2", 
                                "C3", 
                                0x03
                            }
                        }, 

                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core3", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core3", 
                                "C2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core3", 
                                "C3", 
                                0x03
                            }
                        }
                    }, 

                    Package (0x0B)
                    {
                        "MODE", 
                        "D3", 
                        0x2328, 
                        0xFA00, 
                        Zero, 
                        One, 
                        0x04, 
                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core0", 
                                "C3", 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core1", 
                                "C3", 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core2", 
                                "C3", 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53Core3", 
                                "C3", 
                                0x07
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "LPR", 
                    "A57L2", 
                    0xFFFFFFFF, 
                    Package (0x09)
                    {
                        "MODE", 
                        "D2D", 
                        0x07D0, 
                        0x2328, 
                        0x10, 
                        0x02, 
                        Zero, 
                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57Core0", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57Core0", 
                                "C2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57Core0", 
                                "C3", 
                                0x03
                            }
                        }, 

                        Package (0x04)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57Core1", 
                                "C1", 
                                0x03
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57Core1", 
                                "C2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57Core1", 
                                "C3", 
                                0x03
                            }
                        }
                    }, 

                    Package (0x09)
                    {
                        "MODE", 
                        "D3", 
                        0x2EE0, 
                        0xEA60, 
                        Zero, 
                        One, 
                        0x04, 
                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57Core0", 
                                "C3", 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57Core1", 
                                "C3", 
                                0x07
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "LPR", 
                    "CCI", 
                    0xFFFFFFFF, 
                    Package (0x09)
                    {
                        "MODE", 
                        "E1", 
                        0x1388, 
                        0x6590, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Package (0x03)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53L2", 
                                "D2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53L2", 
                                "D3", 
                                0x07
                            }
                        }, 

                        Package (0x03)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57L2", 
                                "D2D", 
                                0x07
                            }, 

                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57L2", 
                                "D3", 
                                0x07
                            }
                        }
                    }, 

                    Package (0x09)
                    {
                        "MODE", 
                        "E3", 
                        0x2AF8, 
                        0x7530, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A53L2", 
                                "D3", 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "A57L2", 
                                "D3", 
                                0x07
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "LPR", 
                    "platform", 
                    0xFFFFFFFF, 
                    Package (0x08)
                    {
                        "MODE", 
                        "xo", 
                        0x1388, 
                        0x00050910, 
                        0x20, 
                        Zero, 
                        0x10, 
                        Package (0x02)
                        {
                            "DEPENDENCY_CONTAINER", 
                            Package (0x04)
                            {
                                "DEPENDENCY", 
                                "CCI", 
                                "E3", 
                                0x07
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (PPMD, 0, NotSerialized)
            {
                Return (PPCC) /* \_SB_.PEP0.PPCC */
            }

            Name (PPCC, Package (0x03)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.STAT", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.UAR1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    0x81, 
                    "\\_SB.GIO0", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x03)
                    {
                        "COMPONENT", 
                        One, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }
                }
            })
            Name (SDFR, Package (0x01)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.SDFR", 
                    Package (0x06)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }, 

                        Package (0x03)
                        {
                            "FSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/dcvs.ena", 
                                    One
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            0x03
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (BPMD, 0, NotSerialized)
            {
                Return (BPCC) /* \_SB_.PEP0.BPCC */
            }

            Name (BPCC, Package (0x05)
            {
                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.SDC1", 
                    Package (0x08)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }, 

                        Package (0x1A)
                        {
                            "PSTATE_SET", 
                            Zero, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x04, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x05, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x06, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x07, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x08, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x09, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0A, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0B, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0C, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0D, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0E, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0F, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x10, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x11, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x12, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x13, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x14, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x15, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x05)
                            {
                                "PSTATE", 
                                0x16, 
                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO20_A", 
                                        One, 
                                        0x002D0370, 
                                        0x0008B290, 
                                        One, 
                                        Zero, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0E)
                                    {
                                        "PPP_RESOURCE_ID_SMPS4_A", 
                                        0x02, 
                                        0x001B7740, 
                                        0x0004F588, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        0x05, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x17, 
                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO20_A", 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }
                        }, 

                        Package (0x0C)
                        {
                            "PSTATE_SET", 
                            One, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x00061A80, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x017D7840, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x017D7840, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x02FAF080, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x04, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x02FAF080, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x05, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x05F5E100, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x06, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x05F5E100, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x07, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x0BEBC200, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x08, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x0BEBC200, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x09, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc1_apps_clk", 
                                        0x03, 
                                        0x17D78400, 
                                        0x02
                                    }
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE_SET", 
                            0x02, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_1", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x2FAF0800, 
                                        0x17D78400
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_1", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x17D78400, 
                                        0x0BEBC200
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_1", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x0BEBC200, 
                                        0x05F5E100
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_1", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x05F5E100, 
                                        0x02FAF080
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x04, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_1", 
                                        "ICBID_SLAVE_EBI1", 
                                        Zero, 
                                        Zero
                                    }
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "PSTATE_SET", 
                            0x03, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        0x09
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        Zero
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        0x07
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        One
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        0x05
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        0x03
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        0x03
                                    }
                                }
                            }
                        }
                    }, 

                    Package (0x09)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2044, 
                                0x0001FFFF, 
                                0x9FDB
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sdcc1_apps_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sdcc1_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x01)
                        {
                            "PSTATE_RESTORE"
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                0x16
                            }
                        }
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc1_ahb_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x01)
                        {
                            "PSTATE_SAVE"
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2044, 
                                0x0001FFFF, 
                                0x0A00
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.SDC2", 
                    Package (0x08)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }, 

                        Package (0x19)
                        {
                            "PSTATE_SET", 
                            Zero, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x04, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x05, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x06, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x07, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x08, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x09, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0B, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0C, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0D, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0E, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0F, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x10, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x11, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x12, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x13, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x08)
                            {
                                "PSTATE", 
                                0x14, 
                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO21_A", 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO13_A", 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO21_A", 
                                        One, 
                                        0x001B7740, 
                                        0x000C3500, 
                                        One, 
                                        Zero, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO13_A", 
                                        One, 
                                        0x002D0370, 
                                        0x55F0, 
                                        One, 
                                        Zero, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x15, 
                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO13_A", 
                                        One, 
                                        0x001C3A90, 
                                        0x55F0, 
                                        One, 
                                        Zero, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }, 

                            Package (0x05)
                            {
                                "PSTATE", 
                                0x16, 
                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO21_A", 
                                        One, 
                                        0x001B7740, 
                                        0x000C3500, 
                                        One, 
                                        Zero, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO13_A", 
                                        One, 
                                        0x002D0370, 
                                        0x55F0, 
                                        One, 
                                        Zero, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }, 

                            Package (0x05)
                            {
                                "PSTATE", 
                                0x17, 
                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO21_A", 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO13_A", 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }
                        }, 

                        Package (0x0B)
                        {
                            "PSTATE_SET", 
                            One, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x00061A80, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x017D7840, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x017D7840, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x02FAF080, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x04, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x02FAF080, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x05, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x05F5E100, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x06, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x05F5E100, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x07, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x0BEBC200, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x08, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x03, 
                                        0x0BEBC200, 
                                        0x02
                                    }
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "PSTATE_SET", 
                            0x02, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_2", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x17D78400, 
                                        0x0BEBC200
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_2", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x0BEBC200, 
                                        0x05F5E100
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_2", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x05F5E100, 
                                        0x02FAF080
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_2", 
                                        "ICBID_SLAVE_EBI1", 
                                        Zero, 
                                        Zero
                                    }
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "PSTATE_SET", 
                            0x03, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        0x08
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        Zero
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        0x05
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        One
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        0x04
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        0x02
                                    }
                                }
                            }
                        }
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                0x16
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2048, 
                                0x7FFF, 
                                0x1FE4
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sdcc2_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sdcc2_apps_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                0x08
                            }
                        }
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_ahb_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
                                0x03
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2048, 
                                0x7FFF, 
                                0x0A00
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                0x17
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.ADSP.SLM1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI0", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x0E)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "EXECUTE_FUNCTION", 
                            Package (0x01)
                            {
                                "WlanD0ResourceVote"
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_PCIE_1", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_pipe_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_slv_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_mstr_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_cfg_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_pcie_1_aux_clk", 
                                0x08, 
                                0x000F4240, 
                                0x03
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_PCIE_1_CFG", 
                                0x11E1A300, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_PCIE_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x17D78400, 
                                0x0BEBC200
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                0x000F4240, 
                                0xAFC8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO12_A", 
                                One, 
                                0x001B7740, 
                                0x5DC0, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x0E)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_slv_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_mstr_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_pcie_1_cfg_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_PCIE_1_CFG", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_PCIE_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_PCIE_1", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO12_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "EXECUTE_FUNCTION", 
                            Package (0x01)
                            {
                                "WlanD3ResourceVote"
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI0.RP1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (IPMD, 0, NotSerialized)
            {
                Return (IPSC) /* \_SB_.PEP0.IPSC */
            }

            Name (IPSC, Package (0x01)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.IPA", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x04)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/ipa", 
                                    0x000124F8
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/xo/cxo", 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/ipa", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/xo/cxo", 
                                    Zero
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (CRMD, 0, NotSerialized)
            {
                Return (CRCC) /* \_SB_.PEP0.CRCC */
            }

            Name (CRCC, Package (0x01)
            {
                Package (0x06)
                {
                    "DEVICE", 
                    "\\_SB.QBCC", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x04)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_PRNG", 
                                    0x2FAF0800, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_prng_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_PRNG", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_prng_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "COMPONENT", 
                        One, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_axi_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_axi_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE1", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_clk", 
                                    0x03, 
                                    0x0A37D070, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE1", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0BEBC200, 
                                    0x0BEBC200
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_clk", 
                                    0x03, 
                                    0x051BD4B0, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE1", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x05F5E100, 
                                    0x05F5E100
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_clk", 
                                    0x03, 
                                    0x028DFDE0, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE1", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce2_clk", 
                                    0x03, 
                                    0x028DFDE0, 
                                    One
                                }
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "COMPONENT", 
                        0x02, 
                        Package (0x03)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/ce1", 
                                    0x00029DA6
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0BEBC200, 
                                    0x0BEBC200
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/ce1", 
                                    0x00014ECE
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x05F5E100, 
                                    0x05F5E100
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/ce1", 
                                    0xA76C
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/ce1", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "COMPONENT", 
                        0x03, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_axi_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_axi_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE2", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_clk", 
                                    0x03, 
                                    0x0A37D070, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE2", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0BEBC200, 
                                    0x0BEBC200
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_clk", 
                                    0x03, 
                                    0x051BD4B0, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE2", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x05F5E100, 
                                    0x05F5E100
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_clk", 
                                    0x03, 
                                    0x028DFDE0, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE2", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce3_clk", 
                                    0x03, 
                                    0x028DFDE0, 
                                    One
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (EWMD, 0, NotSerialized)
            {
                Return (WBRC) /* \_SB_.PEP0.WBRC */
            }

            Name (WBRC, Package (0x03)
            {
                Package (0x04)
                {
                    "DEVICE", 
                    "\\_SB.PCI0.RP1.ENDP.RES", 
                    Package (0x09)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x25, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO30_A", 
                                One, 
                                0x001B7740, 
                                0x09C4, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "DISCRETE_VREGVOTE", 
                            Package (0x02)
                            {
                                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x71, 
                                One, 
                                Zero, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x0A
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x71, 
                                Zero, 
                                Zero, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "DISCRETE_VREGVOTE", 
                            Package (0x02)
                            {
                                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO30_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x25, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.BTH0", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x08)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICGPIO", 
                            Package (0x08)
                            {
                                "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 
                                Zero, 
                                0x12, 
                                Zero, 
                                0x02, 
                                Zero, 
                                One, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO30_A", 
                                One, 
                                0x001B7740, 
                                0x09C4, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "DISCRETE_VREGVOTE", 
                            Package (0x02)
                            {
                                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICGPIO", 
                            Package (0x08)
                            {
                                "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 
                                Zero, 
                                0x12, 
                                Zero, 
                                0x02, 
                                Zero, 
                                0x03, 
                                0x04
                            }
                        }
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICGPIO", 
                            Package (0x08)
                            {
                                "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 
                                Zero, 
                                0x12, 
                                Zero, 
                                0x02, 
                                Zero, 
                                One, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "DISCRETE_VREGVOTE", 
                            Package (0x02)
                            {
                                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO30_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.FMSL", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x08)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x3E, 
                                Zero, 
                                Zero, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x09, 
                                One, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DISCRETE_VREGVOTE", 
                            Package (0x02)
                            {
                                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x0B, 
                                One, 
                                Zero, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x3E, 
                                One, 
                                Zero, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x06)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x0B, 
                                Zero, 
                                Zero, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x3E, 
                                Zero, 
                                Zero, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x09, 
                                Zero, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DISCRETE_VREGVOTE", 
                            Package (0x02)
                            {
                                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                                Zero
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LPMD, 0, NotSerialized)
            {
                Return (LPCC) /* \_SB_.PEP0.LPCC */
            }

            Name (LPCC, Package (0x04)
            {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.URS0", 
                    Package (0x05)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "PMICUSBOTG", 
                                Package (0x02)
                                {
                                    "IOCTL_PMIC_PUBLIC_USB_OTG_ENABLE", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PMICUSBOTG", 
                                Package (0x02)
                                {
                                    "IOCTL_PMIC_PUBLIC_USB_OTG_ENABLE", 
                                    One
                                }
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x08)
                {
                    "DEVICE", 
                    "\\_SB.URS0.USB0", 
                    Package (0x05)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x09)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_usb30_sleep_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_usb2_hs_phy_sleep_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb30_sleep_clk", 
                                    0x09, 
                                    0x08
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb30_sleep_clk", 
                                    0x09, 
                                    0x0C
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb2_hs_phy_sleep_clk", 
                                    0x09, 
                                    0x08
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb2_hs_phy_sleep_clk", 
                                    0x09, 
                                    0x0C
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb30_mock_utmi_clk", 
                                    0x09, 
                                    0x0A
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x11)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x003010B0, 
                                0x16A8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                0xA08C, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                0x000F4240, 
                                0x6590, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_USB_30", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/snoc", 
                                0x0001E848
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sys_noc_usb3_axi_clk", 
                                0x08, 
                                0x7D, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_master_clk", 
                                0x08, 
                                0x7D, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_mock_utmi_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_phy_aux_clk", 
                                0x08, 
                                0x04B0, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3", 
                                "ICBID_SLAVE_EBI1", 
                                0x28000000, 
                                0x28000000
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/pmic/client/rail_cx", 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/pnoc", 
                                0x000186A0
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x05)
                            {
                                "gcc_usb3_phy_pipe_clk", 
                                0x06, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                One, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x12)
                    {
                        "DSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/snoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_master_clk", 
                                0x03, 
                                0x00927C00, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb3_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_mock_utmi_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/pnoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_USB_30", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/pmic/client/rail_cx", 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x003010B0, 
                                0x16A8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                0xA08C, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                0x000F4240, 
                                0x6590, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x12)
                    {
                        "DSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/snoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_master_clk", 
                                0x03, 
                                0x00927C00, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb3_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/pnoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_USB_30", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/pmic/client/rail_cx", 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x003010B0, 
                                0x16A8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                0xA08C, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x12)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/snoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_master_clk", 
                                0x03, 
                                0x00927C00, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb3_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/pnoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_USB_30", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/pmic/client/rail_cx", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x003010B0, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_DSTATE", 
                        0x03
                    }
                }, 

                Package (0x08)
                {
                    "DEVICE", 
                    "\\_SB.URS0.UFN0", 
                    Package (0x05)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x09)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_usb30_sleep_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_usb2_hs_phy_sleep_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb30_sleep_clk", 
                                    0x09, 
                                    0x08
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb30_sleep_clk", 
                                    0x09, 
                                    0x0C
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb2_hs_phy_sleep_clk", 
                                    0x09, 
                                    0x08
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb2_hs_phy_sleep_clk", 
                                    0x09, 
                                    0x0C
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gcc_usb30_mock_utmi_clk", 
                                    0x09, 
                                    0x0A
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x12)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x002EEBB8, 
                                0x16A8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                0xA08C, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                0x000F4240, 
                                0x6590, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_USB_30", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "EXECUTE_FUNCTION", 
                            Package (0x01)
                            {
                                "HSUSBResetSequence"
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/snoc", 
                                0x0001E848
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sys_noc_usb3_axi_clk", 
                                0x08, 
                                0x7D, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_master_clk", 
                                0x08, 
                                0x7D, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_mock_utmi_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_phy_aux_clk", 
                                0x08, 
                                0x04B0, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3", 
                                "ICBID_SLAVE_EBI1", 
                                0x28000000, 
                                0x28000000
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/pmic/client/rail_cx", 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/pnoc", 
                                0x000186A0
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x05)
                            {
                                "gcc_usb3_phy_pipe_clk", 
                                0x06, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                One, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x0D)
                    {
                        "DSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb3_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_phy_aux_clk", 
                                0x08, 
                                0x04B0, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/pmic/client/rail_cx", 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x002EEBB8, 
                                0x03E8, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                0x03E8, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                0x000F4240, 
                                0x03E8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x12)
                    {
                        "DSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/snoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_master_clk", 
                                0x03, 
                                0x00927C00, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb3_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/pnoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_USB_30", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/pmic/client/rail_cx", 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x002EEBB8, 
                                Zero, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                Zero, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x12)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/snoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_master_clk", 
                                0x03, 
                                0x00927C00, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb3_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                Zero, 
                                "/clk/pnoc", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb_phy_cfg_ahb2phy_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x04)
                            {
                                "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                                0x06, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_USB_30", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/pmic/client/rail_cx", 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO24_A", 
                                One, 
                                0x002EEBB8, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO28_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.UFN1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LPMX, 0, NotSerialized)
            {
                Return (LPXC) /* \_SB_.PEP0.LPXC */
            }

            Name (LPXC, Package (0x01)
            {
                Package (0x04)
                {
                    "DEVICE", 
                    "\\_SB.TSC1", 
                    Package (0x09)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x3C, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x00124F80, 
                                0x047E, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO22_A", 
                                One, 
                                0x002F4D60, 
                                0x00011904, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x3C, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x3D, 
                                One, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0xC8
                            }
                        }
                    }, 

                    Package (0x06)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO22_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x3C, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x3D, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            })
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

        Device (UAR2)
        {
            Name (_HID, "QCOM2424")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF991E000,         // Address Base
                        0x00000100,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000008C,
                    }
                    GpioInt (Edge, ActiveLow, Exclusive, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0005
                        }
                })
                Return (RBUF) /* \_SB_.UAR2._CRS.RBUF */
            }

            Method (PROP, 0, NotSerialized)
            {
                Name (RBUF, Package (0x14)
                {
                    "UartClass", 
                    One, 
                    "EnableDma", 
                    Zero, 
                    "QgicBase", 
                    0xF9000000, 
                    "BamBase", 
                    0xF9904000, 
                    "BamPipeTx", 
                    0x02, 
                    "BamPipeRx", 
                    0x03, 
                    "ClkrgmBase", 
                    0xFC400000, 
                    "TlmmBase", 
                    0xFD510000, 
                    "GpioRxData", 
                    0x05, 
                    "GpioTxData", 
                    0x04
                })
                Return (RBUF) /* \_SB_.UAR2.PROP.RBUF */
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
                        0x00000080,
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

        Scope (\_SB.PEP0)
        {
            Method (BSMD, 0, NotSerialized)
            {
                Return (BSRC) /* \_SB_.PEP0.BSRC */
            }

            Name (BSRC, Package (0x02)
            {
                Package (0x04)
                {
                    "DEVICE", 
                    "\\_SB.UAR2", 
                    Package (0x11)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x05)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    One, 
                                    Zero, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    One, 
                                    Zero, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_BLSP_1", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    0x0007A120
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x02, 
                                    Zero, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_BLSP_1", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x05, 
                                    Zero, 
                                    0x02, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x04, 
                                    Zero, 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x05, 
                                    Zero, 
                                    0x02, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x04, 
                                    Zero, 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x00708000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x00E10000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x00F42400, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x016E3600, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x01E84800, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x02625A00, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x02DC6C00, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x030D4000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x03567E00, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x03840000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart2_apps_clk", 
                                    0x03, 
                                    0x03D09000, 
                                    0x04
                                }
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "COMPONENT", 
                        One, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.I2C2", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                One, 
                                0x05F5E100, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup2_i2c_apps_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x0927C000, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x06, 
                                One, 
                                0x03, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x07, 
                                One, 
                                0x03, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                0x02, 
                                0x05F5E100, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup2_i2c_apps_clk", 
                                0x02, 
                                0x0124F800, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x07, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x06, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x03, 
                                Zero
                            }
                        }
                    }
                }
            })
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

        Device (TECC)
        {
            Name (_HID, "MSHW1024")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (TSC1)
        {
            Name (_HID, "MSHW1003")  // _HID: Hardware ID
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


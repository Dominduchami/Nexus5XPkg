/* Minimum DSDT for WoA boot */

DefinitionBlock ("DSDT.aml", "DSDT", 5, "LMNL", "EDK2", 2)
{
	Scope (\_SB_)
    {
        /* 8 CPU Cores */
		Device (CPU0)
        {
		    Name (_HID, "ACPI0007")
            Name (_UID, 0x0)
			Method (_STA)
            {
                Return(0xf)
            }
        }

        Device (CPU1)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 0x1)
			Method (_STA)
            {
                Return(0xf)
            }
        }

        Device (CPU2)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 0x2)
			Method (_STA)
            {
                Return(0xf)
            }
        }

        Device (CPU3)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 0x3)
			Method (_STA)
            {
                Return(0xf)
            }
        }

        Device (CPU4)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 0x4)
			Method (_STA)
            {
                Return(0xf)
            }
        }

        Device (CPU5)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 0x5)
			Method (_STA)
            {
                Return(0xf)
            }
        }

        Device (CPU6)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 0x6)
			Method (_STA)
            {
                Return(0xf)
            }
        }

        Device (CPU7)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 0x7)
			Method (_STA)
            {
                Return(0xf)
            }
        }

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

	}
}
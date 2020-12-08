/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLjI2vyz.aml, Tue Dec  8 17:26:01 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000002E5 (741)
 *     Revision         0x02
 *     Checksum         0x49
 *     OEM ID           "ACDT"
 *     OEM Table ID     "I2C-TPXX"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "I2C-TPXX", 0x00000000)
{
    External (_SB_.GNUM, MethodObj)    // 1 Arguments
    External (_SB_.INUM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.HIDD, MethodObj)    // 5 Arguments
    External (_SB_.PCI0.HIDG, IntObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.TP7D, MethodObj)    // 6 Arguments
    External (_SB_.PCI0.TP7G, IntObj)
    External (_SB_.SHPO, MethodObj)    // 2 Arguments
    External (EV5_, MethodObj)    // 2 Arguments
    External (GPDI, FieldUnitObj)
    External (TPDB, FieldUnitObj)
    External (TPDH, FieldUnitObj)
    External (TPDS, FieldUnitObj)
    External (TPDT, FieldUnitObj)
    External (TPTP, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            TPDT = Zero
        }
    }

    Scope (_SB.PCI0.I2C1)
    {
        Device (TPDX)
        {
            Name (HID2, Zero)
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0000, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "NULL",
                    0x00, ResourceConsumer, _Y00, Exclusive,
                    )
            })
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
            })
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake, ,, _Y01)
                {
                    0x00000000,
                }
            })
            CreateWordField (SBFB, \_SB.PCI0.I2C1.TPDX._Y00._ADR, BADR)  // _ADR: Address
            CreateDWordField (SBFB, \_SB.PCI0.I2C1.TPDX._Y00._SPE, SPED)  // _SPE: Speed
            CreateWordField (SBFG, 0x17, INT1)
            CreateDWordField (SBFI, \_SB.PCI0.I2C1.TPDX._Y01._INT, INT2)  // _INT: Interrupts
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                INT1 = GNUM (GPDI)
                INT2 = INUM (GPDI)
                SHPO (GPDI, One)
                If (One)
                {
                    _HID = "CUST0001"
                    HID2 = TPDH /* External reference */
                    BADR = TPDB /* External reference */
                    If ((TPDS == Zero))
                    {
                        SPED = 0x000186A0
                    }

                    If ((TPDS == One))
                    {
                        SPED = 0x00061A80
                    }

                    If ((TPDS == 0x02))
                    {
                        SPED = 0x000F4240
                    }

                    Return (Zero)
                }
            }

            Name (_HID, "XXXX0000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Name (DRDY, Zero)
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((DRDY == Zero))
                {
                    If ((Arg0 == HIDG))
                    {
                        DRDY = One
                        EV5 (Zero, Zero)
                    }
                }

                If ((Arg0 == HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }

                If ((Arg0 == TP7G))
                {
                    Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFG))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ConcatenateResTemplate (SBFB, SBFG))
            }
        }
    }
}


/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL4lWCOO.aml, Tue Jan 11 08:39:59 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000002CB (715)
 *     Revision         0x02
 *     Checksum         0x79
 *     OEM ID           "hack"
 *     OEM Table ID     "TYPC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "TYPC", 0x00000000)
{
    External (_SB_.PCI0.RP17, DeviceObj)
    External (_SB_.PCI0.RP17.PXSX, DeviceObj)

    Scope (\_SB.PCI0.RP17)
    {
        Name (RTBT, One)
    }

    Scope (\_SB.PCI0.RP17.PXSX)
    {
        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
        {
            Return (One)
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Device (TBL3)
        {
            Name (_ADR, 0x00020000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }

            Device (TBTU)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x6D, 
                    Zero
                })
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (GPLD, 2, Serialized)
                    {
                        Name (PCKG, Package (0x01)
                        {
                            Buffer (0x10){}
                        })
                        CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
                        REV = One
                        CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
                        VISI = Arg0
                        CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
                        GPOS = Arg1
                        Return (PCKG) /* \_SB_.PCI0.RP17.PXSX.TBL3.TBTU.RHUB.GPLD.PCKG */
                    }

                    Method (GUPC, 1, Serialized)
                    {
                        Name (PCKG, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        PCKG [Zero] = Arg0
                        Return (PCKG) /* \_SB_.PCI0.RP17.PXSX.TBL3.TBTU.RHUB.GUPC.PCKG */
                    }

                    Method (TPLD, 2, Serialized)
                    {
                        Name (PCKG, Package (0x01)
                        {
                            Buffer (0x10){}
                        })
                        CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
                        REV = One
                        CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
                        VISI = Arg0
                        CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
                        GPOS = Arg1
                        CreateField (DerefOf (PCKG [Zero]), 0x4A, 0x04, SHAP)
                        SHAP = One
                        CreateField (DerefOf (PCKG [Zero]), 0x20, 0x10, WID)
                        WID = 0x08
                        CreateField (DerefOf (PCKG [Zero]), 0x30, 0x10, HGT)
                        HGT = 0x03
                        Return (PCKG) /* \_SB_.PCI0.RP17.PXSX.TBL3.TBTU.RHUB.TPLD.PCKG */
                    }

                    Method (TUPC, 1, Serialized)
                    {
                        Name (PCKG, Package (0x04)
                        {
                            One, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        PCKG [One] = Arg0
                        Return (PCKG) /* \_SB_.PCI0.RP17.PXSX.TBL3.TBTU.RHUB.TUPC.PCKG */
                    }

                    Device (UB21)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            Return (TUPC (0x09))
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            Return (TPLD (One, One))
                        }
                    }

                    Device (UB22)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            Return (GUPC (Zero))
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            Return (GPLD (Zero, Zero))
                        }
                    }

                    Device (UB31)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            Return (TUPC (0x09))
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            Return (TPLD (One, One))
                        }
                    }

                    Device (UB32)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            Return (GUPC (Zero))
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            Return (GPLD (Zero, Zero))
                        }
                    }
                }
            }
        }
    }
}


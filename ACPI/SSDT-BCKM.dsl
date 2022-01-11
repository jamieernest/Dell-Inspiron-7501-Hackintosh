/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLY4vuhC.aml, Tue Jan 11 08:37:36 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000029E (670)
 *     Revision         0x02
 *     Checksum         0x29
 *     OEM ID           "hack"
 *     OEM Table ID     "BCKM"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "BCKM", 0x00000000)
{
    External (_SB_.ACOS, IntObj)
    External (_SB_.ACSE, IntObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0.BRTX, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.GFX0.LCD_, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP.EVD5, FieldUnitObj)
    External (_SB_.PCI0.PEG0.PEGP.LCD_, DeviceObj)

    Scope (_SB)
    {
        Device (PNLF)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
            Name (_CID, "backlight")  // _CID: Compatible ID
            Name (_UID, 0x13)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }

                Return (Zero)
            }
        }
    }

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.ACOS = 0x80
            \_SB.ACSE = Zero
        }
    }

    Scope (\_SB.PCI0.GFX0)
    {
        Method (BRT6, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((Arg0 == One))
                {
                    Notify (^LCD, 0x86) // Device-Specific
                    Notify (^^LPCB.PS2K, 0x10) // Reserved
                    Notify (^^LPCB.PS2K, 0x0206)
                    Notify (^^LPCB.PS2K, 0x0286)
                }

                If ((Arg0 & 0x02))
                {
                    Notify (^LCD, 0x87) // Device-Specific
                    Notify (^^LPCB.PS2K, 0x20) // Reserved
                    Notify (^^LPCB.PS2K, 0x0205)
                    Notify (^^LPCB.PS2K, 0x0285)
                }
            }
            Else
            {
                \_SB.PCI0.GFX0.BRTX (Arg0, Arg1)
            }
        }
    }

    Scope (_SB.PCI0.PEG0.PEGP)
    {
        Method (BRT6, 2, NotSerialized)
        {
            If (((!_OSI ("Darwin") && (EVD5 == One)) && CondRefOf (\_SB.PCI0.PEG0.PEGP.LCD)))
            {
                If ((Arg0 == One))
                {
                    Notify (\_SB.PCI0.PEG0.PEGP.LCD, 0x86) // Device-Specific
                }

                If ((Arg0 & 0x02))
                {
                    Notify (\_SB.PCI0.PEG0.PEGP.LCD, 0x87) // Device-Specific
                }
            }
        }
    }
}


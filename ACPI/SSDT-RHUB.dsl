/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLnEejbs.aml, Mon Dec  7 10:10:18 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000145 (325)
 *     Revision         0x02
 *     Checksum         0x34
 *     OEM ID           "DRTNIA"
 *     OEM Table ID     "RhubOff"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "RhubOff", 0x00001000)
{
    External (_SB_.PCI0.XHC1.RHUB, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (_SB_.PCI0.XHCI.RHUB, DeviceObj)

    If (CondRefOf (\_SB.PCI0.XHC.RHUB))
    {
        Scope (_SB.PCI0.XHC.RHUB)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHCI.RHUB))
    {
        Scope (_SB.PCI0.XHCI.RHUB)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC1.RHUB))
    {
        Scope (_SB.PCI0.XHC1.RHUB)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
    }
}


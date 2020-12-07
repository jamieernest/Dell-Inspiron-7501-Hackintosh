/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLygaxNI.aml, Mon Dec  7 10:10:19 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000111 (273)
 *     Revision         0x02
 *     Checksum         0xE7
 *     OEM ID           "ACDT"
 *     OEM Table ID     "EXT4"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "EXT4", 0x00000000)
{
    External (_SB_.LID0, DeviceObj)
    External (_SB_.LID_, DeviceObj)
    External (_SB_.PCI0.LPCB.LID0, DeviceObj)
    External (_SB_.PCI0.LPCB.LID_, DeviceObj)

    Method (EXT4, 1, NotSerialized)
    {
        If ((0x03 == Arg0))
        {
            If (CondRefOf (\_SB.LID))
            {
                Notify (\_SB.LID, 0x80) // Status Change
            }

            If (CondRefOf (\_SB.LID0))
            {
                Notify (\_SB.LID0, 0x80) // Status Change
            }

            If (CondRefOf (\_SB.PCI0.LPCB.LID))
            {
                Notify (\_SB.PCI0.LPCB.LID, 0x80) // Status Change
            }

            If (CondRefOf (\_SB.PCI0.LPCB.LID0))
            {
                Notify (\_SB.PCI0.LPCB.LID0, 0x80) // Status Change
            }
        }
    }
}


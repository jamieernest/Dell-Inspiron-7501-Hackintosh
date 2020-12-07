/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLSlXvKd.aml, Mon Dec  7 10:10:19 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001DC (476)
 *     Revision         0x02
 *     Checksum         0xDE
 *     OEM ID           "hack"
 *     OEM Table ID     "DGPU"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "DGPU", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PEGP._ON_, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PG00._OFF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PGOF, MethodObj)    // 0 Arguments
    External (EXT4, MethodObj)    // 1 Arguments
    External (ZPTS, MethodObj)    // 1 Arguments
    External (ZWAK, MethodObj)    // 1 Arguments

    Method (DGPU, 0, NotSerialized)
    {
        If (CondRefOf (\_SB.PCI0.PEG0.PEGP._OFF))
        {
            \_SB.PCI0.PEG0.PEGP._OFF ()
        }

        If (CondRefOf (\_SB.PCI0.PEG0.PG00._OFF))
        {
            \_SB.PCI0.PEG0.PG00._OFF ()
        }

        If (CondRefOf (\_SB.PCI0.PGOF))
        {
            \_SB.PCI0.PGOF ()
        }
    }

    Device (RMD1)
    {
        Name (_HID, "RMD10000")  // _HID: Hardware ID
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                DGPU ()
            }
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }

            Return (Zero)
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        Local0 = ZWAK (Arg0)
        If (_OSI ("Darwin"))
        {
            If (CondRefOf (EXT4))
            {
                EXT4 (Arg0)
            }

            DGPU ()
        }

        Return (Local0)
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI0.PEG0.PEGP._ON ()
        }

        ZPTS (Arg0)
    }
}


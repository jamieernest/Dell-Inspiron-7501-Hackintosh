# Dell Inspiron 7501 Hackintosh
<strong>UNFINSHED, PLANNED TO BE DONE BY 1/7/2020</strong>
<p>
    <img style="border-radius: 8px" src="Assets/background.png">
</p>

## System configuration

| Model     | MacBookPro16,1      | Version        | Catalina 10.15.7      |
| :-------- | :------------------ | :------------- | :------------------ |
| Processor | Intel Core i7-10750H | Graphics       | UHD Graphics 630    |
| Memory    | 2999MHz DDR4 1x8GB + 2666MHz 1x32GB  | OS Disk        | LiteOn CL1-3D412-Q11 NVMe (included with laptop) |
| Audio     | Realtek ALC236      | WiFi/Bluetooth | Dell DW1560 (swapped)/Intel AX201(default card)             |

## About build

- Intel wifi card works (no WPA Enterprise afaik or Continuity/Airdrop/iMessage(can be fixed, I'll cover later) etc):
  - Follow this: https://openintelwireless.github.io

#### Performance

- [Geekbench 5](https://browser.geekbench.com/v5/cpu/4411543): 1097 SingleCore, 4244 MultiCore
- Battery: 48wh with 65% brightness (2 NVMe), I got 5h ish screen time when suffering web and using OneNote/VSCode

#### Not Working

- Things that may never work:
  - Discrete GPU (Disabled)
  - Fingerprint (Disabled)
  - Internal Microphone
  - HDMI Port (USB-C works but no video output)
  - Trackpad Gestures (Two, Three, Four fingers dont work, LR click and tracking works fine)

## Installation

### BIOS

- Disk in `AHCI` mode
- Fastboot: `Thorough`

### STEP

> You can follow [Dortania's guide](https://dortania.github.io/OpenCore-Install-Guide/) as it is very detailed and easy to understand.

#### TL;DR

- Prepair an Mac installer in USB with [GibMacOS](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/)
- Go to the [releases](https://github.com/jamieernest/Dell-Inspiron-7501-Hackintosh/releases) and download the lastest version
- Replace EFI folder in USB EFI partition with the EFI folder from the zip file
- Go into config.plist with [ProperTree](https://github.com/corpnewt/ProperTree) and change the SystemProductName (Type), SystemSerialNumber (Serial), MLB (Board Serial) and SystemUUID (SmUUID) which is generated using [GenSMBIOS.](https://github.com/corpnewt/GenSMBIOS) (Press 1, then 3 then type MacBookPro16,1)
- Boot into USB and select MacOS installer
- In the installer open disk utility and format the SSD to APFS. <strong>YOU WILL LOSE ALL THE DATA THAT IS ON IT</strong>
- When you are booted in you need to mount EFI partition and replace it with USB's EFI using [Hackintool](https://github.com/headkaze/Hackintool/releases) or [MountEFI](https://github.com/corpnewt/MountEFI)
- For Intel AX201 users, follow [Intel's guide](https://openintelwireless.github.io) to init your wifi

#### Sleep
For now when I use sleep there will be a lot of heat coming out of the laptop (probably from dGpu even if I turned it off using -wegnoegpu and the SSDTs) but if anyone has a fix feel free to reply to the issue

## Credits

- [Apple](https://apple.com/) for MacOS
- [acidanthera](https://github.com/acidanthera) for providing almost all kexts and drivers
- [corpnewt](https://github.com/corpnewt) for GibMacOS, GenSMBIOS and MountEFI
- [Dortania](https://github.com/dortania) for the guides
- [headkaze](https://github.com/headkaze) for providing the very useful [Hackintool](https://github.com/headkaze/Hackintool/releases)
- And all other authors that mentioned or not mentioned in this repo
- [tctien342](https://github.com/tctien342) this build is inspired from [his project](https://github.com/tctien342/Dell-Inspiron-7591-Hackintosh), and some of the SSDTs and kexts are from him, readme.md is based on his, big thanks to him
-  and [you](https://cdn.weeb.sh/images/rJl3BcTuG.gif) for reading/following/using this :D

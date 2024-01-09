__DarkArmyVM__

![GitHub Logo](https://github.com/A300bdi/DarkArmyVM/blob/main/Dark_Army-red-f.jpg)

__What is DarkArmyVM?__
---
DarkArmyVM is Offensive VM ("DarkArmyVM") is customizable, Windows-based security distribution for penetration testing and red teaming. DarkArmyVM comes packaged with a variety of offensive tools not included in Kali Linux which highlight the effectiveness of Windows as an attack platform.

__Requirements__
---
__DarkArmyVM__ can be install on host computer but always windows 10 virtual machine is recommanded. The VM should satisfy the following requirements:

+ Windows >= 10
+ PowerShell >= 5
+ Disk capacity of at least 60 GB and memory of at least 2GB
+ Internet connection
+ Tamper Protection and any Anti-Malware solution (e.g., Windows Defender) Windows Defender disabled, preferably via Group Policy
+ Windows Updates Disabled

__Installation Instructions__
----
You MUST disable Windows Defender for a smooth install. The best way to accomplish this is through Group Policy.

In Windows versions 1909 and higher, Tamper Protection was added. Tamper Protection must be disabled first, otherwise Group Policy settings are ignored.

1. Open Windows Security (```type Windows Security``` in the search box)
2. Virus & threat protection > Virus & threat protection settings > Manage settings
3. Switch ```Tamper Protection``` to Off
 +  It is not necessary to change any other setting (Real Time Protection, etc.)

 + Important! Tamper Protection must be disabled before changing Group Policy settings.

To permanently disable ```Real Time Protection```:

1. Make sure you disabled ```Tamper Protection```
2. Open Local Group Policy Editor (type gpedit in the search box)
3. Computer Configuration > Administrative Templates > Windows Components > Microsoft Defender Antivirus > Real-time Protection
4. Enable Turn off ```real-time protection```
5. __Reboot__
Make sure to reboot before making the next change

To permanently disable Microsoft Defender:

1. Make sure you rebooted your machine
2. Open Local Group Policy Editor (type gpedit in the search box)
3. Computer Configuration > Administrative Templates > Windows Components > Microsoft Defender Antivirus
4. Enable Turn off Microsoft Defender Antivirus
5. __Reboot__

__Installation__
---
1. Complete the install procedures by disabling Defender
2. Download and extract the zip of the DarkArmy-VM repo
3. Run PowerShell as Simple not Admin 
4. Set-ExecutionPolicy Unrestricted -force
5. cd ~/Downloads/DarkArmyVM
6. Run the ```.\install.ps1``` in PowerShell

__Credits__
---
Supervised by Osamah Ahmed
Dr.Mansoor Alam
Dr. Jawaid Iqbal

Mr.Ahmed Nawaz


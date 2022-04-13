Some random tips I've found across the internet that I use on occasion.

*Configure Nested Virtualization in Hyper-V (for a specific vm) [source](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/nested-virtualization)*

```
Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true
```

*Split a >4GB iso wim file [source](https://www.neowin.net/forum/topic/1242296-windows-server-2012-r2-dc-edition-uefi-install-nightmare/?do=findComment&comment=596707506)*

```
mkdir \iso
xcopy cdrom:\* \iso /s /e
dism /split-image /imagefile:c:\iso\sources\install.wim /swmfile:c:\iso\sources\install.swm /filesize:4095 /checkintegrity
del \iso\sources\install.wim
xcopy \iso\* thumbdrive:\ /s /e
```

*Bypass Windows 11 Requirements for Hyper-V lab setup*

```
regedit (SHIFT+F10)
HKEY_LOCAL_MACHINE\SYSTEM\Setup -> New Key "LabConfig"
New DWORD (32) with value set to 1 -> BypassTPMCheck, BypassRAMCheck, BypassSecureBootCheck
```

Jekyll Tips - https://devhints.io/jekyll-github

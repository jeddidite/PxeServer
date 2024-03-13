strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2\Security\MicrosoftVolumeEncryption")
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_EncryptableVolume",,48)
For Each objItem in colItems
    ' Wscript.Echo objItem.ProtectionStatus
    if (objItem.ProtectionStatus = 0) then
      enc = "bitlocker off"
    else
      enc = "bitlocker on"
    end if
    Wscript.Echo objItem.DriveLetter &   " " & enc
Next


menu.cmd

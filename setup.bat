@echo off
set username=My_Username
rem English Presets
rem set usergroup=users
rem set admingroup=administrators
rem German Presets
set usergroup=Benutzer
set admingroup=Administratoren
(echo sel dis 0
echo conv gpt
echo cre par efi size=500
echo form fs=fat32 quick
echo ass letter w
echo cre par pri
echo form fs=ntfs quick
echo ass letter c) | diskpart
dism /apply-image /imagefile:D:\sources\install.wim /index:1 /applydir:C:\
bcdboot C:\Windows /s W:
reg load HKEY_LOCAL_MACHINE\SOFT C:\Windows\system32\config\SOFTWARE
reg load HKEY_LOCAL_MACHINE\SYS C:\Windows\system32\config\SYSTEM
reg add HKEY_LOCAL_MACHINE\SOFT\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\SOFT\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\SYS\Setup /v CmdLine /t REG_SZ /d "cmd.exe /c \"oobe\windeploy ^& net user /add %username% ^& net localgroup /add %usergroup% %username% ^& net localgroup /add %admingroup% %username% ^& reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup /v OOBEInProgress /t REG_DWORD /d 0 /f ^& reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup /v SetupType /t REG_DWORD /d 0 /f ^& reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f & exit\"" /f
wpeutil reboot

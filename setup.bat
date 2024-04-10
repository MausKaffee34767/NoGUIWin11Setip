@echo off
set username=My_Username
rem English Presets
rem set usergroup=users
rem set admingroup=administrators
rem German Presets
set usergroup=Benutzer
set admingroup=Administratoren
rem ************************* WARNING! THERE IS NO GUARANTEE THAT IT WILL WORK! I ASSUME NO LIABILITY FOR ANY DAMAGE CAUSED BY THIS PROGRAM! *************************
rem 1. Customize the settings if necessary, and don't forget to save the file
rem 1.1. Remove ALL comments
rem * It's necessary to boot into the Windows Setup!
rem 2. Prepare for Virtual machine:
rem     1. Go to the Virtual Machine
rem     1.1. Rember the choosen disk in Devices -> Optical Drives
rem     1.2. In "Devices -> Optical Drives -> Choose/Create a disk image" click "Create"
rem     1.3. Click "Configuration" and enter "setup" into the "VISO Name" field
rem     1.4. Select your "setup.bat" in the "Host File System" tab and drag it into the "VISO Content" tab
rem     1.5. Click "Create" and then click "Choose" in the "Optical Drive Selector" window (make sure you are back in the VM after this step)
rem     1.6. Press Shift + F10
rem     1.7. A command prompt should open
rem     1.8. Type in ```xcopy D:\setup.bat .``` (If use it on real hardware you need find the correct drive letter)
rem     1.9. Now select the disk that was selected before
rem     1.10. Run ```setup.bat```
rem 2.1. Prepare for real hardware
rem     1.1. Copy setup.bat to usb stick (or other medium)
rem     1.2. Perform steps 1.6. to 1.10. (exclude 1.9.) from section 2
rem 
rem Do NOT any code below this section ↓
rem                                    ↓
rem                                    ↓
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
reg add HKEY_LOCAL_MACHINE\SYS\Setup /v CmdLine /t REG_SZ /d "cmd.exe /c ""oobe\windeploy & net user /add %username% & net localgroup /add %usergroup% %username% & net localgroup /add %admingroup% %username% & reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup /v OOBEInProgress /t REG_DWORD /d 0 /f & reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup /v SetupType /t REG_DWORD /d 0 /f & reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f & exit""" /f
wpeutil reboot

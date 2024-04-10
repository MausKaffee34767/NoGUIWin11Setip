# NoGUIWin11Setup

## How to use
1. Customize the settings if necessary, and don't forget to save the file\
1.1. Remove ALL comments\
Note: It's necessary to boot into the Windows Setup!\
2\. Prepare for a Virtual Machine (I am using [Virtual Box](https://www.virtualbox.org/))\
    1. Go to the Virtual Machine\
    1.1. Rember the choosen disk in Devices -> Optical Drives\
    1.2. In ```Devices -> Optical Drives -> Choose/Create a disk image``` click ```Create```\
    1.3. Click ```Configuration``` and enter ```setup``` into the ```VISO Name``` field\
    1.4. Select your ```setup.bat``` in the ```Host File System``` tab and drag it into the ```VISO Content``` tab\
    1.5. Click ```Create``` and then click ```Choose``` in the ```Optical Drive Selector``` window\
    1.6. Press Shift + F10 (Make sure you are back in your VM before pressing it)\
    1.7. A command prompt should open\
    1.8. Type in ```xcopy D:\setup.bat .``` (If you use it on real hardware you need find the correct drive letter)\
    1.9. Now select the disk that was selected before\
    1.10. Run ```setup.bat```\
2.1. Prepare for real hardware\
    1.1. Copy setup.bat to usb stick (or other medium)\
    1.2. Perform steps 1.6. to 1.10. (exclude 1.9.) from section 2

@echo off
title Creative Cloud Clean Launcher
color F
echo Enter the number corresponding to the CC program you want to launch:
echo.
echo 1. Photoshop 2022
echo 2. Premiere Pro 2022
echo 3. Media Encoder 2022
echo 4. After Effects 2022
echo.

set /p a=
IF %a%==1 (start /min "" "CC_Startup_Cleaner.bat" && start /w "" "C:\Program Files\Adobe\Adobe Photoshop 2022\photoshop.exe")
IF %a%==2 (start /min "" "CC_Startup_Cleaner.bat" && start /w "" "C:\Program Files\Adobe\Adobe Premiere Pro 2022\Adobe Premiere Pro.exe")
IF %a%==3 (start /min "" "CC_Startup_Cleaner.bat" && start /w "" "C:\Program Files\Adobe\Adobe Media Encoder 2022\Adobe Media Encoder.exe")
IF %a%==4 (start /min "" "CC_Startup_Cleaner.bat" && start /w "" "C:\Program Files\Adobe\Adobe After Effects 2022\Support Files\AfterFX.exe")

start /min "" "CC_Exit.bat"
exit

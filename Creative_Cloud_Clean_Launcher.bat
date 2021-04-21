@echo off
title Creative Cloud Clean Launcher
color F
echo Enter the number corresponding to the CC program you want to launch:
echo.
echo 1. Photoshop 2021
echo 2. Premiere Pro 2021
echo 3. Media Encoder 2021
echo 4. After Effects 2021
echo.

set /p a=
IF %a%==1 (start "" "C:\Program Files\Adobe\Adobe Photoshop 2021\photoshop.exe")
IF %a%==2 (start "" "C:\Program Files\Adobe\Adobe Premiere Pro 2021\Adobe Premiere Pro.exe")
IF %a%==3 (start "" "C:\Program Files\Adobe\Adobe Media Encoder 2021\Adobe Media Encoder.exe")
IF %a%==4 (start "" "C:\Program Files\Adobe\Adobe After Effects 2021\Support Files\AfterFX.exe")

timeout 4
taskkill /f /im "Adobe Desktop Service.exe"
taskkill /f /im "CoreSync.exe"
taskkill /f /im "Creative Cloud Helper.exe"
taskkill /f /im "node.exe"
timeout 20
taskkill /f /im "AdobeIPCBroker.exe"
taskkill /f /im "CCXLibrary.exe"
taskkill /f /im "CCXProcess.exe"
taskkill /f /im "CCLibrary.exe"
exit

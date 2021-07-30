@echo off
color F
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
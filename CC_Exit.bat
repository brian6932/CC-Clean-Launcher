@echo off
color F
taskkill /f /im "Adobe Desktop Service.exe"
taskkill /f /im "AdobeIPCBroker.exe"
taskkill /f /im "CCXLibrary.exe"
taskkill /f /im "CCXProcess.exe"
taskkill /f /im "CoreSync.exe"
taskkill /f /im "Creative Cloud Helper.exe"
taskkill /f /im "node.exe"
taskkill /f /im "CCLibrary.exe"
taskkill /f /im "AdobeUpdateService.exe"
taskkill /f /im "AdobeExtensionsService.exe"
taskkill /f /im "Creative Cloud.exe"
exit
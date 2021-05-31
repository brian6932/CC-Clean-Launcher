<h1 align="center">CC-Clean-Launcher - CC without the annoying background processes</h1>

The reason that this has two files is because `AdobeIPCBroker.exe` is more of a dependancy than bloat, so a second script is needed once you've exited to clean the leftover. It sucks that this is needed to actually run CC programs without leftover background processes, but it is what it is.

## Usage:

### 1:
- Under services, disable `Adobe Genuine Monitor Service (AGMService)` and `Adobe Genuine Software Integrity Service (AGSService)`
- And again under services, set `AdobeUpdateService` to manual 
- These will reset everytime you update your CC programs, so make sure to set it each time
- For a more permanent solution you can try to delete everything in: `C:\Program Files (x86)\Common Files\Adobe\AdobeGCClient` and then remove all user permissions, including system, so that the files don't restore

### 2:

- Make a backup folder for the following file (you could also rename them, although I prefer to have the backups centralized in a folder with specified path names as their folder paths)
- Go to: "C:\Program Files\Adobe\Adobe Creative Cloud Experience"

- Cut CCLibrary.exe and paste it into your backup folder

### 3:

- [Dowload the batch files](https://github.com/brian6932/CC-Clean-Launcher/archive/refs/heads/main.zip)

### 4:

- Run Creative_Cloud_Clean_Launcher.bat and choose the program you want to open

### 5:

- Whenever you're done using any CC programs and have them closed, run CC_Exit.bat, it will kill any remnants (`AdobeIPCBroker.exe` should be the main one)

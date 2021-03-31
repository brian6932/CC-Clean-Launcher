<h1 align="center">CC-Clean-Launcher - CC without the annoying background processes</h1>

The reason that this has two files is because `AdobeIPCBroker.exe` is more of a dependancy than bloat, so a second script is needed once you've exited to clean the leftover. It sucks that this is needed to actually run CC programs without leftover background processes, but it is what it is.

## Usage:

### 1:

- Make a backup folder for some of the files (you could also rename them, although I prefer to have the backups centralized in a folder with specified path names as their folder paths)

### 2:

- Go to: "C:\Program Files (x86)\Common Files\Adobe\Adobe Desktop Common\IPCBox"

- Cut AdobeIPCBroker.exe and paste it into your backup folder

### 3:

- Go to: "C:\Program Files\Adobe\Adobe Creative Cloud Experience"

- Cut CCLibrary.exe and paste it into your backup folder

### 4:

- Go to: "C:\Program Files (x86)\Common Files\Adobe\OOBE\PDApp\IPC"

- Cut CCXProcess.exe and paste it into your backup folder

### 5:

- [Dowload the batch files](https://github.com/brian6932/CC-Clean-Launcher/archive/refs/heads/main.zip)

### 6:

- Run Creative_Cloud_Clean_Launcher.bat and choose the program you want to open

### 7:

- Whenever you're done using any CC programs and have them closed, run CC_Exit.bat, it will kill any remnants (`AdobeIPCBroker.exe` is really only one)

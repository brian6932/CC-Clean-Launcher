<h1 align="center">CC-Clean-Launcher - CC without the annoying background processes</h1>

## Installation

### Scoop

```sh
scoop bucket add dank-scoop https://github.com/brian6932/dank-scoop
scoop install dank-scoop/cc-clean-launcher
```

### Manual

- Pick an installation dir, and open a shell in that dir
```pwsh
Invoke-RestMethod https://raw.githubusercontent.com/brian6932/CC-Clean-Launcher/2023/cc.ps1 -OutFile cc.ps1
[Environment]::SetEnvironmentVariable('Path', "$([Environment]::GetEnvironmentVariable('Path', 'User'));$pwd", 'User')
```
- The second line is optional, but recommended, it puts the script in your `$env:Path`, so you can easily launch it from anywhere

## Usage

### 1
- Under services, disable `Adobe Genuine Monitor Service (AGMService)` and `Adobe Genuine Software Integrity Service (AGSService)`
- And again under services, set `AdobeUpdateService` to manual
- These will reset every time you update your CC programs, so make sure to set it each time

### 2
- **Optional, but recommended:**
  * For a more permanent solution, you can delete all files in: `C:\Program Files (x86)\Common Files\Adobe\Adobe Desktop Common\AdobeGenuineClient`
  * Then remove all folder user permissions, including system, so that the files don't restore (screenshots are a bit old)
<p align="center">
  <img src="Screenshots/Permissions.png" />
</p>

  * The permanent solution only works for the AG services. The `AdobeUpdateService` is a necessary one, so just make sure to set it to manual each time you update any CC programs

### 3

- Download the `ps1` file for [CC 2023](https://github.com/brian6932/CC-Clean-Launcher/archive/refs/heads/2023.zip)

### 4

- Run `cc.ps1`
- Select the letter corresponding to the CC program you want to launch, and press enter twice
- If you launch the script when already in a shell, the job will run in the background, so it doesn't interrupt your session (Don't close the shell, until you close your CC program)
- If you launch the script directly, it will halt the window, and it won't close until your CC program is closed

### 5
- The launcher will kill some extra startup bloat, however, it will remain open. **DO NOT CLOSE IT!**
- It needs to kill the residual processes
- Some CC programs don't play well with closing, and require the task to be killed, this isn't usually the case, in such cases, you may find something like [SuperF4](https://stefansundin.github.io/superf4/) handy

using namespace System.Management.Automation.Host
$program = $host.ui.PromptForChoice(
    'Enter the letter corrosponding to the CC program you want to launch:',
    $null,
    [ChoiceDescription[]](
        [ChoiceDescription]::new('Photo&shop'),
        [ChoiceDescription]::new('&Premiere Pro'),
        [ChoiceDescription]::new('&Media Encoder'),
        [ChoiceDescription]::new('&After Effects'),
        [ChoiceDescription]::new('&Illustrator')
    ),
    $null
)
$program = switch ($program) {
    0 { 'Adobe Photoshop */Photoshop.exe' }
    1 { 'Adobe Premiere Pro */Adobe Premiere Pro.exe' }
    2 { 'Adobe Media Encoder */Adobe Media Encoder.exe' }
    3 { 'Adobe After Effects */Support Files/AfterFX.exe' }
    4 { 'Adobe Illustrator */Support Files/Contents/Windows/Illustrator.exe' }
}
$job = Start-Job -ScriptBlock {
    $program = $using:program
    $proc_name = $program.Substring(($idx = $program.IndexOf('\') + 1), $program.Length - $idx - 4)
    $killable = [System.Collections.Generic.HashSet[string]]('Adobe Crash Processor', 'AdobeIPCBroker', 'CCXProcess', 'CCLibrary')
    $proc = Start-Process -PassThru "C:/Program Files/Adobe/$program"
    Start-Sleep 20
    foreach ($_ in (Get-Process | Sort-Object -Descending -Property StartTime)) {
        if ($_.Name -eq $proc_name) {
            break
        }
        if ($killable.Contains($_.Name)) {
            Stop-Process -Force $_
        }
    }
    Wait-Process -InputObject $proc
    Get-Process | ForEach-Object {
        if ($killable.Contains($_.Name)) {
            Stop-Process -Force $_
        }
    }
}
if ($myInvocation.InvocationName -eq '&') {
    Wait-Job $job
}

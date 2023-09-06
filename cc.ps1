using namespace System.Management.Automation.Host
$program = $host.ui.PromptForChoice(
    'Enter the letter corrosponding to the CC program you want to launch:',
    $null,
    [ChoiceDescription[]](
        [ChoiceDescription]::new('Photo&shop'),
        [ChoiceDescription]::new('&Premiere Pro'),
        [ChoiceDescription]::new('&Media Encoder'),
        [ChoiceDescription]::new('&After Effects')
    ),
    $null
)
$program = switch ($program) {
    0 { 'Adobe Photoshop *\Photoshop.exe' }
    1 { 'Adobe Premiere Pro *\Adobe Premiere Pro.exe' }
    2 { 'Adobe Media Encoder *\Adobe Media Encoder.exe' }
    3 { 'Adobe After Effects *\Support Files\AfterFX.exe' }
}
$job = Start-Job -ScriptBlock {
    $program = $using:program
    $proc_name = $program.Substring(($idx = $program.IndexOf('\') + 1), $program.Length - $idx - 4)
    $killable = [System.Collections.Generic.HashSet[string]]('Adobe Crash Processor', 'AdobeIPCBroker', 'CCXProcess', 'CCLibrary', 'node', 'msedgewebview2')
    $proc = Start-Process -PassThru "C:\Program Files\Adobe\$program"
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
    'node', 'msedgewebview2' | ForEach-Object { $killable.Remove($_) }
    Get-Process | ForEach-Object {
        if ($killable.Contains($_.Name)) {
            Stop-Process -Force $_
        }
    }
}
if ($myInvocation.InvocationName -eq '&') {
    Wait-Job $job
}

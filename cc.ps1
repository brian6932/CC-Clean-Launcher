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
$programName = ''
$program = switch ($program) {
    0 { "Adobe Photoshop */$(($programName = 'Photoshop'))*.exe"; break }
    1 { "Adobe Premiere Pro */$(($programName = 'Adobe Premiere Pro'))*.exe"; break }
    2 { "Adobe Media Encoder */$(($programName = 'Adobe Media Encoder'))*.exe"; break }
    3 { "Adobe After Effects */Support Files/$(($programName = 'AfterFX'))*.exe"; break }
    4 { "Adobe Illustrator */Support Files/Contents/Windows/$(($programName = 'Illustrator'))*.exe"; break }
}
$job = Start-Job -ScriptBlock {
    $program = (Get-Item "$env:ProgramFiles/Adobe/$Using:program" | Sort-Object -Property LastWriteTime -Descending | Where-Object { $_.Name -cmatch "\A$Using:programName(?: \(Beta\))?\.exe\Z" })[0]
    $killable = [Collections.Generic.HashSet[string]](
        'Adobe Crash Processor',
        'AdobeExtensionsService',
        'AdobeIPCBroker',
        'AdobeNotificationClient',
        'CCLibrary',
        'CCXProcess',
        'Creative Cloud',
        'CoreSync'
    )
    $proc = Start-Process -PassThru $program
    Start-Sleep 20
    foreach ($_ in (Get-Process | Sort-Object -Descending -Property StartTime)) {
        if ($_.Name -eq $program.BaseName) {
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

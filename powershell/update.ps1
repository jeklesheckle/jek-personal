# Written by Jackson Pielstick

# runs all possible windows updates, restarting as many times as necessary.
# this script should be started initially by start.ps1, then by updater.bat until it finds
# no more available updates, then it should delete updater.bat and run the next script.

# Turn off UAC prompts
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

$updates = Get-WUList

# "if there are updates"
If (-NOT ($null -eq $updates)) {
    echo "Updates found:"
    Get-WUInstall -AcceptAll -AutoReboot
    # restart if you didn't have to just so the flow of the program works. Bit of a lazy solution.
    Restart-Computer
} Else {
    echo "No updates to install."
    # delete updater.bat from its path
    Remove-Item 'C:\Users\city\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.bat' -ErrorAction SilentlyContinue
    # run the next script
    & '.\dell.ps1'
}


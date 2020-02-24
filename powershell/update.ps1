# Written by Jackson Pielstick

# runs all possible windows updates, restarting as many times as necessary.
# this script should be started initially by start.ps1, then by updater.bat until it finds
# no more available updates, then it should delete updater.bat and run the next script.



$updates_downloaded = Download-WindowsUpdate
$updates_installed = Install-WindowsUpdate -AutoReboot

# "if there are updates"
If (($null -eq $updates_downloaded) -and ($null -eq $updates_installed)) {
    echo "No updates to install."
    # delete updater.bat from its path
    Remove-Item 'C:\Users\city\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.bat' -ErrorAction SilentlyContinue
    # run the next script
    # & '.\dell.ps1'
    Pause
} Else {
    # do something I guess
    echo "Updates found and installed."
    Pause
}


# Written by Jackson Pielstick

# runs all possible windows updates, restarting as many times as necessary.
# this script should be started initially by start.ps1, then by updater.bat until it finds
# no more available updates, then it should delete updater.bat and run the next script.

$updates = Get-WUList

# "if there are updates"
If (-NOT ($null -eq $updates)) {
    -Get-WUInstall -AcceptAll -AutoReboot
    # if you get here and you haven't restarted, restart anyway so that the logical flow of the program works
    Restart-Computer
} Else {
    # delete updater.bat from its path
    Remove-Item 'C:\Users\city\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.bat' -ErrorAction SilentlyContinue
    # run the next script
    & '.\dell.ps1'

    #stop execution
}


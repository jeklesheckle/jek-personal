#############################################################################################################
# Develped by Jackson Pielstick to set up new computers for the City of Salisbury
# ===========================================================================================================
# Development notes:
# -use variables to make sure paths and names are consistent between commands
# -change the name of pshell_wupdate.zip to reflect the name of the downloaded file
#
# CURRENT: Using the machine closest to me to sort out windows updates.
# NEXT: try and figure out Dell Command | Update updates next


# Don't forget to run it as admin ya goof

# After you get on the internet

# Set password on admin account and enable it
$Password = Read-Host "Enter admin password: "-AsSecureString
Get-LocalUser -Name "Administrator" | Set-LocalUser -Password $Password
Get-LocalUser -Name "Administrator" | Enable-LocalUser


# Set time zone to EST
Set-TimeZone "US Eastern Standard Time"
Get-TimeZone

# Restart time servce (should sync with time.windows.com and set the time right
Restart-Service -Name W32Time
timedate.cpl

# Install windows updates
# Downloads the WUpdate module from technet
    # create a temp folder in C if one does not exist
New-Item -Path "C:\" -Name "temp" -ItemType "directory" -ErrorAction "silentlycontinue"
    # download PSWindowsUpdate.zip from technet
Invoke-WebRequest -Uri "https://gallery.technet.microsoft.com/scriptcenter/2d191bcd-3308-4edd-9de2-88dff796b0bc/file/41459/47/PSWindowsUpdate.zip" -OutFile "C:\temp\pshell_wupdate.zip"
    # extract pshell_wupdate.zip into C:\Windows\System32\WindowsPowerShell\v1.0\Modules
Expand-Archive -LiteralPath "C:\temp\pshell_wupdate.zip" -DestinationPath "C:\Windows\System32\WindowsPowerShell\v1.0\Modules"
    # allows the powershell windows update module to be used
Set-ExecutionPolicy RemoteSigned -Force

    # install all windows updates
Get-WUList
Get-WUInstall -AcceptAll -AutoReboot
    # may have to have some sort of complicated startup looping thing to check for and 
    # install updates, depends on how many it lets you get at once

    # set executionpolicy back to Undefined
Set-ExecutionPolicy Undefined -Force
    # delete the files in temp
Remove-Item "C:\temp\pshell_wupdate.zip"


# After you sign into the admin account

# Turn on network discovery and file and printer sharing
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
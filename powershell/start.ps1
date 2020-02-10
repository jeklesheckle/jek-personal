#############################################################################################################
# Develped by Jackson Pielstick to set up new computers for the City of Salisbury
# ===========================================================================================================
# Development notes:
# -use variables to make sure paths and names are consistent between commands
# -change the name of pshell_wupdate.zip to reflect the name of the downloaded file
# -you might be able to automate the blue setup screen too
#
# CURRENT: Using the machine closest to me to sort out windows updates.
# NEXT: try and figure out Dell Command | Update updates next

# plan: have this main script run an updater script 
# updater should run windows updates with auto restart and everything
#     it should do this until Get-WUList returns no entries
# will also need a .bat script to autorun
# so have this script create the autorunner and run the update script
# then the autorunner will run the update script again on restart
# if the update script is run and there are no more updates, have it delete the autorunner
# and then run this script again


# Don't forget to run it as admin ya goof

# prompt to connect ethernet
Read-Host "Please connect the ethernet cable now"

# After you get on the internet

# Set password on admin account and enable it
echo "Setting admin password and enabling Administrator account"
$Password = Read-Host "Enter admin password: "-AsSecureString
Get-LocalUser -Name "Administrator" | Set-LocalUser -Password $Password
Get-LocalUser -Name "Administrator" | Enable-LocalUser

# Set time zone to EST
Set-TimeZone "US Eastern Standard Time"
Get-TimeZone

# Restart time servce (should sync with time.windows.com and set the time right
Restart-Service -Name W32Time
timedate.cpl
Read-Host "Please manually update the time if the time showing is incorrect"

# Install windows updates
echo "Installing updates. The computer will restart several times during this process"
# Downloads the WUpdate module from technet
    # create a temp folder in C if one does not exist
New-Item -Path "C:\" -Name "temp" -ItemType "directory" -ErrorAction SilentlyContinue
    # download PSWindowsUpdate.zip from technet
Invoke-WebRequest -Uri "https://gallery.technet.microsoft.com/scriptcenter/2d191bcd-3308-4edd-9de2-88dff796b0bc/file/41459/47/PSWindowsUpdate.zip" -OutFile "C:\temp\pshell_wupdate.zip"
    # extract pshell_wupdate.zip into C:\Windows\System32\WindowsPowerShell\v1.0\Modules
Expand-Archive -LiteralPath "C:\temp\pshell_wupdate.zip" -DestinationPath "C:\Windows\System32\WindowsPowerShell\v1.0\Modules" -ErrorAction SilentlyContinue
    # delete the files in temp
Remove-Item "C:\temp\pshell_wupdate.zip" -ErrorAction SilentlyContinue
    # allows the powershell windows update module to be used
Set-ExecutionPolicy RemoteSigned -Force

   # install all windows updates by running update.ps1 and creating update.bat
    # create update.bat    
New-Item 'C:\Users\city\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.bat'
    # get the path of update.ps1 on the thumb drive
$workingdirectory = (Get-Item -Path ".\").FullName
$filepath = $workingdirectory + '\update.ps1'
$batchcode = "powershell -noprofile -command `"&{ start-process powershell -ArgumentList `'-noprofile -file " + $filepath + "`' -verb RunAs}`""
    # tell update.bat to start update.ps1 on startup as administrator
Set-Content -Path 'C:\Users\city\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.bat' -Value $batchcode

    # run update.ps1
& '.\update.ps1'

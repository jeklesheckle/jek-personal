# Run this script after start.ps1

# Install windows updates
echo "Installing updates. The computer will restart several times during this process"

    # Downloads and installs PSWindowsUpdate using NuGet
Install-Module -Name PSWindowsUpdate –Force
    # Check to see if it's installed successfully
Get-Package -Name PSWindowsUpdate

# Downloads the WUpdate module from technet
    # create a temp folder in C if one does not exist
#New-Item -Path "C:\" -Name "temp" -ItemType "directory" -ErrorAction SilentlyContinue
    # change security protocol to allow download (pshell uses 1.0, need 1.2)
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    # download PSWindowsUpdate.zip from technet
#Invoke-WebRequest -Uri "https://gallery.technet.microsoft.com/scriptcenter/2d191bcd-3308-4edd-9de2-88dff796b0bc/file/41459/47/PSWindowsUpdate.zip" -OutFile "C:\temp\pshell_wupdate.zip"
    # extract pshell_wupdate.zip into C:\Windows\System32\WindowsPowerShell\v1.0\Modules
#Expand-Archive -LiteralPath "C:\temp\pshell_wupdate.zip" -DestinationPath "C:\Windows\System32\WindowsPowerShell\v1.0\Modules" -ErrorAction SilentlyContinue
    # delete the files in temp
#Remove-Item "C:\temp\pshell_wupdate.zip" -ErrorAction SilentlyContinue
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

# Turn off UAC prompts
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

    # run update.ps1
& '.\update.ps1'

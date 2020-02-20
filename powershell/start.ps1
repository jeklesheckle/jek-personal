# Run this program first, then run preupdate.ps1

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
# undoes everything harmful I did to make this work

# After you sign into the admin account

# Turn on network discovery and file and printer sharing
netsh advfirewall firewall set rule group="Network Discovery" new enable=No
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

# Turn UAC back on
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 1

# Uninstall Windows 10 Update Assistant
C:\Windows10Upgrade\Windows10UpgraderApp.exe /ForceUninstall
# Remove-Item C:\Windows\UpdateAssistant\* /Force  #unnecessary?
# this runs after the windows updates are complete

    # set executionpolicy back to Undefined
Set-ExecutionPolicy Undefined -Force
    # delete the files in temp
Remove-Item "C:\temp\pshell_wupdate.zip"



#################################################################################################################
##### This does not have anything to do with Dell updates, move into another file before final version

# After you sign into the admin account

# Turn on network discovery and file and printer sharing
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
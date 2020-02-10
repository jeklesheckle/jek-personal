# this runs after the windows updates are complete





#################################################################################################################
##### This does not have anything to do with Dell updates, move into another file before final version

# After you sign into the admin account

# Turn on network discovery and file and printer sharing
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

# After all is said and done, turn UAC back onto whatever the normal setting is
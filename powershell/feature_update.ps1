﻿# Installs the latest version of Windows. Will need to test and see if it can skip gens.
# written by StuartGeeves on Technet: https://social.technet.microsoft.com/Forums/office/en-US/51104081-4ed7-4fdd-8b12-5d1f5be532ae/windows-10-feature-update-via-cmd-powershell-or-gpo?forum=win10itprogeneral

$dir = 'C:\_Windows_FU\packages'
mkdir $dir
$webClient = New-Object System.Net.WebClient
$url = 'https://go.microsoft.com/fwlink/?LinkID=799445'
$file = "$($dir)\Win10Upgrade.exe"
$webClient.DownloadFile($url,$file)
Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /copylogs $dir'

# after this is done, see if anything is left over that needs to be cleaned up a la _Windows_FU
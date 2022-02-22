## Install and configure NiceDCV

"Download NiceDCV installer"
(New-Object System.Net.WebClient).DownloadFile("https://d1uj6qtbmh3dt5.cloudfront.net/2021.3/Servers/nice-dcv-server-x64-Release-2021.3-11591.msi", 'C:\Windows\Temp\nice-dcv-server.msi')

"Silent Install NiceDCV installer with default OWNER=matlab"
Start-Process msiexec.exe -Wait -ArgumentList '/i C:\Windows\Temp\nice-dcv-server.msi /quiet /norestart /l*v C:\Windows\Temp\dcv_install_msi.log AUTOMATIC_SESSION_OWNER=matlab'

Start-Sleep -s 10

"Set the Maximum number of concurrent clients per session"
New-ItemProperty -Path "Microsoft.PowerShell.Core\Registry::\HKEY_USERS\S-1-5-18\Software\GSettings\com\nicesoftware\dcv\session-management\automatic-console-session" -Name 'max-concurrent-clients' -PropertyType DWord -Value 1 -Force

"Enable NiceDCV clipboard feature"
New-ItemProperty -Path "Microsoft.PowerShell.Core\Registry::\HKEY_USERS\S-1-5-18\Software\GSettings\com\nicesoftware\dcv\clipboard" -Name 'enabled' -PropertyType DWord -Value 1 -Force

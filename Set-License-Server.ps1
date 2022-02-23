param($RLMServer)

if ($RLMServer.Length -ne 0){ 
New-ItemProperty -Path "Microsoft.PowerShell.Core\Registry::\HKEY_USERS\S-1-5-18\Software\GSettings\com\nicesoftware\dcv\license" -Name 'license-file' -PropertyType String -Value "5053@$RLMServer" -Force
}

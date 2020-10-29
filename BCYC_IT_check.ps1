$UserPath = "$($env:USERPROFILE)\Desktop\ITcheck.txt"
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
# Install-Module PSWindowsUpdate
Get-Date | Out-File -FilePath $UserPath
echo "---------- USER NAME ----------" | Out-File -FilePath $UserPath -Append
$env:UserName | Out-File -FilePath $UserPath -Append
echo "---------- COMPUTER NAME ----------" | Out-File -FilePath $UserPath -Append
$env:computername | Out-File -FilePath $UserPath -Append
echo "---------- ANTIVIRUS STATUS ----------" | Out-File -FilePath $UserPath -Append
Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Out-File -FilePath $UserPath -Append
wget https://s3-us-west-1.amazonaws.com/8086.ca/SwitchUACLevel.psm1 -OutFile out.psm1
Import-Module .\out.psm1
Get-Command -Module out
echo "---------- UAC STATUS ----------" | Out-File -FilePath $UserPath -Append
Get-UACLevel | Out-File -FilePath $UserPath -Append
Remove-Item .\out.psm1
echo "---------- OUTSTANDING UPDATES ----------" | Out-File -FilePath $UserPath -Append
Get-WindowsUpdate | Out-File -FilePath $UserPath -Append
echo "---------- BITLOCKER STATUS ----------" | Out-File -FilePath $UserPath -Append
manage-bde -status | Out-File -FilePath $UserPath -Append
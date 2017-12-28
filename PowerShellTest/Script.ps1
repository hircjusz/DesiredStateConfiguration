#
# Script.ps1
#
#Get-DSCResource | Select-Object –Property Name | Format-Wide –Column 2
$gc = Get-DscResource -Name MSFT_xChrome ; $gc.Properties
#Get-DscResource | Where-Object { $_.name -like "x*" -or $_.name -like "MSFT*" } | Select-Object -Property Name | Format-Wide -Column 2
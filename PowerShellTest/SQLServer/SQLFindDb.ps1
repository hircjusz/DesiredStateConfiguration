#
# SQLFindDb.ps1
#
$Server =New-Object Microsoft.SqlServer.Management.Smo.Server("DESKTOP-HPRUNBD\MSSQLSERVER2012")
$Server.Databases |ForEach-Object {Write-Host $_.Name -foregroundcolor cyan}

#
# BackUpDatabase.ps1
#
$Server = New-Object Microsoft.SqlServer.Management.Smo.Server("DESKTOP-HPRUNBD\MSSQLSERVER2012")
$bkup= New-Object Micr
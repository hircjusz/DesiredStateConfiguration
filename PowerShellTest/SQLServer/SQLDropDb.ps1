#
# SQLDropDb.ps1
#
$Server = New-Object Microsoft.SqlServer.Management.Smo.Server("DESKTOP-HPRUNBD\MSSQLSERVER2012")
$db=$Server.Databases["ConfigDb"]
#$db|Get-Member -MemberType Methods
$db.Drop()




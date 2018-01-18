#
# SQLCreateDb.ps1
#
#$Server =New-Object Microsoft.SqlServer.Management.Smo.Server("DESKTOP-HPRUNBD\MSSQLSERVER2012")
#$db =New-Object Microsoft.SqlServer.Management.Smo.Database($server, "ConfigDB")
#$db.Create()

## Setting options
$Server = New-Object Microsoft.SqlServer.Management.Smo.Server("DESKTOP-HPRUNBD\MSSQLSERVER2012")
$db =New-Object Microsoft.SqlServer.Management.Smo.Database($server, "ConfigDB")
$fg =New-Object Microsoft.SqlServer.Management.Smo.FileGroup ($db, 'PRIMARY')
$db.Filegroups.Add($fg)
$mdf =New-Object Microsoft.SqlServer.Management.Smo.DataFile($fg, "ConfigDB_Data")
$fg.Files.Add($mdf)
$mdf.FileName = "D:\SQLdata\ConfigDB_Data.mdf"
$mdf.Size = 25.0 * 1KB
$mdf.GrowthType = "Percent"
$mdf.Growth = 25.0
$mdf.IsPrimaryFile = "True"
$ldf =New-Object Microsoft.SqlServer.Management.Smo.LogFile($db, "ConfigDB_Log")
$db.LogFiles.Add($ldf)
$ldf.FileName = "D:\SQLdata\ConfigDB_Log.ldf"
$ldf.Size = 20.0 * 1KB
$ldf.GrowthType = "Percent"
$ldf.Growth = 20.0
$db.Create()
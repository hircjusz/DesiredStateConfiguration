#
# SQLServerConfiguration.ps1
#
$Server =New-Object Microsoft.SqlServer.Management.Smo.Server("DESKTOP-HPRUNBD\MSSQLSERVER2012")
$Server.Information.Properties | Select-Object Name, Value |Format-Table -auto
$Server.Settings.Properties | Select-Object Name, Value |Format-Table -auto
$Server.UserOptions.Properties | Select-Object Name, Value |Format-Table -auto
$Server.Configuration.Properties |Select-Object DisplayName, ConfigValue, RunValue, Description |Format-Table -auto

#
# SQLVersion.ps1
#
$Server = New-Object Microsoft.SqlServer.Management.Smo.Server("DESKTOP-HPRUNBD\MSSQLSERVER2012")
$ver = $Server.Information.Properties | Where {$_.name -eq "VersionString"}
switch ($ver.Value.SubString(0,9))
{
	"8.194.0" {Write-Host $svr "SQL Server 2000 RTM"; break}
	"8.384.0" {Write-Host $svr "SQL Server 2000 SP1"; break}
	"8.534.0" {Write-Host $svr "SQL Server 2000 SP2"; break}
	"8.760.0" {Write-Host $svr "SQL Server 2000 SP3"; break}
	"8.00.2039" {Write-Host $svr "SQL Server 2000 SP4"; break}
	"9.00.1399" {Write-Host $svr "SQL Server 2005 RTM"; break}
	"9.00.2047" {Write-Host $svr "SQL Server 2005 SP1"; break}
	"9.00.3042" {Write-Host $svr "SQL Server 2005 SP2"; break}
	"9.00.4035" {Write-Host $svr "SQL Server 2005 SP3"; break}
	"10.0.1300" {Write-Host $svr "SQL Server 2008 CTP6"; break}
	"10.0.1600" {Write-Host $svr "SQL Server 2008 RTM"; break}
	"10.0.2531" {Write-Host $svr "SQL Server 2008 SP1"; break}
	default {Write-Host $svr "version cannot be determined"; break}
}
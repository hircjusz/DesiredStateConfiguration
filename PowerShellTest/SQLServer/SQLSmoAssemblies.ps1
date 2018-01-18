#
# SQLSmoAssemblies.ps1
#
$null = [reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo")
[void][reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoEnum")
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null

$x=0
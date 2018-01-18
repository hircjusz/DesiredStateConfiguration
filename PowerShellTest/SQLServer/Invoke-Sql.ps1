#
# Invoke_Sql.ps1
#
Invoke-Sqlcmd -ServerInstance "DESKTOP-HPRUNBD\MSSQLSERVER2012" -Database "ConfigDB" -Query "SELECT comp.Computer, comp.Model, comp.RAM FROM Computers As comp"         
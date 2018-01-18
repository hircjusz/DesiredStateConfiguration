#
# ReadingData.ps1
#
$conn =New-Object System.Data.SqlClient.SqlConnection("Data Source=DESKTOP-HPRUNBD\MSSQLSERVER2012; Initial Catalog=ConfigDB;Integrated Security=SSPI")
$conn.Open()
$cmd1 = $conn.CreateCommand()
$cmd1.CommandText ="SELECT comp.Computer, comp.Model, comp.RAM
FROM Computers As comp"
##JOIN OS AS os ON comp.Computer = os.Computer
$data = $cmd1.ExecuteReader()
$dt = New-Object "System.Data.DataTable"
$dt.Load($data)
$dt | Format-Table -Autosize
$conn.Close()
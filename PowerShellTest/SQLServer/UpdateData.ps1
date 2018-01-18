#
# UpdateData.ps1
#
$conn =New-Object System.Data.SqlClient.SqlConnection("Data Source=DESKTOP-HPRUNBD\MSSQLSERVER2012; Initial Catalog=ConfigDB;Integrated Security=SSPI")
$conn.Open()
$cmd1 = $conn.CreateCommand()
$cmd1.CommandType = [System.Data.CommandType]::Text
$cmd1.CommandText ="
UPDATE Computers
SET Model = 'Virtual'
"
$cmd1.ExecuteNonQuery()
$conn.Close()
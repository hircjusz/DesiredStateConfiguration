#
# InsertData.ps1
#
$computer = "DESKTOP-HPRUNBD"
$comp = Get-WmiObject -ComputerName $computer -Class Win32_ComputerSystem |Select Name, Manufacturer, Model,CurrentTimeZone, TotalPhysicalmemory

$os = Get-WmiObject -ComputerName $computer -Class Win32_OperatingSystem | Select Name,Version,ServicePackMajorVersion,ServicePackMinorVersion,Manufacturer,WindowsDirectory, Locale,FreePhysicalMemory, TotalVirtualMemorySize,FreeVirtualMemory

$conn = New-Object System.Data.SqlClient.SqlConnection("Data Source=DESKTOP-HPRUNBD\MSSQLSERVER2012; Initial Catalog=ConfigDB;Integrated Security=SSPI")

$conn.Open()
$cmd1 = $conn.CreateCommand()
#$cmd1.CommandText ="INSERT Computers VALUES ('$($comp.Name)','$($comp.Manufacturer)', '$($comp.Model)',$($comp.CurrentTimeZone),$($comp.TotalPhysicalmemory/100000))"
$cmd1.CommandText ="INSERT Computers VALUES ('HPBRUND','MAN', 'MO',$($comp.CurrentTimeZone),2000)"
#$cmd1.ExecuteNonQuery()
#$cmd2 = $conn.CreateCommand()
#$cmd2.CommandText ="INSERT OS VALUES ('$($comp.Name)', '$($OS.Name)','$($OS.version)', $($OS.ServicePackMajorVersion),'$($OS.WindowsDirectory)'$($OS.TotalVirtualMemorySize))"
#$cmd2.ExecuteNonQuery()
#$conn.Close()
#
# ServerInfo.ps1
#
#Get-ServerInfo Get-ServerInfo {
#		param (
#		$computername = 'localhost'
#		)
#	$os = Get-WmiObject Win32_OperatingSystem -computer $computername |
#	Select @{l='ComputerName';e={$_.__SERVER}},
#	BuildNumber,ServicePackMajorVersion
#	$disk = Get-WmiObject Win32_LogicalDisk -filter "DeviceID='C:'" -computer $computername |
#	Select @{l='SysDriveFree';e={$_.FreeSpace / 1MB -as [int]}}
#	Write-Output "ComputerName`tBuildNumber`tSPVersion`tFreeSpace"
#	Write-Output "============`t===========`t=========`t========="
#	Write-Output ("{0}`t{1}`t{2}`t{3}" -f ($os.ComputerName),
#	($os.BuildNumber),($os.servicepackmajorversion),
#	($disk.sysdrivefree))
#}

function Get-ServerInfo {
	param( $computername='localhost')

	$os = Get-WmiObject Win32_OperatingSystem -ComputerName $computername

	$disk= Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" -ComputerName $computername

	$obj= New-Object -TypeName PSObject

	$obj|Add-Member -MemberType NoteProperty -Name ComputerName -Value $computername

	$obj|Add-Member -MemberType NoteProperty  -Name BuildNumber -Value ($os.BuildNumber)

	$obj | Add-Member -MemberType NoteProperty -Name SPVersion -Value ($os.ServicePackMajorVersion)
    
	$obj | Add-Member -MemberType NoteProperty -Name SysDriveFree -Value ($disk.free / 1MB -as [int])

	Write-Output $obj
}

Get-ServerInfo



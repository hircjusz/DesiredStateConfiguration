#
# GetOSInfo.ps1
#
function GetOSInfo 
{
param
(
[string]$name, 
[string]$logfile
)
try {
			$continue = $True 
			$os = Get-WmiObject Win32_OperatingSystem 
			-computerName $name -ea 'Stop' 
			} catch {
			if ($logFile -ne '') {
			$name | Out-File $logfile -append 
			}
			$continue = $False
			}
		if ($continue) { 
		$bios = Get-WmiObject Win32_BIOS 
		-computername $name
		$obj = New-Object PSObject i
		$obj | Add-Member NoteProperty ComputerName $name
		$obj | Add-Member NoteProperty OSBuild ($os.buildnumber)
		$obj | Add-Member NoteProperty BIOSSerial ($bios.serialnumber)
		$obj | Add-Member NoteProperty LastBoot `
		($os.ConvertToDateTime($os.lastbootuptime))
		Write-Output $obj j
}
}

function Get-OSInfo
{
[CmdletBinding()]
	param
(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True,
		ValueFromPipelineByPropertyName=$True)]
		[Alias('host')]
		[string[]]$computerName,
		[string]$logFile = ''
	)
BEGIN
	{
		if ($logFile -ne '') {
		Del -Path $logFile -ErrorAction 'SilentlyContinue'
		}
	}
	PROCESS
		{
		foreach ($name in $computername) {
			GetOSInfo $name $logFile
			}
		  }
}

#Get-OSInfo
New-Alias goi Get-OSInfo
Export-ModuleMember -function Get-OSInfo
Export-ModuleMember -alias goi
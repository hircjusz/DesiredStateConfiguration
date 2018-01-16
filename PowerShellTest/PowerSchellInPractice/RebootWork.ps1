function RebootWork {
param([string]$computername)
Get-WmiObject Win32_OperatingSystem -computer $computername |
Invoke-WmiMethod -name Reboot | Out-Null
}

	function Reboot-Server {
		[CmdletBinding(SupportsShouldProcess=$True,
		ConfirmImpact='High')]
			param (
				[Parameter(Mandatory=$True,
				ValueFromPipeline=$True,
				ValueFromPipelineByPropertyName=$True)]
				[Alias('host')]
				[string[]]$computername
			)
			BEGIN {}
			PROCESS {
					foreach ($computer in $computername) {
					if ($pscmdlet.ShouldProcess($computer)) {
					RebootWork -computername $computer
				}
		}
	}
}

Add-PSSnapin SqlServerCmdletSnapin100


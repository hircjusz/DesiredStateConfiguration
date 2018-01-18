#
# SQLHealth.ps1
#
Get-Service *sql*|sort -Property Displayname | foreach{

	if($_.Status -eq "Stopped"){
		Write-Host $_.DisplayName, "is" $_.Status -ForegroundColor Red -BackgroundColor White
	}
	Else{
		Write-Host $_.DisplayName,"is" $_.Status
	}

	Get-Service $_.Name| select -ExpandProperty ServicesDependedOn| foreach{
		if($_.Status -eq "Stopped"){
			Write-Host  "is dependent on" ,$_.DisplayName,"which is" -ForegroundColor Red -BackgroundColor White
		}Else{
			Write-Host "is depedent on"
		}
	}
}



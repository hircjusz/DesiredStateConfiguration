#
# ForEachConstruct.ps1
#


$services = Get-Service
ForEach ($service in $services) {
Write-Host $service.Name
}
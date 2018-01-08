#
# Pipeline.ps1
#

#Get-Service | Where-Object -filter { $_.Status -eq 'Running' }
#Get-Process|Get-Member

#Get-Service -computername (Get-Content c:\names.txt | Where-Object -filter { $_ -notlike '*dc' }) | Where-Object -filter { $_.Status -eq 'Running' }
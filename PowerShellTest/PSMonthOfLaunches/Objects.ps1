#
# Objects.ps1
#
#Get-Process|Get-Member
#Get-Process | Select Name,ID,VM,PM | ConvertTo-HTML | Out-File test3.html

#Get-Process 
Get-Process | Format-Table -property *
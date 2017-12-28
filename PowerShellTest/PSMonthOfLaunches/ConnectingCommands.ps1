#
# ConnectingCommands.ps1
#

#---------Script 1 -----------------------#
#Get-EventLog Security -newest 100
#Get-Process | Export-CSV procs.csv

#---------Script 2 -----------------------#
#Get-Process | Export-CliXML reference.xml

#Diff -reference (Import-CliXML reference.xml) -difference (Get-Process) -property Name

#---------Script 3 -----------------------#
#Dir|Out-File DirectoryList.txt
#Dir|Out-GridView -Title DirectoryList

#Get-Service | ConvertTo-HTML | Out-File services.html

#---------Script 4 -----------------------#
#Get-Process -Name Notepad| Stop-Process
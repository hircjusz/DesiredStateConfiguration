#
# Start.ps1
#
$proc=Get-Process
#$proc| Where-Object {$proc.Handles -gt 500}
#$proc|Where-Object {$_.CPU -gt 100}

#$proc|Sort-Object -Property WS -Descending | Select-Object -First 5

##Listing 1.3 Comparing files
#Compare -ReferenceObject chap01v1.txt -DifferenceObject chap01v2.txt

#Listing 1.8 Using a calculated property in Select-Object
#$now=Get-Date
#Get-Process|Where-Object {$_.StartTime} |Select Name, @{Name="Run Time";Expression={[int]($now - $_.StartTime).TotalMinutes}} | Sort "Run Time" -Descending | Format-Table –AutoSize

#	Get-ChildItem "C:\Windows" | Where{!$_.PsIsContainer} |
#		ForEach-Object {
#		if ($_.Length -gt 1MB) {
#		Remove-Item $_.Fullname -WhatIf
#		}
#		elseif ($_.Length -gt 0.5MB){
#		Write-Host $_.Name, $_.Length, `
#		" will be removed if more space required" `
#		-ForegroundColor Yellow
#		}
#		else{
#		if ($_.Length -gt 0.25MB){
#		Write-Host $_.Name, $_.Length, `
#		" will be removed in third wave" `
#		-ForegroundColor Blue
#		}
#	}
#}

#2.7.
#Language features 51
#$Out1 = @"
#$count files are smaller than 1MB and occupy $total_size bytes
#"@
#$Out2 = @"
#$count_big files are bigger than 1MB and occupy $total_size_big bytes
#"@
#Get-ChildItem "c:\Windows" |
# ForEach-Object `
#-Begin {
#$count = 0
#$total_size = 0
#$count_big = 0
#$total_size_big = 0
#} `
#-Process {
#if ($_.Length -gt 1MB) {
#$total_size_big += $_.Length
#$count_big ++
#}
#else {
#$total_size += $_.Length
#$count ++
#}
#} `
#-End {
#Write-Host $out1
#Write-Host $out2
#}

#Listing 2.8 Using a foreach loop
#$date = (Get-Date).Adddays(-10)
#$files = Get-ChildItem "c:\Windows"
#	foreach($file in $files){
#	if ($file.LastAccessTime -lt $date){
#		Write-Host $file
#	#Remove-Item -Path $file.FullName -WhatIf
#	}
#}

#Listing 2.9 Creating test folders and files with loops

#$data = 1..57
#$j = 1
#while ($j -le 10){
#$foldername = "Testfolder_$j"
#New-Item -ItemType directory -Name $foldername
#$j++
#for ($i=0; $i -le 10; $i++){
#$filename = "file_$i.txt"
#	Set-Content -Path "$foldername\$filename" -Value $data
#}
#}


#Get-WmiObject -Class Win32_OperatingSystem | Format-List

#[enum]::GetNames([System.Diagnostics.EventLogEntryType])

#function Write-EventLog
#{
#param([string]$msg="Default Message", [string]$type="Information")
#$log = New-Object System.Diagnostics.EventLog
#$log.set_log("Scripts")
#$log.set_source("PSscripts")
#$log.WriteEntry($msg,$type)
#}


#Write-EventLog -msg "Darek" -type "Information"


#[appdomain]::CurrentDomain.GetAssemblies() |Sort-Object -Property Fullname | Format-Table fullname

#function get-rsblog {
#$ie = New-Object -ComObject InternetExplorer.Application
#$ie.Navigate("http://richardsiddaway.spaces.live.com/")
#while ($ie.busy) { Start-Sleep -seconds 1 }
#$ie.Visible = $true
#}

#get-rsblog

#Get-WMIObject –list

#$c = [WMIClass]'Win32_Process'
#$c.Create("Notepad.exe")
#$x = New-Object -TypeName System.Management.ManagementClass -ArgumentList "Win32_Process"
#$x | Get-Member
#$x.Create("notepad.exe")

#Get-Process | Sort-Object CPU -Descending | Select -First 4 |
#Format-Table Name, @{Label="CPU(Min)"; Expression={$_.CPU/60}} -AutoSize

#$HardDisk = 3
#Get-WmiObject -Class Win32_LogicalDisk `
#-Filter "DriveType = $HardDisk" |
#Format-Table DeviceId, @{Label="Freespace(GB)";
#Expression={($_.FreeSpace/1GB).ToString("F04")}} -auto


#$HardDisk = 3
#Get-WmiObject -Class Win32_LogicalDisk `
#-Filter "DriveType = $HardDisk" |
#Select DeviceId, @{Name="Freespace(GB)";
#Expression={($_.FreeSpace/1GB).ToString("F04")}}


#$computer = Get-WmiObject -CompterName pcrs2 -Class Win32_OperatingSystem

#$a = New-Object –ComObject Shell.Application
#Get-ChildItem $a.Namespace(0x21).Self.Path |
#Sort LastWriteTime -Descending

$xl= New-Object -ComObject "Excel.Application"
#$xl.visible= $true
#$xlbooks =$xl.workbooks.Add()

#$word = New-Object -ComObject "Word.application"
#$word.visible = $true
#$doc = $word.Documents.Add()
#$doc.Activate()
#$word.Selection.Font.Name = "Cambria"
#$word.Selection.Font.Size = "20"
#$word.Selection.TypeText("PowerShell")
#$word.Selection.TypeParagraph()
#$word.Selection.Font.Name = "Calibri"
#$word.Selection.Font.Size = "12"
#$word.Selection.TypeText("The best scripting language in the world!")
#$word.Selection.TypeParagraph()
#$file = "c:\scripts\office\test.doc"
#$doc.SaveAs([REF]$file)
#$Word.Quit()


$testhome = "d:\powerschell"
#****************Listing  CreateNew Folder***********************************************
#New-Item -Name TestFolder -Path d:\powershell -ItemType Directory
#Listing 8.6 Creating files
#New-Item -Name testfile.txt -Path d:\powerschell -ItemType File -Value "This is a one line file"

#Get-Service | Out-File -FilePath d:\powerschell\sp.txt
#Get-Process | Out-File -FilePath d:\powerschell\sp.txt -Append
#Get-Process |
#Export-Csv -Path d:\powerschell\testprc.csv -NoTypeInformation

##
## Listing 8.8 Reading files
#Import-Csv -Path d:\powerschell\testprc.csv |Select Name, PeakPagedMemorySize, PeakWorkingSet,PeakVirtualMemorySize | Format-Table -AutoSize
#$result= Select-String -Path $pshome\*.txt -Pattern "sp" -SimpleMatch
 #Get-ChildItem -Path $testhome "*.txt" -Recurse


###
### Listing 8.16 Copy event logs
###

#$events=get-eventlog security|Select {$_.Message}
#$x=0

###
### Listing 8.17 Administring IIS throught WMI
####
#Get-WmiObject -Namespace 'root\webadministration' -List

#[system.reflection.assembly]::loadfrom("c:\windows\system32\inetsrv\`microsoft.web.administration.dll")
#$server = New-Object microsoft.web.administration.servermanager
#$server.Sites.Add(
#"TestNet", "http", "*:80:testnet.manticore.org", "c:\inetpub\testnet")
#$server.CommitChanges()


#function get-uptime{
#param([string] $name="")
#	Write-Host "Uptime for $name"
#}

#get-uptime "dc"

#Get-WmiObject -class Win32_LogicalDisk -computername localhost -filter "drivetype=3" 

param (
$computername = 'localhost'
)
Get-WmiObject -class Win32_LogicalDisk -computername $computername `
-filter "drivetype=3" |
Sort-Object -property DeviceID |
Format-Table -property DeviceID,@{l='FreeSpace(MB)';e={$_.FreeSpace / 1MB -as [int]}},@{l='Size(GB';e={$_.Size / 1GB -as [int]}},@{l='%Free';e={$_.FreeSpace / $_.Size * 100 -as [int]}}
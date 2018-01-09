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


[appdomain]::CurrentDomain.GetAssemblies() |Sort-Object -Property Fullname | Format-Table fullname
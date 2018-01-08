#
# IfStatement.ps1
#


#$textToMatch = Read-Host "Enter some text"
#$matchType = Read-Host "Apply Simple or Regex matching?"
#$pattern = Read-Host "Match pattern"
#if($matchType -eq "Simple")
#{
#$textToMatch -like $pattern
#}
#elseif($matchType -eq "Regex")
#{
#$textToMatch -match $pattern
#}
#else
#{
#Write-Host "Match type must be Simple or Regex"
#}



#for($counter = 0; $counter -lt 10; $counter++)
#{
#Write-Host "Processing item $counter"
#}

#$handleSum = 0;
#foreach($process in Get-Process |Where-Object { $_.Handles -gt 500 })
#{
#$handleSum += $process.Handles
#}
#$handleSum


#$command = "";
#while($command -notmatch "quit")
#{
#$command = Read-Host "Enter your command"
#}


#$validResponses = "Yes","No"
#$response = ""

#do
#{
#$response = read-host "Yes or No?"
#} while($validResponses -notcontains $response)
#"Got it."
#$response = ""


#do
#{
#$response = read-host "Yes or No?"
#} until($validResponses -contains $response)
#"Got it."


#for($counter = 0; $counter -lt 5; $counter++)
#{
#	for($counter2 = 0; $counter2 -lt 5; $counter2++)
#	{
#			if($counter2 -eq 2)
#			{
#				break
#			}
#			Write-Host "Processing item $counter,$counter2"
#	}
#}

#[System.Diagnostics.Process]::GetProcessById(0)

#$parameters = @{
#Path = "c:\temp"
#Recurse = $true
#}

#$scriptBlock = { "Hello World" }

$xml='<AddressBook>
<Person contactType="Personal">
<Name>Lee</Name>
<Phone type="home">555-1212</Phone>
<Phone type="work">555-1213</Phone>
</Person>
<Person contactType="Business">
<Name>Ariel</Name>
<Phone>555-1234</Phone>
</Person>
</AddressBook>'

#$xml | Select-Xml "/" | Select -Expand Node

#$xml | Select-Xml "/AddressBook" |Select -Expand Node

#$xml | Select-Xml "//Phone" | Select -Expand Node

#$xml | Select-Xml "//Phone/.." | Select -Expand Node

$xml | Select-Xml "//Phone/@type" |Select -Expand Node



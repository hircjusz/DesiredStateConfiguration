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



for($counter = 0; $counter -lt 10; $counter++)
{
Write-Host "Processing item $counter"
}

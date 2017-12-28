#
# TheObjectPipline.ps1
#
#$process=Get-Process | Where-Object { $_.WorkingSet -ge 20MB }

#$owner=Get-Process | sort CPU -desc | select -first 2 | Stop-Process
#dir | Get-Acl | select Owner | sort Owner | Get-Unique -asString
#Get-Service
#Get-Service|Group-Object Status
#Get-Service|Group-Object ServiceType

#function Verify-TextFile($file)
#{
#    if (!$file.EndsWith(".txt"))
#    {
#        Write-Host "$file is not a text file"
#        exit
#    }
#}


#$files = "Names.txt", "Names.doc", "Names2.xls"

#foreach ($file in $files)
#{
#    Verify-TextFile $file
#}

function Get-ScriptDirectory
{
    $invocation = $script:MyInvocation
    Split-Path $invocation.MyCommand.Path
}

function Get-LibraryPath($relativePath)
{
    $dir = Get-ScriptDirectory
    return Join-Path $dir $relativePath
}

 (Get-LibraryPath "Library1.ps1")

 function Count-Characters($file){

	 $content=""
	 if(Test-Path $file){
		$content=Get-Content $file

	 }
	 Write-Host "File contains $($content.Length) characters" 
 }

 Count-Characters C:\Users\Darek\Source\Repos\DesiredStateConfiguration\PowerShellTest\TheObjectPipline.ps1


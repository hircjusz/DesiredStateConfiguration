#
# CreateTable.ps1
#
$Server = New-Object Microsoft.SqlServer.Management.Smo.Server("DESKTOP-HPRUNBD\MSSQLSERVER2012")
$script =New-Object -Type System.Collections.Specialized.StringCollection
$script.Add("SET ANSI_NULLS On")
$script.Add("SET QUOTED_IDENTIFIER ON")


$script.Add("
CREATE TABLE [dbo].[Computers](
[ComputerID] [int]IDENTITY(1,1) NOT NULL,
[Computer] [char](12) NOT NULL,
[Manufacturer] [char](30) NOT NULL,
[Model] [char](25) NOT NULL,
[Timezone] [int] NOT NULL,
[RAM] [bigint] NOT NULL,
CONSTRAINT [PK_ComputerID] PRIMARY KEY CLUSTERED ([ComputerID] ASC))
ON [PRIMARY]")

$db = $server.Databases["ConfigDB"]

$extype =[Microsoft.SqlServer.Management.Common.ExecutionTypes]::ContinueOnError
$db.ExecuteNonQuery($script, $extype)



$Excel = New-Object -ComObject Excel.Application

$workbook = $Excel.Workbooks.Add()
$Sheet = $Workbook.Worksheets.Item("Sheet1")

$Row = 1
$Column = 1
$Sheet.Cells.Item($Row,$Column) = "First Column"


#https://4sysops.com/archives/excel-macros-with-powershell/
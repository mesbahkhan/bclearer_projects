'Create excel object
Set objExcel = CreateObject("Excel.Application")

' Open the excel sheet with the object, providing the file path
Set objWorkbook = objExcel.Workbooks.Open (WScript.Arguments(0))

'Find the count of excelsheets and iterate through the worksheet and find the name
'and store in a variable
for i=1 to objExcel.activeworkbook.sheets.count
mystr=objExcel.activeworkbook.sheets(i).name
mystr1= mystr1 + trim(mystr) + vbcrlf
'msgbox i & " " & mystr
Next 
objExcel.Quit
Set objExcel =NOTHING
Set objWorkbook =NOTHING

'create filesystem object to write to a text file
Set myFSO = CreateObject("Scripting.FileSystemObject")

'open textfile, provide the name
Set WriteStr = myFSO.OpenTextFile(WScript.Arguments(1), 8, True)

'write the info to the file
WriteStr.WriteLine mystr1
WriteStr.Close

'close all the objects created
SET WriteStuff = NOTHING
SET myFSO = NOTHING

'close the workbook and application
objExcel.DisplayAlerts = False
objExcel.Application.Quit
objExcel.ActiveWorkbook.Close 


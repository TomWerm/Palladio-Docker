Const ForReading = 1
Const ForWriting = 2

strFileName = Wscript.Arguments(0)
strOldText = Wscript.Arguments(1)
strNewText = Wscript.Arguments(2)
strNewTexta = Cstr(Wscript.Arguments(3))
strNewTextb = Cstr(Wscript.Arguments(4))
strNewTextc = Cstr(Wscript.Arguments(5))
strNewTextd = Cstr(Wscript.Arguments(6))
strGenFileName = Wscript.Arguments(7)

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName, ForReading)

strText = objFile.ReadAll
objFile.Close

Dim RegX
Set RegX = NEW RegExp
Dim MyString, SearchPattern, ReplacedText
MyString = strText
SearchPattern = strOldText
ReplaceString = strNewText & Chr(34) & strNewTexta & Chr(34) & strNewTextb & Chr(34) & strNewTextc & Chr(34) & strNewTextd
RegX.Pattern = SearchPattern
RegX.Global = True
strNewText = RegX.Replace(MyString, ReplaceString)

With (CreateObject("Scripting.FileSystemObject"))
  If .FileExists(strGenFileName) Then
  Else 
    Set oTxtFile = .CreateTextFile(strGenFileName)
    oTxtFile.Close
  End If 
End With
Set objFile = objFSO.OpenTextFile(strGenFileName, ForWriting)
objFile.Write strNewText
objFile.Close
Sub stock_data()

        
Dim WS As Worksheet
    For Each WS In ActiveWorkbook.Worksheets
WS.Activate

   ' Last Row
     LastRow = WS.Cells(Rows.Count, 1).End(xlUp).Row

   ' Headers
     Cells(1, "I").Value = "<Ticker>"
     Cells(1, "J").Value = "<Total Stock Volume>"
     
   'Definying variables
     Dim Ticker_Name As String
     Dim Volume As Double
     Volume = 0
     Dim Column As Integer
     Column = 1
     Dim i As Long
     Dim Row As Double
     Row = 2
        

  
      For i = 2 To LastRow
    'Comparing the same ticker symbol
     If Cells(i + 1, Column).Value <> Cells(i, Column).Value Then
    ' Set Ticker name
      Ticker_Name = Cells(i, Column).Value
      Cells(Row, Column + 8).Value = Ticker_Name
 
     ' Add Total Volume
        Volume = Volume + Cells(i, Column + 6).Value
        Cells(Row, Column + 9).Value = Volume
     ' Add one to the summary table row
         Row = Row + 1
     ' reset the Volumn Total
         Volume = 0
     'if cells are the same ticker
         Else
      Volume = Volume + Cells(i, Column + 6).Value
         End If
      Next i
   
              
    Next WS
        
End Sub




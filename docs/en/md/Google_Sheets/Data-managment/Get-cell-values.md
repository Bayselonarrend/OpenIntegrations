---
sidebar_position: 3
---

# Get cell values
 Gets cell values of the table



`Function GetCellValues(Val Token, Val Spreadsheet, Val CellsArray = "", Val Sheet = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Spreadsheet | --spreadsheet | String | SpreadsheetID |
  | CellsArray | --cells | Array of String | Array of A1 type cells to get (whole sheet if not filled) |
  | Sheet | --sheetname | String | Sheet name (first sheet by default) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Spreadsheet = "1O3ZKBO8P6IhCsFCYl-QRW_7Kjp2DQWef2234pjZmsBg";
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Result = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, CellsArray, Sheet);
```
 



```json title="Result"
{
 "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
 "valueRanges": [
  {
   "range": "Sheet2!B2",
   "majorDimension": "ROWS",
   "values": [
    [
     "ThisIsB2"
    ]
   ]
  },
  {
   "range": "Sheet2!A3",
   "majorDimension": "ROWS",
   "values": [
    [
     "ThisIsA3"
    ]
   ]
  },
  {
   "range": "Sheet2!B4",
   "majorDimension": "ROWS",
   "values": [
    [
     "ThisIsB4"
    ]
   ]
  }
 ]
}
```

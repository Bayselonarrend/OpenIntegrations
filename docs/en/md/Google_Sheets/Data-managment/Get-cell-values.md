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
    Token       = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Spreadsheet = "1pqjld5QO6zoOe8zPMthfFhGcwwaE6FdlDyw-UHgEP5c";
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Result = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, CellsArray, Sheet);
```



```sh title="CLI command example"
    
  oint gsheets GetCellValues --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --cells %cells% --sheetname "Sheet2"

```

```json title="Result"

```

---
sidebar_position: 2
---

# Clear cells
 Clears the value in cells



`Function ClearCells(Val Token, Val Spreadsheet, Val CellsArray, Val Sheet = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Spreadsheet | --spreadsheet | String | SpreadsheetID |
  | CellsArray | --cells | Array of String | Array of cells like A1 to be cleared |
  | Sheet | --sheetname | String | Sheet name (first sheet by default) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Spreadsheet = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Result = OPI_GoogleSheets.ClearCells(Token, Spreadsheet, CellsArray, Sheet);
```



```sh title="CLI command example"
    
  oint gsheets ClearCells --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --cells %cells% --sheetname "Sheet2"

```

```json title="Result"
{
 "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
 "clearedRanges": [
  "Sheet2!B2",
  "Sheet2!A3",
  "Sheet2!B4"
 ]
}
```

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
    Token       = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Spreadsheet = "1ybexzLz6S_cthsQNdMkNbOlAD3yjFzdArRm_589T_FQ";
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

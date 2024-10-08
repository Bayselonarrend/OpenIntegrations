﻿---
sidebar_position: 1
---

# Set cell values
 Sets sheet cell values



`Function SetCellValues(Val Token, Val Spreadsheet, Val ValueMapping, Val Sheet = "", Val MajorDimension = "COLUMNS") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Spreadsheet | --spreadsheet | String | SpreadsheetID |
  | ValueMapping | --data | Map Of KeyAndValue | Fill data where the key is the cell name like A1 |
  | Sheet | --sheetname | String | Sheet name (first sheet by default) |
  | MajorDimension | --dim | String | Main dimension when filling the array range |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Spreadsheet = "1IIUxPvgvrPCB92SXFISbKBFLAbmbHUIu_OysyC9w3Ow";
    Sheet       = "Sheet2";

    ValueMapping = New Map;
    ValueMapping.Insert("A1", "ThisIsA1");
    ValueMapping.Insert("A2", "ThisIsA2");
    ValueMapping.Insert("B2", "ThisIsB2");
    ValueMapping.Insert("B3", "ThisIsB3");
    ValueMapping.Insert("A3", "ThisIsA3");
    ValueMapping.Insert("A4", "ThisIsA4");
    ValueMapping.Insert("B1", "ThisIsB1");
    ValueMapping.Insert("B4", "ThisIsB4");

    Result = OPI_GoogleSheets.SetCellValues(Token, Spreadsheet, ValueMapping, Sheet);
```



```sh title="CLI command example"
    
  oint gsheets SetCellValues --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --data %data% --sheetname "Sheet2" --dim %dim%

```

```json title="Result"
{
 "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
 "totalUpdatedRows": 4,
 "totalUpdatedColumns": 2,
 "totalUpdatedCells": 8,
 "totalUpdatedSheets": 1,
 "responses": [
  {
   "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
   "updatedRange": "Sheet2!A1",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
   "updatedRange": "Sheet2!A2",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
   "updatedRange": "Sheet2!B2",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
   "updatedRange": "Sheet2!B3",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
   "updatedRange": "Sheet2!A3",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
   "updatedRange": "Sheet2!A4",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
   "updatedRange": "Sheet2!B1",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1p_i-5lmOKdBEbi88O0SkXq2Q_gG0c4EY7N_wtWGKSCs",
   "updatedRange": "Sheet2!B4",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  }
 ]
}
```

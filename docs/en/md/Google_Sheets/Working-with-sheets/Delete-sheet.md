---
sidebar_position: 2
---

# Delete sheet
 Deletes a sheet from the spreadsheet



`Function DeleteSheet(Val Token, Val Spreadsheet, Val Sheet) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Spreadsheet | --spreadsheet | String | Spreadsheet identifier |
  | Sheet | --sheet | String | IdentifierOfSheetToDelete |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Spreadsheet = "1IIUxPvgvrPCB92SXFISbKBFLAbmbHUIu_OysyC9w3Ow";
    Sheet       = "1572277025";

    Result = OPI_GoogleSheets.DeleteSheet(Token, Spreadsheet, Sheet);
```



```sh title="CLI command example"
    
  oint gsheets DeleteSheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --sheet "1790807910"

```

```json title="Result"
{
 "spreadsheetId": "13Z9DGg85xohy28PAKNvyeRR6Zx0mk7Ofm0HtRbLo4xA",
 "replies": [
  {}
 ]
}
```

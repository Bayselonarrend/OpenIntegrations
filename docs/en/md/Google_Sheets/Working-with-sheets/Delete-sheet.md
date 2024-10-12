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
    Token       = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Spreadsheet = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";
    Sheet       = "326904167";

    Result = OPI_GoogleSheets.DeleteSheet(Token, Spreadsheet, Sheet);
```



```sh title="CLI command example"
    
  oint gsheets DeleteSheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --sheet "1790807910"

```

```json title="Result"
{
 "spreadsheetId": "1psqJkXdtlHOc7Qzr4ficNkFth5dWLl0HdmMDhSTM7ZQ",
 "replies": [
  {}
 ]
}
```

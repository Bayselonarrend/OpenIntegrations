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
    Token       = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Spreadsheet = "187aOtcDnHwx1wmHhU-QuGHMWyqZptBif9IVa_tBanNk";
    Sheet       = "1651217167";

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

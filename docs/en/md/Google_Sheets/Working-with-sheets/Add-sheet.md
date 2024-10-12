---
sidebar_position: 1
---

# Add sheet
 Adds a new sheet to the spreadsheet



`Function AddSheet(Val Token, Val Spreadsheet, Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Spreadsheet | --spreadsheet | String | Spreadsheet identifier |
  | Name | --title | String | NewSheetName |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Spreadsheet = "187aOtcDnHwx1wmHhU-QuGHMWyqZptBif9IVa_tBanNk";
    Name        = "TestSheet";

    Result = OPI_GoogleSheets.AddSheet(Token, Spreadsheet, Name);
```



```sh title="CLI command example"
    
  oint gsheets AddSheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "TestSheet"

```

```json title="Result"
{
 "spreadsheetId": "1psqJkXdtlHOc7Qzr4ficNkFth5dWLl0HdmMDhSTM7ZQ",
 "replies": [
  {
   "addSheet": {
    "properties": {
     "sheetId": 1019462179,
     "title": "TestSheet",
     "index": 2,
     "sheetType": "GRID",
     "gridProperties": {
      "rowCount": 1000,
      "columnCount": 26
     }
    }
   }
  }
 ]
}
```

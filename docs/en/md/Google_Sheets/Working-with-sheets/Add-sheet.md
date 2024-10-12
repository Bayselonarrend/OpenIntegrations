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
    Token       = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Spreadsheet = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";
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

---
sidebar_position: 3
---

# Copy sheet
 Copies a sheet from one spreadsheet to another



`Function CopySheet(Val Token, Val From, Val Target, Val Sheet) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | From | --from | String | Source spreadsheet ID |
  | Target | --to | String | Destination spreadsheet ID |
  | Sheet | --sheet | String | CopiedSheetID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token  = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    From   = "187aOtcDnHwx1wmHhU-QuGHMWyqZptBif9IVa_tBanNk";
    Target = "1B7pKSbGt8_dD-LOkI1VAJEiKdv3LNYJ7yYLXADK4Rb0";
    Sheet  = "1651217167";

    Result = OPI_GoogleSheets.CopySheet(Token, From, Target, Sheet);
```



```sh title="CLI command example"
    
  oint gsheets CopySheet --token %token% --from "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --to "1tPDQHmduH9NASRhy0I-a6--ebNNJ5A6wXhhTRcNhD7s" --sheet "25093199"

```

```json title="Result"
{
 "sheetId": 1272386935,
 "title": "Sheet1 (копия)",
 "index": 2,
 "sheetType": "GRID",
 "gridProperties": {
  "rowCount": 1000,
  "columnCount": 26
 }
}
```

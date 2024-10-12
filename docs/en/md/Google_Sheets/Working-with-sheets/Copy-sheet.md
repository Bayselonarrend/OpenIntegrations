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
    Token  = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    From   = "1TTfKyO7fTBJkDluNvVYONXAadeC_Kv39A4sHKqOH_GM";
    Target = "15XCsyFHpc0flD9UmQb4Q-q7srcGzOPRAnNHCBUGR3tY";
    Sheet  = "832626602";

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

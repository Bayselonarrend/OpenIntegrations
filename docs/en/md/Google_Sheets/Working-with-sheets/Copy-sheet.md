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
    Token  = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    From   = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";
    Target = "1KrDW917ri-VT9BAnejvb0ysLjEEWyMSQ04bvNJjKM0o";
    Sheet  = "326904167";

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

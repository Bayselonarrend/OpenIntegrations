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
  
  From = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
  Target = "1tPDQHmduH9NASRhy0I-a6--ebNNJ5A6wXhhTRcNhD7s";
  Sheet = "25093199";
  
  Response = OPI_GoogleSheets.CopySheet(Token, From, Target, Sheet); //Map
  Response = OPI_Tools.JSONString(Response); //JSON string
```



```sh title="CLI command example"
    
  oint gsheets CopySheet --token %token% --from "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --to "1tPDQHmduH9NASRhy0I-a6--ebNNJ5A6wXhhTRcNhD7s" --sheet "25093199"

```

```json title="Result"
  {
  "sheetId": 1790807910,
  "title": "Sheet2 (copy)",
  "index": 2,
  "sheetType": "GRID",
  "gridProperties": {
  "rowCount": 1000,
  "columnCount": 26
  }
  }

```

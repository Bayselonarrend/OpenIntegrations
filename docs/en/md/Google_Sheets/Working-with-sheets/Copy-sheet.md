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
    Token  = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    From   = "1O3ZKBO8P6IhCsFCYl-QRW_7Kjp2DQWef2234pjZmsBg";
    Target = "1CMjanhXxVBuxSLj6tAIya9LldwB5crkM-7DJuiutM1k";
    Sheet  = "501655435";

    Result = OPI_GoogleSheets.CopySheet(Token, From, Target, Sheet);
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

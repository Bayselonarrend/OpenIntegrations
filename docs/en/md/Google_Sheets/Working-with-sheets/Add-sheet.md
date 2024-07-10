---
sidebar_position: 1
---

# Add sheet
 Adds a new sheet to the spreadsheet


<br/>


`Function AddSheet(Val Token, Val Spreadsheet, Val Name) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Spreadsheet | --spreadsheet | String | Spreadsheet identifier |
 | Name | --title | String | NewSheetName |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
Spreadsheet = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 Name = "TestSheet";
 
 Response = OPI_GoogleSheets.AddSheet(Token, Spreadsheet, Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint gsheets AddSheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "TestSheet"

```

```json title="Result"
{
 "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
 "replies": [
 {
 "addSheet": {
 "properties": {
 "sheetId": 321892522,
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

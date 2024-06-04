---
sidebar_position: 1
---

# AddSheet
 Adds a new sheet to the book


*Function AddSheet(Val Token, Val Book, Val Name) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Book | --spreadsheet | String | BookIdentifier |
 | Name | --title | String | NewSheetName |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 Book = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 Name = "TestSheet";
 
 Response = OPI_GoogleSheets.AddSheet(Token, Book, Name); //Map
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

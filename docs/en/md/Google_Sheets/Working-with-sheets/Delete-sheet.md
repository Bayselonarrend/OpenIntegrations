---
sidebar_position: 2
---

# Delete sheet
 Deletes a sheet from the spreadsheet


*Function DeleteSheet(Val Token, Val Spreadsheet, Val Sheet) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Spreadsheet | --spreadsheet | String | Spreadsheet identifier |
 | Sheet | --sheet | String | IdentifierOfSheetToDelete |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

```bsl title="Code example"
	
 
 Spreadsheet = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 Sheet = "1790807910";
 
 Response = OPI_GoogleSheets.DeleteSheet(Token, Spreadsheet, Sheet); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
 
	
```

```sh title="CLI command example"
 
 oint gsheets DeleteSheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --sheet "1790807910"


```


```json title="Result"

{
 "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
 "replies": [
 {}
 ]
 }

```

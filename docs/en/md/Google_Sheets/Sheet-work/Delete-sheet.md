---
sidebar_position: 2
---

# DeleteSheet
 Deletes a sheet from the book


*Function DeleteSheet(Val Token, Val Book, Val Sheet) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Book | --spreadsheet | String | BookIdentifier |
 | Sheet | --sheet | String | IdentifierOfSheetToDelete |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 Book = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 Sheet = "1790807910";
 
 Response = OPI_GoogleSheets.DeleteSheet(Token, Book, Sheet); //Map
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

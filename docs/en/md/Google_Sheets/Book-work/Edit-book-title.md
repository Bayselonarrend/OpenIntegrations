---
sidebar_position: 3
---

# ChangeBookName
 Changes the name of the existing book


*Function EditBookTitle(Val Token, Val Book, Val Name) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Book | --spreadsheet | String | BookID |
 | Name | --title | String | New name |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 Book = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 Name = "Test table (change.)";
 
 Response = OPI_GoogleSheets.EditBookTitle(Token, Book, Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
 
	
```

```sh title="CLI command example"
 
 oint gsheets EditBookTitle --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Test table (change.)"


```


```json title="Result"

{
 "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
 "replies": [
 {}
 ]
 }

```

---
sidebar_position: 2
---

# Clear cells
 Clears the value in cells


*Function ClearCells(Val Token, Val Book, Val CellsArray, Val Sheet = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Book | --spreadsheet | String | BookID |
 | CellsArray | --cells | Array of String | Array of cells like A1 to be cleared |
 | Sheet | --sheetname | String | Sheet name (first sheet by default) |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

```bsl title="Code example"
	
 
 CellsArray = New Array;
 CellsArray.Add("B2");
 CellsArray.Add("A3");
 CellsArray.Add("B4");
 
 Book = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 Sheet = "Sheet2";
 
 Response = OPI_GoogleSheets.ClearCells(Token, Book, CellsArray, Sheet); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
 
	
```

```sh title="CLI command example"
 
 oint gsheets ClearCells --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --cells %cells% --sheetname "Sheet2"


```


```json title="Result"

{
 "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
 "clearedRanges": [
 "'Sheet2'!B2",
 "'Sheet2'!A3",
 "'Sheet2'!B4"
 ]
 }

```

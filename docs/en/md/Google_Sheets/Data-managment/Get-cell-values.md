---
sidebar_position: 3
---

# Get cell values
 Gets cell values of the table


<br/>


`Function GetCellValues(Val Token, Val Spreadsheet, Val CellsArray = "", Val Sheet = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Spreadsheet | --spreadsheet | String | SpreadsheetID |
 | CellsArray | --cells | Array of String | Array of A1 type cells to get (whole sheet if not filled) |
 | Sheet | --sheetname | String | Sheet name (first sheet by default) |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
 
 CellsArray = New Array;
 CellsArray.Add("B2");
 CellsArray.Add("A3");
 CellsArray.Add("B4");
 
 Spreadsheet = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 Sheet = "Sheet2";
 
 Response = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, CellsArray, Sheet); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint gsheets GetCellValues --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --cells %cells% --sheetname "Sheet2"

```

```json title="Result"
{
 "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
 "valueRanges": [
 {
 "range": "'Sheet2'!B2",
 "majorDimension": "ROWS",
 "values": [
 [
 "ThisIsB2"
 ]
 ]
 },
 {
 "range": "'Sheet2'!A3",
 "majorDimension": "ROWS",
 "values": [
 [
 "ThisIsA3"
 ]
 ]
 },
 {
 "range": "'Sheet2'!B4",
 "majorDimension": "ROWS",
 "values": [
 [
 "ThisIsB4"
 ]
 ]
 }
 ]
 }
```

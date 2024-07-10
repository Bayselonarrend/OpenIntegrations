---
sidebar_position: 3
---

# Change spreadsheet name
 Changes the name of the existing spreadsheet



`Function EditSpreadsheetTitle(Val Token, Val Spreadsheet, Val Name) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Spreadsheet | --spreadsheet | String | SpreadsheetID |
 | Name | --title | String | New name |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
 
 Spreadsheet = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 Name = "Test table (changed.)";
 
 Response = OPI_GoogleSheets.EditSpreadsheetTitle(Token, Spreadsheet, Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint gsheets EditSpreadsheetTitle --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Test table (changed.)"

```

```json title="Result"
{
 "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
 "replies": [
 {}
 ]
 }
```

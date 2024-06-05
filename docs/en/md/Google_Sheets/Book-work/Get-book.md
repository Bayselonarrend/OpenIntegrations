---
sidebar_position: 2
---

# GetBook
 Gets information about the book by ID


*Function GetBook(Val Token, Val Identifier) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Identifier | --spreadsheet | String | BookIdentifier |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 Identifier = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
 
 Response = OPI_GoogleSheets.GetBook(Token, Identifier); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint gsheets GetBook --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc"


```


```json title="Result"

{
 "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
 "properties": {
 "title": "Test table (change.)",
 "locale": "ru_RU",
 "autoRecalc": "ON_CHANGE",
 "timeZone": "Etc/GMT",
 "defaultFormat": {
 "backgroundColor": {
 "red": 1,
 "green": 1,
 "blue": 1
 },
 "padding": {
 "top": 2,
 "right": 3,
 "bottom": 2,
 "left": 3
 },
 "verticalAlignment": "BOTTOM",
 "wrapStrategy": "OVERFLOW_CELL",
 "textFormat": {
 "foregroundColor": {},
 "fontFamily": "arial,sans,sans-serif",
 "fontSize": 10,
 "bold": false,
 "italic": false,
 "strikethrough": false,
 "underline": false,
 "foregroundColorStyle": {
 "rgbColor": {}
 }
 },
 "backgroundColorStyle": {
 "rgbColor": {
 "red": 1,
 "green": 1,
 "blue": 1
 }
 }
 },
 "spreadsheetTheme": {
 "primaryFontFamily": "Arial",
 "themeColors": [
 {
 "colorType": "TEXT",
 "color": {
 "rgbColor": {}
 }
 },
 {
 "colorType": "BACKGROUND",
 "color": {
 "rgbColor": {
 "red": 1,
 "green": 1,
 "blue": 1
 }
 }
 },
 {
 "colorType": "ACCENT1",
 "color": {
 "rgbColor": {
 "red": 0.25882354,
 "green": 0.52156866,
 "blue": 0.95686275
 }
 }
 },
 {
 "colorType": "ACCENT2",
 "color": {
 "rgbColor": {
 "red": 0.91764706,
 "green": 0.2627451,
 "blue": 0.20784314
 }
 }
 },
 {
 "colorType": "ACCENT3",
 "color": {
 "rgbColor": {
 "red": 0.9843137,
 "green": 0.7372549,
 "blue": 0.015686275
 }
 }
 },
 {
 "colorType": "ACCENT4",
 "color": {
 "rgbColor": {
 "red": 0.20392157,
 "green": 0.65882355,
 "blue": 0.3254902
 }
 }
 },
 {
 "colorType": "ACCENT5",
 "color": {
 "rgbColor": {
 "red": 1,
 "green": 0.42745098,
 "blue": 0.003921569
 }
 }
 },
 {
 "colorType": "ACCENT6",
 "color": {
 "rgbColor": {
 "red": 0.27450982,
 "green": 0.7411765,
 "blue": 0.7764706
 }
 }
 },
 {
 "colorType": "LINK",
 "color": {
 "rgbColor": {
 "red": 0.06666667,
 "green": 0.33333334,
 "blue": 0.8
 }
 }
 }
 ]
 }
 },
 "sheets": [
 {
 "properties": {
 "sheetId": 1999766427,
 "title": "Sheet1",
 "index": 0,
 "sheetType": "GRID",
 "gridProperties": {
 "rowCount": 1000,
 "columnCount": 26
 }
 }
 },
 {
 "properties": {
 "sheetId": 225184494,
 "title": "Sheet2",
 "index": 1,
 "sheetType": "GRID",
 "gridProperties": {
 "rowCount": 1000,
 "columnCount": 26
 }
 }
 }
 ],
 "spreadsheetUrl": "https://docs.google.com/spreadsheets/d/1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc/edit"
 }

```

---
sidebar_position: 2
---

# Get spreadsheet
 Gets information about the spreadsheet by ID



`Function GetSpreadsheet(Val Token, Val Identifier) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --spreadsheet | String | Spreadsheet identifier |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Identifier = "187aOtcDnHwx1wmHhU-QuGHMWyqZptBif9IVa_tBanNk";

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gsheets GetSpreadsheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc"

```

```json title="Result"

```

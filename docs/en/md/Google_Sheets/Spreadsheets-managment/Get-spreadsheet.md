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
    Token      = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Identifier = "1byey4pYpbD_Bmh0c49QYSEfwkqTUwcTIqhMtrDyq7vQ";

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gsheets GetSpreadsheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc"

```

```json title="Result"

```

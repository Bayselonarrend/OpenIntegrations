---
sidebar_position: 3
---

# Change spreadsheet name
 Changes the name of the existing spreadsheet



`Function EditSpreadsheetTitle(Val Token, Val Spreadsheet, Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Spreadsheet | --spreadsheet | String | SpreadsheetID |
  | Name | --title | String | New name |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Spreadsheet = "1byey4pYpbD_Bmh0c49QYSEfwkqTUwcTIqhMtrDyq7vQ";
    Name        = "Test table (changed.)";

    Result = OPI_GoogleSheets.EditSpreadsheetTitle(Token, Spreadsheet, Name);
```



```sh title="CLI command example"
    
  oint gsheets EditSpreadsheetTitle --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Test table (changed.)"

```

```json title="Result"
{
 "spreadsheetId": "1psqJkXdtlHOc7Qzr4ficNkFth5dWLl0HdmMDhSTM7ZQ",
 "replies": [
  {}
 ]
}
```

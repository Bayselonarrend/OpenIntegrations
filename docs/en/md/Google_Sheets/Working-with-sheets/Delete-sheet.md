---
sidebar_position: 2
---

# Delete sheet
 Deletes a sheet from the spreadsheet



`Function DeleteSheet(Val Token, Val Spreadsheet, Val Sheet) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Spreadsheet | --spreadsheet | String | Spreadsheet identifier |
  | Sheet | --sheet | String | IdentifierOfSheetToDelete |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Spreadsheet = "1ybexzLz6S_cthsQNdMkNbOlAD3yjFzdArRm_589T_FQ";
    Sheet       = "1710472523";

    Result = OPI_GoogleSheets.DeleteSheet(Token, Spreadsheet, Sheet);
```



```sh title="CLI command example"
    
  oint gsheets DeleteSheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --sheet "1790807910"

```

```json title="Result"
{
 "spreadsheetId": "1psqJkXdtlHOc7Qzr4ficNkFth5dWLl0HdmMDhSTM7ZQ",
 "replies": [
  {}
 ]
}
```

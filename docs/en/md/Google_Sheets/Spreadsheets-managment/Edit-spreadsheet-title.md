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
    Token       = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Spreadsheet = "1MvjT6qO5jQzS0O1o33GVv4ui59dIeDkdY8QLR6z5k9o";
    Name        = "Test table (changed.)";

    Result = OPI_GoogleSheets.EditSpreadsheetTitle(Token, Spreadsheet, Name);
```



```sh title="CLI command example"
    
  oint gsheets EditSpreadsheetTitle --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Test table (changed.)"

```

```json title="Result"

```

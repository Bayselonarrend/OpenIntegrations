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
    Token      = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Identifier = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gsheets GetSpreadsheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc"

```

```json title="Result"

```

---
sidebar_position: 1
---

# Add sheet
 Adds a new sheet to the spreadsheet



`Function AddSheet(Val Token, Val Spreadsheet, Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Spreadsheet | --spreadsheet | String | Spreadsheet identifier |
  | Name | --title | String | NewSheetName |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Spreadsheet = "1IIUxPvgvrPCB92SXFISbKBFLAbmbHUIu_OysyC9w3Ow";
    Name        = "TestSheet";

    Result = OPI_GoogleSheets.AddSheet(Token, Spreadsheet, Name);
```



```sh title="CLI command example"
    
  oint gsheets AddSheet --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "TestSheet"

```

```json title="Result"

```

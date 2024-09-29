---
sidebar_position: 1
---

# Create spreadsheet
 Creates a new spreadsheet



`Function CreateSpreadsheet(Val Token, Val Name, Val ArrayOfSheetNames) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Name | --title | String | Name |
  | ArrayOfSheetNames | --sheets | Array of String | Array of names to add new sheets to the spreadsheet |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Name  = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    Result = OPI_GoogleSheets.CreateSpreadsheet(Token, Name, SheetArray);
```



```sh title="CLI command example"
    
  oint gsheets CreateSpreadsheet --token %token% --title "TestTable" --sheets %sheets%

```

```json title="Result"

```

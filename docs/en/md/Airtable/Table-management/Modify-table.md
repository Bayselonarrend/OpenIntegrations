---
sidebar_position: 2
---

# Modify table
 Changes the name and/or description of the base



`Function ModifyTable(Val Token, Val Base, Val Table, Val Name = "", Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Base identifier |
  | Table | --table | String | Table identifier |
  | Name | --title | String | New name |
  | Description | --description | String | New description |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token       = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base        = "app9bSgL4YtTVGTlE";
    Table       = "tblDUGAZFZaeOwE6x";
    Name        = "Test table 2 (change.)";
    Description = "New table (change.)";

    Result = OPI_Airtable.ModifyTable(Token, Base, Table, Name, Description);
```



```sh title="CLI command example"
    
  oint airtable ModifyTable --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --title "Test table 2 (change.)" --description %description%

```

```json title="Result"

```

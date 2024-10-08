﻿---
sidebar_position: 2
---

# Modify field
 Changes the name and/or description of an existing table field



`Function ModifyField(Val Token, Val Base, Val Table, Val Field, Val Name = "", Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Base identifier Base |
  | Table | --table | String | Table identifier |
  | Field | --field | String | Field identifier |
  | Name | --title | String | New name |
  | Description | --description | String | New description |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base  = "app9bSgL4YtTVGTlE";
    Table = "tblDUGAZFZaeOwE6x";
    Field = "fldqjgkFjERWf5svH";

    Name        = String(New UUID) + "(change.)";
    Description = "New description";

    Result = OPI_Airtable.ModifyField(Token, Base, Table, Field, Name, Description);
```



```sh title="CLI command example"
    
  oint airtable ModifyField --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --field "fld3IbFtHZtBHQwsk" --title %title% --description %description%

```

```json title="Result"
{
 "type": "number",
 "options": {
  "precision": 0
 },
 "id": "fldDqI1OXajeQw5Gg",
 "name": "2cf91139-d111-4599-87bf-e3510ea23584(change.)",
 "description": "New description"
}
```

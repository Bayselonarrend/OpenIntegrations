---
sidebar_position: 2
---

# Create comment
 Creates a comment for a record in the table



`Function CreateComment(Val Token, Val Base, Val Table, Val Record, Val Text) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Record | --record | String | Record identifier in the table |
  | Text | --text | String | Comment text |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token  = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base   = "app9bSgL4YtTVGTlE";
    Table  = "tblDUGAZFZaeOwE6x";
    Record = "recydoiybO8id17n5";
    Text   = "TestComment";

    Result = OPI_Airtable.CreateComment(Token, Base, Table, Record, Text);
```



```sh title="CLI command example"
    
  oint airtable CreateComment --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --text "TestComment"

```

```json title="Result"

```

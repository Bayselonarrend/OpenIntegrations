---
sidebar_position: 3
---

# Modify comment
 Changes the text of an existing comment



`Function EditComment(Val Token, Val Base, Val Table, Val Record, Val Comment, Val Text) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Record | --record | String | Record identifier in the table |
  | Comment | --comment | String | Comment identifier |
  | Text | --text | String | New comment text |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token   = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base    = "app9bSgL4YtTVGTlE";
    Table   = "tblDUGAZFZaeOwE6x";
    Record  = "recydoiybO8id17n5";
    Comment = "com8s9ZPVoWQ9JN9o";

    Text   = "Test comment (change.)";
    Result = OPI_Airtable.EditComment(Token, Base, Table, Record, Comment, Text);

    OPI_TestDataRetrieval.Check_ATText(Result, Text);
```



```sh title="CLI command example"
    
  oint airtable EditComment --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --comment "comL1oGEDJvIQlMs1" --text "Test comment (change.)"

```

```json title="Result"

```

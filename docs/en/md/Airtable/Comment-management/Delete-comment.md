---
sidebar_position: 4
---

# Delete comment
 Deletes a comment for a table record



`Function DeleteComment(Val Token, Val Base, Val Table, Val Record, Val Comment) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Record | --record | String | Record identifier in the table |
  | Comment | --comment | String | Comment identifier |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token   = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base    = "app7wcH961p8fBBRH";
    Table   = "tblSwEBXQOQHSEl7u";
    Record  = "recwsjcLW3prWbE9e";
    Comment = "comfaFDciP11JXx3w";

    Result = OPI_Airtable.DeleteComment(Token, Base, Table, Record, Comment);
```



```sh title="CLI command example"
    
  oint airtable DeleteComment --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --comment "comL1oGEDJvIQlMs1"

```

```json title="Result"
{
 "id": "comwNg41PXtfEa4kj",
 "deleted": true
}
```

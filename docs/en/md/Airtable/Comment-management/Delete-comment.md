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
    Base    = "appESy99HYCLbuWlV";
    Table   = "tbl5gZLQ8i5xKuVTy";
    Record  = "recHqUT4ruWn8KnYi";
    Comment = "comc3oQtvx4mn0pdu";

    Result = OPI_Airtable.DeleteComment(Token, Base, Table, Record, Comment);
```
 



```json title="Result"
{
 "id": "comwNg41PXtfEa4kj",
 "deleted": true
}
```

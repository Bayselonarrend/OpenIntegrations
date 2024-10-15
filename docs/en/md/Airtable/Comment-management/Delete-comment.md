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
    Base    = "appmy5B6qi09E4wrF";
    Table   = "tblYwj7Cnw6w3FGWh";
    Record  = "recnOWHAPOyCl0kUj";
    Comment = "comNQ9mG1pWpJqgif";

    Result = OPI_Airtable.DeleteComment(Token, Base, Table, Record, Comment);
```
 



```json title="Result"
{
 "id": "comwNg41PXtfEa4kj",
 "deleted": true
}
```

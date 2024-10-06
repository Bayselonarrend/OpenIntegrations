---
sidebar_position: 4
---

# Delete records
 Deletes one or an array of records by identifiers



`Function DeletePosts(Val Token, Val Base, Val Table, Val Records) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Records | --records | String, Array of String | Identifier or array of record identifiers |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token  = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base   = "app9bSgL4YtTVGTlE";
    Table  = "tblDUGAZFZaeOwE6x";
    Record = "recydoiybO8id17n5";

    Result = OPI_Airtable.DeletePosts(Token, Base, Table, Record);
```



```sh title="CLI command example"
    
  oint airtable DeletePosts --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --records %records%

```

```json title="Result"
{
 "records": [
  {
   "deleted": true,
   "id": "reckrIfWtxi8P2ToV"
  }
 ]
}
```

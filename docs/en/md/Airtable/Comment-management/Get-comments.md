---
sidebar_position: 1
---

# Get comments
 Gets the list of comments for a record in the table



`Function GetComments(Val Token, Val Base, Val Table, Val Record, Val Indent = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Record | --record | String | Record identifier in the table |
  | Indent | --offset | String | Next page identifier of data from the previous request |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token  = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base   = "appESy99HYCLbuWlV";
    Table  = "tbl5gZLQ8i5xKuVTy";
    Record = "recHqUT4ruWn8KnYi";

    Result = OPI_Airtable.GetComments(Token, Base, Table, Record);
```



```sh title="CLI command example"
    
  oint airtable GetComments --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --offset %offset%

```

```json title="Result"
{
 "comments": [
  {
   "id": "comwNg41PXtfEa4kj",
   "author": {
    "id": "usrFlaAHlTfYWAbVW",
    "email": "bayselonarrend@gmail.com",
    "name": "Антон Титовец"
   },
   "text": "Test comment (change.)",
   "createdTime": "2024-10-09T06:15:49Z",
   "lastUpdatedTime": "2024-10-09T06:15:50Z"
  }
 ],
 "offset": null
}
```

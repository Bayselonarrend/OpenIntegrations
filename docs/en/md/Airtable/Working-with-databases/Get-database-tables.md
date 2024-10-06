---
sidebar_position: 2
---

# Get base tables
 Gets the schema of base tables



`Function GetDatabaseTables(Val Token, Val Base) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Base identifier |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base  = "app9bSgL4YtTVGTlE";

    Result = OPI_Airtable.GetDatabaseTables(Token, Base);
```



```sh title="CLI command example"
    
  oint airtable GetDatabaseTables --token %token% --base "apptm8Xqo7TwMaipQ"

```

```json title="Result"
{
 "tables": [
  {
   "id": "tblM0y8j7idWHDaK1",
   "name": "TestTable",
   "primaryFieldId": "flds0apJqH4j0fYag",
   "fields": [
    {
     "type": "number",
     "options": {
      "precision": 0
     },
     "id": "flds0apJqH4j0fYag",
     "name": "Number"
    },
    {
     "type": "richText",
     "id": "fldbC0kZ2o9FGOtsX",
     "name": "String"
    }
   ],
   "views": [
    {
     "id": "viwT5hHbSyRIrzRlR",
     "name": "Grid view",
     "type": "grid"
    }
   ]
  }
 ]
}
```

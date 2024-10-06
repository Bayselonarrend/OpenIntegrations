---
sidebar_position: 3
---

# Create base
 Creates a new database



`Function CreateDatabase(Val Token, Val Workspace, Val Name, Val TableCollection) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Workspace | --ws | String | Workspace identifier |
  | Name | --title | String | New base name |
  | TableCollection | --tablesdata | Map Of KeyAndValue | Table description: Key > name, Value > array of fields |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token  = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Region = "wspdf8yl1yZz3PmWZ";
    Name   = "TestDatabase";

    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    FieldArray.Add(OPI_Airtable.GetStringField("String"));

    TableName = "TestTable";

    TableMapping = New Map;
    TableMapping.Insert(TableName, FieldArray);

    Result = OPI_Airtable.CreateDatabase(Token, Region, Name, TableMapping);
```



```sh title="CLI command example"
    
  oint airtable CreateDatabase --token %token% --ws "wspdf8yl1yZz3PmWZ" --title "TestDatabase" --tablesdata %tablesdata%

```

```json title="Result"
{
 "id": "appCOuzfpma3IfjDV",
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

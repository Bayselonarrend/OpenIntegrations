---
sidebar_position: 3
---

# Create base
 Creates a new database




<br/>


*Function CreateDatabase(Val Token, Val Workspace, Val Name, Val TableCollection) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Workspace | --ws | String | Workspace identifier |
 | Name | --title | String | New base name |
 | TableCollection | --tablesdata | Map Of KeyAndValue | Table description: Key > name, Value > array of fields |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable


```bsl title="Code example"
 
 Workspace = "wspdf8yl1yZz3PmWZ";
 Name = "TestDatabase";
 
 FieldArray = New Array;
 FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
 FieldArray.Add(OPI_Airtable.GetStringField("String"));
 
 TableName = "TestTable";
 
 TableCollection = New Map;
 TableCollection.Insert(TableName, FieldArray);
 
 Response = OPI_Airtable.CreateDatabase(Token, Workspace, Name, TableCollection); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint airtable CreateDatabase --token %token% --ws "wspdf8yl1yZz3PmWZ" --title "TestDatabase" --tablesdata %tablesdata%

```

```json title="Result"
 {
 "id": "applEsyJmBRm12AuN",
 "tables": [
 {
 "id": "tblqZzW78Rvsdt9gt",
 "name": "TestTable",
 "primaryFieldId": "fldj9Z3fEpLzv40d0",
 "fields": [
 {
 "type": "number",
 "options": {
 "precision": 0
 },
 "id": "fldj9Z3fEpLzv40d0",
 "name": "Number"
 },
 {
 "type": "richText",
 "id": "fldX1kR7lienmcdEj",
 "name": "String"
 }
 ],
 "views": [
 {
 "id": "viwbKE3PS9jl6bqJl",
 "name": "Grid view",
 "type": "grid"
 }
 ]
 }
 ]
 }
```

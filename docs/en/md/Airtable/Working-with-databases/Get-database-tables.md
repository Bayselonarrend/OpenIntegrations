---
sidebar_position: 2
---

# Get base tables
 Gets the schema of base tables



`Function GetDatabaseTables(Val Token, Val Base) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Base identifier |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
 
 Base = "apptm8Xqo7TwMaipQ";
 
 Response = OPI_Airtable.GetDatabaseTables(Token, Base); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint airtable GetDatabaseTables --token %token% --base "apptm8Xqo7TwMaipQ"

```

```json title="Result"
{
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

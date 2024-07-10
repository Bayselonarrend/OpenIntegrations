---
sidebar_position: 1
---

# Get list of records
 Gets the list of records of the selected table




<br/>


*Function GetListOfRecords(Val Token, Val Base, Val Table, Val Indent = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Database identifier |
 | Table | --table | String | Table identifier |
 | Indent | --offset | String | Next page identifier of data from the previous request |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable


```bsl title="Code example"
 
 Base = "apptm8Xqo7TwMaipQ";
 Table = "tbl9G4jVoTJpxYwSY";
 
 Response = OPI_Airtable.GetListOfRecords(Token, Base, Table, Indent); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint airtable GetListOfRecords --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --offset %offset%

```

```json title="Result"
 {
 "records": [
 {
 "id": "recGyJ0MlN1H3GMuN",
 "createdTime": "2024-05-10T19:39:51Z",
 "fields": {
 "Number": 10,
 "String": "Hello\n"
 }
 },
 {
 "id": "recV6DxeLQMBNJrUk",
 "createdTime": "2024-05-10T19:39:51Z",
 "fields": {
 "Number": 10,
 "String": "Hello\n"
 }
 },
 {
 "id": "recjHNKNZBWLZkZ7A",
 "createdTime": "2024-05-10T19:39:51Z",
 "fields": {
 "Number": 10,
 "String": "Hello\n"
 }
 }
 ]
 }
```

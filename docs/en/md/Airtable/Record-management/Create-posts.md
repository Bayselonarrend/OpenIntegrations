---
sidebar_position: 3
---

# Create records
 Creates one or an array of records by description or an array of field value descriptions




<br/>


*Function CreatePosts(Val Token, Val Base, Val Table, Val Data) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Database identifier |
 | Table | --table | String | Table identifier |
 | Data | --data | Structure, Array of Structure | Set or array of sets of pairs Key : Value > Field : FieldValue |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable


```bsl title="Code example"
 
 Base = "apptm8Xqo7TwMaipQ";
 Table = "tbl9G4jVoTJpxYwSY";
 Numeric = 10;
 StringType = "Hello";
 
 RowDescription1 = New Structure("Number,String", Numeric, StringType);
 RowDescription2 = New Structure("Number,String", Numeric, StringType);
 
 Data = New Array;
 Data.Add(RowDescription1);
 Data.Add(RowDescription2);
 
 Response = OPI_Airtable.CreatePosts(Token, Base, Table, Data); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint airtable CreatePosts --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --data %data%

```

```json title="Result"
 {
 "records": [
 {
 "id": "recjHNKNZBWLZkZ7A",
 "createdTime": "2024-05-10T19:39:51Z",
 "fields": {
 "Number": 10,
 "String": "Hello\n"
 }
 },
 {
 "id": "recGyJ0MlN1H3GMuN",
 "createdTime": "2024-05-10T19:39:51Z",
 "fields": {
 "Number": 10,
 "String": "Hello\n"
 }
 }
 ]
 }
```

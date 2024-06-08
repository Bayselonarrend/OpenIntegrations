---
sidebar_position: 4
---

# Delete records
 Deletes one or an array of records by identifiers


*Function DeletePosts(Val Token, Val Base, Val Table, Val Records) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Database identifier |
 | Table | --table | String | Table identifier |
 | Records | --records | String, Array of String | Identifier or array of record identifiers |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable

```bsl title="Code example"
	
 
 Base = "apptm8Xqo7TwMaipQ";
 Table = "tbl9G4jVoTJpxYwSY";
 
 Records = New Array;
 Records.Add("recjHNKNZBWLZkZ7A");
 Records.Add("recGyJ0MlN1H3GMuN");
 
 Response = OPI_Airtable.DeletePosts(Token, Base, Table, Record); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
	
```

```sh title="CLI command example"
 
 oint airtable DeletePosts --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --records %records%


```


```json title="Result"

{
 "records": [
 {
 "deleted": true,
 "id": "recjHNKNZBWLZkZ7A"
 },
 {
 "deleted": true,
 "id": "recGyJ0MlN1H3GMuN"
 }
 ]
 }

```

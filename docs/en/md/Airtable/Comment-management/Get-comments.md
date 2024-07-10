---
sidebar_position: 1
---

# Get comments
 Gets the list of comments for a record in the table


<br/>


`Function GetComments(Val Token, Val Base, Val Table, Val Record, Val Indent = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Database identifier |
 | Table | --table | String | Table identifier |
 | Record | --record | String | Record identifier in the table |
 | Indent | --offset | String | Next page identifier of data from the previous request |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable





```bsl title="Code example"
 
 Base = "apptm8Xqo7TwMaipQ";
 Table = "tbl9G4jVoTJpxYwSY";
 Record = "recV6DxeLQMBNJrUk";
 
 Response = OPI_Airtable.GetComments(Token, Base, Table, Record); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint airtable GetComments --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --offset %offset%

```

```json title="Result"
 {
 "comments": [
 {
 "id": "comL1oGEDJvIQlMs1",
 "author": {
 "id": "usrFlaAHlTfYWAbVW",
 "email": "bayselonarrend@gmail.com",
 "name": "Anton Titovets"
 },
 "text": "Test comment (change.)",
 "createdTime": "2024-05-10T19:39:52Z",
 "lastUpdatedTime": "2024-05-10T19:39:52Z"
 }
 ],
 "offset": null
 }
```

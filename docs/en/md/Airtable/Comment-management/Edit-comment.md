---
sidebar_position: 3
---

# Modify comment
 Changes the text of an existing comment


*Function EditComment(Val Token, Val Base, Val Table, Val Record, Val Comment, Val Text) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Database identifier |
 | Table | --table | String | Table identifier |
 | Record | --record | String | Record identifier in the table |
 | Comment | --comment | String | Comment identifier |
 | Text | --text | String | New comment text |

 
 Returns: Key-Value Pair - serialized JSON response from Airtable

```bsl title="Code example"
	
 
 Base = "apptm8Xqo7TwMaipQ";
 Table = "tbl9G4jVoTJpxYwSY";
 Record = "recV6DxeLQMBNJrUk";
 Comment = "comL1oGEDJvIQlMs1";
 Text = "Test comment (change.)";
 
 Response = OPI_Airtable.EditComment(Token, Base, Table, Record, Comment, Text); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint airtable EditComment --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --comment %comment% --text "Test comment (change.)"


```


```json title="Result"

{
 "id": "comL1oGEDJvIQlMs1",
 "author": {
 "id": "usrFlaAHlTfYWAbVW",
 "email": "bayselonarrend@gmail.com",
 "name": "Anton Titovets"
 },
 "text": "Test comment (change.)",
 "createdTime": "2024-05-10T19:39:52Z",
 "lastUpdatedTime": "2024-05-10T19:39:51.967Z"
 }

```

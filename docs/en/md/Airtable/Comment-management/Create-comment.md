---
sidebar_position: 2
---

# Create comment
 Creates a comment for a record in the table



`Function CreateComment(Val Token, Val Base, Val Table, Val Record, Val Text) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Record | --record | String | Record identifier in the table |
  | Text | --text | String | Comment text |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
  
  Base = "apptm8Xqo7TwMaipQ";
  Table = "tbl9G4jVoTJpxYwSY";
  Record = "recV6DxeLQMBNJrUk";
  Text = "TestComment";
  
  Response = OPI_Airtable.CreateComment(Token, Base, Table, Record, Text); //Map
  Response = OPI_Tools.JSONString(Response); //JSON string
```



```sh title="CLI command example"
    
  oint airtable CreateComment --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --text "TestComment"

```

```json title="Result"
  {
  "id": "comL1oGEDJvIQlMs1",
  "author": {
  "id": "usrFlaAHlTfYWAbVW",
  "email": "bayselonarrend@gmail.com",
  "name": "Anton Titovets"
  },
  "text": "TestComment",
  "createdTime": "2024-05-10T19:39:51.561Z",
  "lastUpdatedTime": null
  }

```

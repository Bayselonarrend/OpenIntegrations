---
sidebar_position: 2
---

# Get record
 Gets row data of the table by identifier



`Function GetRecord(Val Token, Val Base, Val Table, Val Record) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Record | --record | String | Record identifier in the table |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
  
  Base = "apptm8Xqo7TwMaipQ";
  Table = "tbl9G4jVoTJpxYwSY";
  Record = "recV6DxeLQMBNJrUk";
  
  Response = OPI_Airtable.GetRecord(Token, Base, Table, Record); //Map
  Response = OPI_Tools.JSONString(Response); //JSON string
```



```sh title="CLI command example"
    
  oint airtable GetRecord --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk"

```

```json title="Result"
{
  "id": "recV6DxeLQMBNJrUk",
  "createdTime": "2024-05-10T19:39:51Z",
  "fields": {
  "Number": 10,
  "String": "Hello\n"
  }
  }
```

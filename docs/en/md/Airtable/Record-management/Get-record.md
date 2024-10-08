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
    Token  = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base   = "app9bSgL4YtTVGTlE";
    Table  = "tblDUGAZFZaeOwE6x";
    Record = "recydoiybO8id17n5";

    Result = OPI_Airtable.GetRecord(Token, Base, Table, Record);
```



```sh title="CLI command example"
    
  oint airtable GetRecord --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk"

```

```json title="Result"
{
 "id": "recBwZ6ILHq8Pv7c4",
 "createdTime": "2024-10-07T19:21:08Z",
 "fields": {
  "Number": 10,
  "String": "Hello\n"
 }
}
```

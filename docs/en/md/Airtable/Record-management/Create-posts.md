---
sidebar_position: 3
---

# Create records
 Creates one or an array of records by description or an array of field value descriptions



`Function CreatePosts(Val Token, Val Base, Val Table, Val Data) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Data | --data | Structure, Array of Structure | Set or array of sets of pairs Key : Value > Field : FieldValue |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base  = "app9bSgL4YtTVGTlE";
    Table = "tblDUGAZFZaeOwE6x";

    Number = 10;
    String = "Hello";

    RowDescription1 = New Structure("Number,String", Number, String);
    RowDescription2 = New Structure("Number,String", Number, String);

    ArrayOfDescriptions = New Array;
    ArrayOfDescriptions.Add(RowDescription1);
    ArrayOfDescriptions.Add(RowDescription2);

    Result = OPI_Airtable.CreatePosts(Token, Base, Table, ArrayOfDescriptions);
```



```sh title="CLI command example"
    
  oint airtable CreatePosts --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --data %data%

```

```json title="Result"
{
 "records": [
  {
   "id": "reczHzxWw62G7qQw4",
   "createdTime": "2024-10-05T15:01:27Z",
   "fields": {
    "Number": 10,
    "String": "Hello\n"
   }
  },
  {
   "id": "recGlM7EEIp6d203I",
   "createdTime": "2024-10-05T15:01:27Z",
   "fields": {
    "Number": 10,
    "String": "Hello\n"
   }
  }
 ]
}
```

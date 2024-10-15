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
    Base  = "appESy99HYCLbuWlV";
    Table = "tbl5gZLQ8i5xKuVTy";

    Number = 10;
    String = "Hello";

    RowDescription1 = New Structure("Number,String", Number, String);
    RowDescription2 = New Structure("Number,String", Number, String);

    ArrayOfDescriptions = New Array;
    ArrayOfDescriptions.Add(RowDescription1);
    ArrayOfDescriptions.Add(RowDescription2);

    Result = OPI_Airtable.CreatePosts(Token, Base, Table, ArrayOfDescriptions);
```
 



```json title="Result"
{
 "records": [
  {
   "id": "recVZd6lgdfEkIH0o",
   "createdTime": "2024-10-09T06:15:48Z",
   "fields": {
    "Number": 10,
    "String": "Hello\n"
   }
  },
  {
   "id": "recenScnS1yuI8Dsk",
   "createdTime": "2024-10-09T06:15:48Z",
   "fields": {
    "Number": 10,
    "String": "Hello\n"
   }
  }
 ]
}
```

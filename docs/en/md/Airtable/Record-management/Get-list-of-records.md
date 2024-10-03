---
sidebar_position: 1
---

# Get list of records
 Gets the list of records of the selected table



`Function GetListOfRecords(Val Token, Val Base, Val Table, Val Indent = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database identifier |
  | Table | --table | String | Table identifier |
  | Indent | --offset | String | Next page identifier of data from the previous request |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base  = "app9bSgL4YtTVGTlE";
    Table = "tblDUGAZFZaeOwE6x";

    Result = OPI_Airtable.GetListOfRecords(Token, Base, Table);
```



```sh title="CLI command example"
    
  oint airtable GetListOfRecords --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --offset %offset%

```

```json title="Result"
{
 "records": [
  {
   "id": "recV9gaqz5aNtAP0n",
   "createdTime": "2024-10-03T06:12:45Z",
   "fields": {
    "Number": 10,
    "String": "Hello\n"
   }
  }
 ]
}
```

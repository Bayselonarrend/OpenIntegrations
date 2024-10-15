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
    Base  = "appESy99HYCLbuWlV";
    Table = "tbl5gZLQ8i5xKuVTy";

    Result = OPI_Airtable.GetListOfRecords(Token, Base, Table);
```
 



```json title="Result"
{
 "records": [
  {
   "id": "recMPMkPT6RzcSyqt",
   "createdTime": "2024-10-09T06:15:49Z",
   "fields": {
    "Number": 10,
    "String": "Hello\n"
   }
  }
 ]
}
```

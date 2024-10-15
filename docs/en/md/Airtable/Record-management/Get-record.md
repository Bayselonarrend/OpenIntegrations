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
    Base   = "appmy5B6qi09E4wrF";
    Table  = "tblYwj7Cnw6w3FGWh";
    Record = "recnOWHAPOyCl0kUj";

    Result = OPI_Airtable.GetRecord(Token, Base, Table, Record);
```
 



```json title="Result"
{
 "id": "recMPMkPT6RzcSyqt",
 "createdTime": "2024-10-09T06:15:49Z",
 "fields": {
  "Number": 10,
  "String": "Hello\n"
 }
}
```

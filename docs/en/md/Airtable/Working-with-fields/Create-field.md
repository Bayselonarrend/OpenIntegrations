---
sidebar_position: 1
---

# Create field
 Creates a new field in the table


*Function CreateField(Val Token, Val Base, Val Table, Val FieldStructure) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Base identifier |
 | Table | --table | String | Table identifier |
 | FieldStructure | --fielddata | Structure of Key-Value | Description of the new field |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable

```bsl title="Code example"
	
 
 Base = "apptm8Xqo7TwMaipQ";
 Table = "tbl9G4jVoTJpxYwSY";
 Name = String(New UUID);
 Field = OPI_Airtable.GetNumberField(Name);
 
 Response = OPI_Airtable.CreateField(Token, Base, Table, FieldStructure); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
	
```

```sh title="CLI command example"
 
 oint airtable CreateField --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --fielddata %fielddata%

```


```json title="Result"

{
 "type": "number",
 "options": {
 "precision": 0
 },
 "id": "fld3IbFtHZtBHQwsk",
 "name": "9c0d2a82-7bf9-40b7-8052-ae3ebadc72d5"
 }

```

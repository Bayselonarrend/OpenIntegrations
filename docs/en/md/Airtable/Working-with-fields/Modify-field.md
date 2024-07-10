---
sidebar_position: 2
---

# Modify field
 Changes the name and/or description of an existing table field


<br/>


`Function ModifyField(Val Token, Val Base, Val Table, Val Field, Val Name = "", Val Description = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Base identifier Base |
 | Table | --table | String | Table identifier |
 | Field | --field | String | Field identifier |
 | Name | --title | String | New name |
 | Description | --description | String | New description |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
Base = "apptm8Xqo7TwMaipQ";
 Table = "tbl9G4jVoTJpxYwSY";
 Field = "fld3IbFtHZtBHQwsk";
 Name = String(New UUID) + "(change.)";
 Description = "New description";
 
 Response = OPI_Airtable.ModifyField(Token, Base, Table, Field, Name, Description); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint airtable ModifyField --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --field "fld3IbFtHZtBHQwsk" --title %title% --description "New description"

```

```json title="Result"
{
 "type": "number",
 "options": {
 "precision": 0
 },
 "id": "fld3IbFtHZtBHQwsk",
 "name": "9c0d2a82-7bf9-40b7-8052-ae3ebadc72d5(change.)",
 "description": "New description"
 }
```

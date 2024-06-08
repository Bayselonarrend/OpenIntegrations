---
sidebar_position: 2
---

# Modify table
 Changes the name and/or description of the base


*Function ModifyTable(Val Token, Val Base, Val Table, Val Name = "", Val Description = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Base identifier |
 | Table | --table | String | Table identifier |
 | Name | --title | String | New name |
 | Description | --description | String | New description |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable

```bsl title="Code example"
	
 
 Base = "apptm8Xqo7TwMaipQ";
 Table = "tbl9G4jVoTJpxYwSY";
 Name = "Test table 2 (change.)";
 Description = "New table (change.)";
 
 Response = OPI_Airtable.ModifyTable(Token, Base, Table, Name, Description); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
	
```

```sh title="CLI command example"
 
 oint airtable ModifyTable --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --title "Test table 2 (change.)" --description "New table (change.)"


```


```json title="Result"

{
 "id": "tblT64aWyrMUAbUmF",
 "name": "Test table 2 (change.)",
 "description": "New table (change.)",
 "primaryFieldId": "fldoHs3kv6RLc8pjo",
 "fields": [
 {
 "id": "fldoHs3kv6RLc8pjo",
 "name": "Number",
 "type": "number",
 "options": {
 "precision": 0
 }
 },
 {
 "id": "fldzY5xRHDY7ClKxa",
 "name": "String",
 "type": "richText"
 },
 {
 "id": "fldYHxxXPALKl3yHp",
 "name": "Attachment",
 "type": "multipleAttachments",
 "options": {
 "isReversed": false
 }
 },
 {
 "id": "fldRUoggUObfqckXh",
 "name": "Checkbox",
 "type": "checkbox",
 "options": {
 "icon": "check",
 "color": "yellowBright"
 }
 },
 {
 "id": "fldvtwjapJM7s99nN",
 "name": "Date",
 "type": "date",
 "options": {
 "dateFormat": {
 "name": "iso",
 "format": "YYYY-MM-DD"
 }
 }
 },
 {
 "id": "flda4VY8dVd2mbqz9",
 "name": "Phone",
 "type": "phoneNumber"
 },
 {
 "id": "fld8ZLKndqBIkT72s",
 "name": "Email",
 "type": "email"
 },
 {
 "id": "fldqjsCp1c2KaAS53",
 "name": "Link",
 "type": "url"
 }
 ],
 "views": [
 {
 "id": "viwX3vEGO5vB2Km4k",
 "name": "Grid view",
 "type": "grid"
 }
 ]
 }

```

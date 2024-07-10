---
sidebar_position: 1
---

# Create table
 Creates a new table in the base


<br/>


`Function CreateTable(Val Token, Val Base, Val Name, Val FieldArray, Val Description = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Base | --base | String | Base identifier |
 | Name | --title | String | New table name |
 | FieldArray | --fieldsdata | Array of Structure | Array of field descriptions |
 | Description | --description | String | Table description |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
Base = "apptm8Xqo7TwMaipQ";
 TableName = "TestTable2";
 Description = "NewTable";
 
 FieldArray = New Array;
 FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
 FieldArray.Add(OPI_Airtable.GetStringField("String"));
 FieldArray.Add(OPI_Airtable.GetAttachmentField("Attachment"));
 FieldArray.Add(OPI_Airtable.GetCheckboxField("Checkbox"));
 FieldArray.Add(OPI_Airtable.GetDateField("Date"));
 FieldArray.Add(OPI_Airtable.GetPhoneField("Phone"));
 FieldArray.Add(OPI_Airtable.GetEmailField("Email"));
 FieldArray.Add(OPI_Airtable.GetLinkField("Link"));
 
 Response = OPI_Airtable.CreateTable(Token, Base, Name, FieldArray, Description); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint airtable CreateTable --token %token% --base "apptm8Xqo7TwMaipQ" --title %title% --fieldsdata %fieldsdata% --description "NewTable"

```

```json title="Result"
{
 "id": "tblT64aWyrMUAbUmF",
 "name": "TestTable2",
 "description": "NewTable",
 "primaryFieldId": "fldoHs3kv6RLc8pjo",
 "fields": [
 {
 "type": "number",
 "options": {
 "precision": 0
 },
 "id": "fldoHs3kv6RLc8pjo",
 "name": "Number"
 },
 {
 "type": "richText",
 "id": "fldzY5xRHDY7ClKxa",
 "name": "String"
 },
 {
 "type": "multipleAttachments",
 "options": {
 "isReversed": false
 },
 "id": "fldYHxxXPALKl3yHp",
 "name": "Attachment"
 },
 {
 "type": "checkbox",
 "options": {
 "icon": "check",
 "color": "yellowBright"
 },
 "id": "fldRUoggUObfqckXh",
 "name": "Checkbox"
 },
 {
 "type": "date",
 "options": {
 "dateFormat": {
 "name": "iso",
 "format": "YYYY-MM-DD"
 }
 },
 "id": "fldvtwjapJM7s99nN",
 "name": "Date"
 },
 {
 "type": "phoneNumber",
 "id": "flda4VY8dVd2mbqz9",
 "name": "Phone"
 },
 {
 "type": "email",
 "id": "fld8ZLKndqBIkT72s",
 "name": "Email"
 },
 {
 "type": "url",
 "id": "fldqjsCp1c2KaAS53",
 "name": "Link"
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

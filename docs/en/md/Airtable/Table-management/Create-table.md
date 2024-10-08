---
sidebar_position: 1
---

# Create table
 Creates a new table in the base



`Function CreateTable(Val Token, Val Base, Val Name, Val FieldArray, Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Base identifier |
  | Name | --title | String | New table name |
  | FieldArray | --fieldsdata | Array of Structure | Array of field descriptions |
  | Description | --description | String | Table description |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base  = "app9bSgL4YtTVGTlE";

    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    FieldArray.Add(OPI_Airtable.GetStringField("String"));
    FieldArray.Add(OPI_Airtable.GetAttachmentField("Attachment"));
    FieldArray.Add(OPI_Airtable.GetCheckboxField("Checkbox"));
    FieldArray.Add(OPI_Airtable.GetDateField("Date"));
    FieldArray.Add(OPI_Airtable.GetPhoneField("Phone"));
    FieldArray.Add(OPI_Airtable.GetEmailField("Email"));
    FieldArray.Add(OPI_Airtable.GetLinkField("Link"));

    Name        = "TestTable2";
    Description = "NewTable";

    Result = OPI_Airtable.CreateTable(Token, Base, Name, FieldArray, Description);
```



```sh title="CLI command example"
    
  oint airtable CreateTable --token %token% --base "apptm8Xqo7TwMaipQ" --title %title% --fieldsdata %fieldsdata% --description %description%

```

```json title="Result"
{
 "id": "tbllVnXav20vVQc8d",
 "name": "TestTable2",
 "description": "NewTable",
 "primaryFieldId": "fldOaawD636HX4tUt",
 "fields": [
  {
   "type": "number",
   "options": {
    "precision": 0
   },
   "id": "fldOaawD636HX4tUt",
   "name": "Number"
  },
  {
   "type": "richText",
   "id": "fldqUtFcYnxgVNplr",
   "name": "String"
  },
  {
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   },
   "id": "fldIZq6buPM6ob7Ji",
   "name": "Attachment"
  },
  {
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   },
   "id": "fldo9oaUGll2IQ3pO",
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
   "id": "fld9ziVlbgpn8mbRq",
   "name": "Date"
  },
  {
   "type": "phoneNumber",
   "id": "flduftF0xjttbxiQL",
   "name": "Phone"
  },
  {
   "type": "email",
   "id": "fldUuZjWacFU90YZe",
   "name": "Email"
  },
  {
   "type": "url",
   "id": "fldWwkaaX7ByzzyB6",
   "name": "Link"
  }
 ],
 "views": [
  {
   "id": "viwaxgV25YxHWcFO4",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

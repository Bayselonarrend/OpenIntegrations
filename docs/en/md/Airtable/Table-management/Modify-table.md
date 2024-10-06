---
sidebar_position: 2
---

# Modify table
 Changes the name and/or description of the base



`Function ModifyTable(Val Token, Val Base, Val Table, Val Name = "", Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Base identifier |
  | Table | --table | String | Table identifier |
  | Name | --title | String | New name |
  | Description | --description | String | New description |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token       = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base        = "app9bSgL4YtTVGTlE";
    Table       = "tblDUGAZFZaeOwE6x";
    Name        = "Test table 2 (change.)";
    Description = "New table (change.)";

    Result = OPI_Airtable.ModifyTable(Token, Base, Table, Name, Description);
```



```sh title="CLI command example"
    
  oint airtable ModifyTable --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --title "Test table 2 (change.)" --description %description%

```

```json title="Result"
{
 "id": "tblYKMQmVoieB8QFV",
 "name": "Test table 2 (change.)",
 "description": "New table (change.)",
 "primaryFieldId": "fldW4daJeC97GZhfk",
 "fields": [
  {
   "id": "fldW4daJeC97GZhfk",
   "name": "Number",
   "type": "number",
   "options": {
    "precision": 0
   }
  },
  {
   "id": "fldKUdnUuWI4ehR2E",
   "name": "String",
   "type": "richText"
  },
  {
   "id": "flde5PMxWWqsMwNX4",
   "name": "Attachment",
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   }
  },
  {
   "id": "fldzhZnCc28k8lmR8",
   "name": "Checkbox",
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   }
  },
  {
   "id": "fldkY8ftxvNget9JK",
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
   "id": "fldOcYQgMv3nbGbRX",
   "name": "Phone",
   "type": "phoneNumber"
  },
  {
   "id": "fldEC9PxNeXS1dEvF",
   "name": "Email",
   "type": "email"
  },
  {
   "id": "fldIVUimltwa0Z0Sr",
   "name": "Link",
   "type": "url"
  }
 ],
 "views": [
  {
   "id": "viwNaLjMKEHdWv9S3",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

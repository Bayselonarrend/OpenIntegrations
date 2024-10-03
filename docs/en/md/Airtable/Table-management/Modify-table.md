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
 "id": "tbl2VK5JpkSUgt4Cr",
 "name": "Test table 2 (change.)",
 "description": "New table (change.)",
 "primaryFieldId": "fldXLq2zGWTt09WWE",
 "fields": [
  {
   "id": "fldXLq2zGWTt09WWE",
   "name": "Number",
   "type": "number",
   "options": {
    "precision": 0
   }
  },
  {
   "id": "flds8fbZCLxPooV4h",
   "name": "String",
   "type": "richText"
  },
  {
   "id": "fldwRFMCnstW7m8Xl",
   "name": "Attachment",
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   }
  },
  {
   "id": "fldTHuJG0Hrb34iwd",
   "name": "Checkbox",
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   }
  },
  {
   "id": "fldNnvpZZTgQ36pY6",
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
   "id": "fldpG1Ehybh86uEeb",
   "name": "Phone",
   "type": "phoneNumber"
  },
  {
   "id": "fldGs9mDyK08mCboW",
   "name": "Email",
   "type": "email"
  },
  {
   "id": "fldFVcpDfju1hIdfi",
   "name": "Link",
   "type": "url"
  }
 ],
 "views": [
  {
   "id": "viwX4F7XsbCma7EBh",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

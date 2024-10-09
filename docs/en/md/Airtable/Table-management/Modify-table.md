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
 "id": "tbl1ECxOLd4V6OM9T",
 "name": "Test table 2 (change.)",
 "description": "New table (change.)",
 "primaryFieldId": "fldhWwOjg9UhvJ6A2",
 "fields": [
  {
   "id": "fldhWwOjg9UhvJ6A2",
   "name": "Number",
   "type": "number",
   "options": {
    "precision": 0
   }
  },
  {
   "id": "fld8KaCe62SjwSYAk",
   "name": "String",
   "type": "richText"
  },
  {
   "id": "fldSWB4hUUyP5Hx30",
   "name": "Attachment",
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   }
  },
  {
   "id": "fld7UipYF2w9FsoRm",
   "name": "Checkbox",
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   }
  },
  {
   "id": "fldHVbDsv6ndNp2XZ",
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
   "id": "fldYL0IFRMVQCO7gW",
   "name": "Phone",
   "type": "phoneNumber"
  },
  {
   "id": "fldzsmOGCGjThDsUp",
   "name": "Email",
   "type": "email"
  },
  {
   "id": "fldMWVcVuR9CmKBcD",
   "name": "Link",
   "type": "url"
  }
 ],
 "views": [
  {
   "id": "viwMlZ7T3KyjEufmW",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

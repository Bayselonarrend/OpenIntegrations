﻿---
sidebar_position: 7
---

# Get field (date)
 Gets the description of a date field



`Function GetDateField(Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Field name |

  
  Returns:  Structure - Field description

<br/>




```bsl title="Code example"
    Result = OPI_Airtable.GetDateField("Date");
```



```sh title="CLI command example"
    
  oint airtable GetDateField --title "Date"

```

```json title="Result"
{
 "name": "Date",
 "type": "date",
 "options": {
  "dateFormat": {
   "format": "YYYY-MM-DD",
   "name": "iso"
  }
 }
}
```

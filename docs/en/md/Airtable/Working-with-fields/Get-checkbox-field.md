﻿---
sidebar_position: 6
---

# Get field (checkbox)
 Gets the description of a boolean field



`Function GetCheckboxField(Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Field name |

  
  Returns:  Structure - Field description

<br/>




```bsl title="Code example"
    Result = OPI_Airtable.GetCheckboxField("Checkbox");
```



```sh title="CLI command example"
    
  oint airtable GetCheckboxField --title "Checkbox"

```

```json title="Result"
{
 "name": "Checkbox",
 "type": "checkbox",
 "options": {
  "icon": "check",
  "color": "yellowBright"
 }
}
```

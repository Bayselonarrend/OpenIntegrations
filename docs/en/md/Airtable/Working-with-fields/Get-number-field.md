---
sidebar_position: 4
---

# Get field (numeric)
 Gets the description of a numeric field



`Function GetNumberField(Val Name, Val Precision = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | New field name |
  | Precision | --precision | Number, String | Number of decimal places |

  
  Returns:  Structure - Field description

<br/>




```bsl title="Code example"
    Result = OPI_Airtable.GetNumberField("Number");
```
 



```json title="Result"
{
 "name": "Number",
 "type": "number",
 "options": {
  "precision": 0
 }
}
```

---
sidebar_position: 4
---

# Get field (numeric)
 Gets the description of a numeric field


<br/>


`Function GetNumberField(Val Name, Val Precision = 0) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | New field name |
 | Precision | --precision | Number, String | Number of decimal places |

 
 Returns: Structure - Field description

<br/>




```bsl title="Code example"
 
 Name = "Number";
 Precision = "0";
 
 Response = OPI_Airtable.GetNumberField(Name, Precision); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint airtable GetNumberField --title "Number" --precision "0"

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

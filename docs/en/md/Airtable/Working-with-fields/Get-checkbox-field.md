---
sidebar_position: 6
---

# Get field (checkbox)
 Gets the description of a boolean field


*Function GetCheckboxField(Val Name) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | Field name |

 
 Returns: Structure - Field description

```bsl title="Code example"
	
 
 Name = "Checkbox";
 
 Response = OPI_Airtable.GetCheckboxField(Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
 
	
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

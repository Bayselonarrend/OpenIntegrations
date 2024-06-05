---
sidebar_position: 3
---

# Get field (string)
 Gets the description of a string field


*Function GetStringField(Val Name) ExportReturn PrimitiveFieldDescription(Name, "richText");EndFunction*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | New field name |

 
 Returns: Structure - Field description

```bsl title="Code example"
	
 
 Name = "String";
 
 Response = OPI_Airtable.GetStringField(Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint airtable GetStringField --title "String"


```


```json title="Result"

{
 "name": "String",
 "type": "richText"
 }

```

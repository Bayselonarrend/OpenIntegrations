---
sidebar_position: 8
---

# Get field (email)
 Gets the description of an email field


*Function GetEmailField(Val Name) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | Field name |

 
 Returns: Structure - Field description

```bsl title="Code example"
	
 
 Name = "Email";
 
 Response = OPI_Airtable.GetEmailField(Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
	
```

```sh title="CLI command example"
 
 oint airtable GetEmailField --title "Email"

```


```json title="Result"

{
 "name": "Email",
 "type": "email"
 }

```

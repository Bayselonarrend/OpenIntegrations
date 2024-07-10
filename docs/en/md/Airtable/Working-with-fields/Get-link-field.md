---
sidebar_position: 10
---

# Get field (url)
 Gets the description of a URL field


<br/>


`Function GetLinkField(Val Name) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | Field name |

 
 Returns: Structure - Field description





```bsl title="Code example"
 
 Name = "Link";
 
 Response = OPI_Airtable.GetLinkField(Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint airtable GetLinkField --title "Link"

```

```json title="Result"
 {
 "name": "Link",
 "type": "url"
 }
```

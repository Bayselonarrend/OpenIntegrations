---
sidebar_position: 7
---

# Get field (date)
 Gets the description of a date field


<br/>


`Function GetDateField(Val Name) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | Field name |

 
 Returns: Structure - Field description

<br/>




```bsl title="Code example"
Name = "Date";
 
 Response = OPI_Airtable.GetDateField(Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
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

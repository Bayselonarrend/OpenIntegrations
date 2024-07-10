---
sidebar_position: 5
---

# Get field (file)
 Gets the description of a file field



`Function GetAttachmentField(Val Name) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | Field name |

 
 Returns: Structure - Field description

<br/>




```bsl title="Code example"
 
 Name = "Attachment";
 
 Response = OPI_Airtable.GetAttachmentField(Name); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint airtable GetAttachmentField --title "Attachment"

```

```json title="Result"
{
 "name": "Attachment",
 "type": "multipleAttachments"
 }
```

---
sidebar_position: 5
---

# Get field (file)
 Gets the description of a file field



`Function GetAttachmentField(Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Field name |

  
  Returns:  Structure - Field description

<br/>




```bsl title="Code example"
    Result = OPI_Airtable.GetAttachmentField("Attachment");
```



```sh title="CLI command example"
    
  oint airtable GetAttachmentField --title "Attachment"

```

```json title="Result"

```

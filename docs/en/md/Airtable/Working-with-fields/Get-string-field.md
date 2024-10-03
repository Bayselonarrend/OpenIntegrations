---
sidebar_position: 3
---

# Get field (string)
 Gets the description of a string field



`Function GetStringField(Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | New field name |

  
  Returns:  Structure - Field description

<br/>




```bsl title="Code example"
    Result = OPI_Airtable.GetStringField("String");
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

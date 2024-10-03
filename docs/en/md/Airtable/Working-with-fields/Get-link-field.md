---
sidebar_position: 10
---

# Get field (url)
 Gets the description of a URL field



`Function GetLinkField(Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Field name |

  
  Returns:  Structure - Field description

<br/>




```bsl title="Code example"
    Result = OPI_Airtable.GetLinkField("Link");
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

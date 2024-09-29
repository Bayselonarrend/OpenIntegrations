---
sidebar_position: 1
---

# Get authorization link
 Forms a link for authorization via the browser



`Function GetAuthorizationLink(Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  String - URL for browser transition

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Result     = OPI_Twitter.GetAuthorizationLink(Parameters);
```



```sh title="CLI command example"
    
  oint twitter GetAuthorizationLink --auth %auth%

```

```json title="Result"

```

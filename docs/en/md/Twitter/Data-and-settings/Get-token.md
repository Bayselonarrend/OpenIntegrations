---
sidebar_position: 2
---

# Get token
 Gets the token by the code received when authorizing using the link from GetAuthorizationLink



`Function GetToken(Val Code, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Code | --code | String | Code obtained from authorization See GetAuthorizationLink |
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
  
  Response = OPI_Twitter.GetToken(Code, Parameters);
  Response = OPI_Tools.JSONString(Response);
```



```sh title="CLI command example"
    
  oint twitter GetToken --code %code% --auth %auth%

```

```json title="Result"

```

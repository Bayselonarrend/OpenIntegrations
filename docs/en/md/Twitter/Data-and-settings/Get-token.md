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
    Parameters = GetTwitterAuthData();
    Code       = "123456";

    Result = OPI_Twitter.GetToken(Code, Parameters);
```



```sh title="CLI command example"
    
  oint twitter GetToken --code %code% --auth %auth%

```

```json title="Result"
{
 "error": "invalid_request",
 "error_description": "Value passed for the authorization code was invalid."
}
```

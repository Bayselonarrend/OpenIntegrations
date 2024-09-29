---
sidebar_position: 3
---

# Refresh token
 Updates the v2 token using the refresh_token



`Function RefreshToken(Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Result     = OPI_Twitter.RefreshToken(Parameters);
```



```sh title="CLI command example"
    
  oint twitter RefreshToken --auth %auth%

```

```json title="Result"

```

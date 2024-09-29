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
{
 "token_type": "bearer",
 "expires_in": 7200,
 "access_token": "VlpMSGU5eEVtRlRpazlPaTZDOW1JY19UbWtXSkR0ZFg5bGdINHZrSGVXNV8xOjE3Mjc2Mjg5NjI4MTg6MToxOmF0OjE",
 "scope": "mute.write tweet.moderate.write block.read follows.read offline.access list.write bookmark.read list.read tweet.write space.read block.write like.write like.read users.read tweet.read bookmark.write mute.read follows.write",
 "refresh_token": "NHhNRWpXcXJqdWl4X1NvX0hwQ3dENU1zeHBqVjNqWjlhU0xQYUl3YkFCcV9XOjE3Mjc2Mjg5NjI4MTg6MTowOnJ0OjE"
}
```

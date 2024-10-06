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
 "access_token": "WDBJYmFfRldZTUI0R0trc3lzakt3ZzRoN3RfcUNReFR5aTBudTBpNmJaZk1kOjE3MjgxMzg4ODU2NzM6MTowOmF0OjE",
 "scope": "mute.write tweet.moderate.write block.read follows.read offline.access list.write bookmark.read list.read tweet.write space.read block.write like.write like.read users.read tweet.read bookmark.write mute.read follows.write",
 "refresh_token": "c3VGN0lIa1ZVakk4Z2RuQnk0S1RwemYyNkJiSGV2SFFTN0ZXNEZOdXBjd0VSOjE3MjgxMzg4ODU2NzM6MTowOnJ0OjE"
}
```

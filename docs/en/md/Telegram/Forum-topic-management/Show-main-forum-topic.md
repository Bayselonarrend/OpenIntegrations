﻿---
sidebar_position: 8
---

# Show main forum thread
 Shows a previously hidden main forum thread



`Function ShowMainForumTopic(Val Token, Val ChatID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --forum | String, Number | Thread chat ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token = "6129457865:AAFyzNYOAFbu...";
    Chat  = "-1001971186208";

    Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);
```



```sh title="CLI command example"
    
  oint telegram ShowMainForumTopic --token "6129457865:AAFyzNYOAFbu..." --forum %forum%

```

```json title="Result"
{
 "ok": true,
 "result": true
}
```

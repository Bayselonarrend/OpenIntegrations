﻿---
sidebar_position: 1
---

# Ban
 Bans a user in the selected chat



`Function Ban(Val Token, Val ChatID, Val UserID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | UserID | --user | String, Number | Target user ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    UserID    = "461699897";
    ChannelID = "@testsichee";

    Result = OPI_Telegram.Ban(Token, ChannelID, UserID);
```



```sh title="CLI command example"
    
  oint telegram Ban --token "6129457865:AAFyzNYOAFbu..." --chat %chat% --user "461699897"

```

```json title="Result"
{
 "ok": false,
 "error_code": 400,
 "description": "Bad Request: can't remove chat owner"
}
```

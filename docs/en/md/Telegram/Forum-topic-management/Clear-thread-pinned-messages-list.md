﻿---
sidebar_position: 10
---

# Clear thread's pinned messages list
 Clears the list of pinned messages in the forum thread



`Function ClearThreadPinnedMessagesList(Val Token, Val ChatID, Val ThreadID = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --forum | String, Number | Thread chat ID |
  | ThreadID | --topic | String, Number | Thread ID. Main if not filled |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
  Token = "6129457865:AAFyzNYOAFbu...";
  Chat = "-1001971186208";
  Topic = "3896";
  
  Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat);
  
  Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat, Topic);
```



```sh title="CLI command example"
    
  oint telegram ClearThreadPinnedMessagesList --token "6129457865:AAFyzNYOAFbu..." --forum %forum% --topic %topic%

```

```json title="Result"
{
 "ok": true,
 "result": true
}
```

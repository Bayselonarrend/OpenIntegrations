﻿---
sidebar_position: 4
---

# Close forum thread
 Closes the thread for new messages



`Function CloseForumThread(Val Token, Val ChatID, Val ThreadID = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --forum | String, Number | Thread chat ID |
  | ThreadID | --topic | String, Number | Thread ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
  Token = "6129457865:AAFyzNYOAFbu...";
  Chat = "-1001971186208";
  Topic = "3896";
  
  Result = OPI_Telegram.CloseForumThread(Token, Chat); // Closes main topic
  
  Result = OPI_Telegram.CloseForumThread(Token, Chat, Topic);
```



```sh title="CLI command example"
    
  oint telegram CloseForumThread --token "6129457865:AAFyzNYOAFbu..." --forum %forum% --topic %topic%

```

```json title="Result"
{
 "ok": true,
 "result": true
}
```

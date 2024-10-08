﻿---
sidebar_position: 3
---

# Edit forum thread
 Creates a new thread in the group with theme functionality enabled



`Function EditForumTopic(Val Token, Val ChatID, Val ThreadID, Val Title = Undefined, Val IconID = Undefined) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --forum | String, Number | Thread creation chat ID |
  | ThreadID | --topic | String, Number | Thread ID |
  | Title | --title | String | New title |
  | IconID | --icon | String | See GetAvatarIconList |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token   = "6129457865:AAFyzNYOAFbu...";
    Chat    = "-1001971186208";
    Topic   = "5253";
    NewName = "NewTestTitle";
    NewIcon = "5310132165583840589";

    Result = OPI_Telegram.EditForumTopic(Token, Chat, Topic, NewName, NewIcon);
```



```sh title="CLI command example"
    
  oint telegram EditForumTopic --token "6129457865:AAFyzNYOAFbu..." --forum %forum% --topic %topic% --title %title% --icon %icon%

```

```json title="Result"
{
 "ok": true,
 "result": true
}
```

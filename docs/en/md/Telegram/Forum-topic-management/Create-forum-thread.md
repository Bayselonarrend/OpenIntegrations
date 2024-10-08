﻿---
sidebar_position: 2
---

# Create forum thread
 Creates a new thread in the group with theme functionality enabled



`Function CreateForumThread(Val Token, Val ChatID, Val Title, Val IconID = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --forum | String, Number | Thread creation chat ID |
  | Title | --title | String | Thread title |
  | IconID | --icon | String | See GetAvatarIconList |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
  Token = "6129457865:AAFyzNYOAFbu...";
  Chat = "-1001971186208";
  Icon = "5357419403325481346";
  Name = "TestTopic " + String(New UUID);
  
  Result = OPI_Telegram.CreateForumThread(Token, Chat, Name, Icon);
```



```sh title="CLI command example"
    
  oint telegram CreateForumThread --token "6129457865:AAFyzNYOAFbu..." --forum %forum% --title %title% --icon %icon%

```

```json title="Result"
{
 "ok": true,
 "result": {
  "message_thread_id": 5407,
  "name": "TestTopic 6e8a9d01-e4f4-4c9e-80fc-004f9bd0d697",
  "icon_color": 7322096,
  "icon_custom_emoji_id": "5357419403325481346"
 }
}
```

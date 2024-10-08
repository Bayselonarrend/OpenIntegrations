﻿---
sidebar_position: 11
---

# Forward message
 Forwards a message between chats or within a chat



`Function ForwardMessage(Val Token, Val OriginalID, Val FromID, Val ToID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | OriginalID | --message | String, Number | Original message ID |
  | FromID | --from | String, Number | Chat ID of the original message |
  | ToID | --to | String, Number | Target chat ID or ChatID*TopicID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    ChatID    = "461699897";
    ChannelID = "@testsichee";
    MessageID = "9280";

    Result = OPI_Telegram.ForwardMessage(Token, MessageID, ChannelID, ChatID);
```



```sh title="CLI command example"
    
  oint telegram ForwardMessage --token "6129457865:AAFyzNYOAFbu..." --message %message% --from %from% --to %to%

```

```json title="Result"
{
 "ok": true,
 "result": {
  "message_id": 8315,
  "from": {
   "id": 6129457865,
   "is_bot": true,
   "first_name": "Бот Виталий",
   "username": "sicheebot"
  },
  "chat": {
   "id": 461699897,
   "first_name": "Anton",
   "last_name": "Titowets",
   "username": "JKIee",
   "type": "private"
  },
  "date": 1728453470,
  "forward_origin": {
   "type": "channel",
   "chat": {
    "id": -1001893407333,
    "title": "Тестовый канал",
    "username": "testsichee",
    "type": "channel"
   },
   "message_id": 9440,
   "date": 1728453289
  },
  "forward_from_chat": {
   "id": -1001893407333,
   "title": "Тестовый канал",
   "username": "testsichee",
   "type": "channel"
  },
  "forward_from_message_id": 9440,
  "forward_date": 1728453289,
  "text": "Строковое значение"
 }
}
```

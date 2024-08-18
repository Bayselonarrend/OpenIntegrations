---
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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    ChatID    = "461699897";
    ChannelID = "@testsichee";
    MessageID = "5920";

    Result = OPI_Telegram.ForwardMessage(Token, MessageID, ChannelID, ChatID);
```



```sh title="CLI command example"
    
  oint telegram ForwardMessage --token "6129457865:AAFyzNYOAFbu..." --message %message% --from %from% --to %to%

```

```json title="Result"
{
  "ok": true,
  "result": {
  "message_id": 4649,
  "from": {
  "id": 6129457865,
  "is_bot": true,
  "first_name": "Vitaly The Bot",
  "username": "sicheebot"
  },
  "chat": {
  "id": 461699897,
  "first_name": "Anton",
  "last_name": "Titowets",
  "username": "JKIee",
  "type": "private"
  },
  "date": 1717072482,
  "forward_origin": {
  "type": "channel",
  "chat": {
  "id": -1001893407333,
  "title": "Test channel",
  "username": "testsichee",
  "type": "channel"
  },
  "message_id": 4686,
  "date": 1717072354
  },
  "forward_from_chat": {
  "id": -1001893407333,
  "title": "Test channel",
  "username": "testsichee",
  "type": "channel"
  },
  "forward_from_message_id": 4686,
  "forward_date": 1717072354,
  "text": "String value"
  }
  }
```

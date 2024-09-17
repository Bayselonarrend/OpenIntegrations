﻿---
sidebar_position: 1
---

# Send text message
 Sends a text message to a chat or channel



`Function SendTextMessage(Val Token, Val ChatID, Val Text, Val Keyboard = "", Val Markup = "Markdown", Val RepliedID = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Text | --text | String | Message text |
  | Keyboard | --keyboard | String | Keyboard JSON or path to .json |
  | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |
  | RepliedID | --reply | String, Number | Reply to message ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];

    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);

    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text);
```



```sh title="CLI command example"
    
  oint telegram SendTextMessage --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "String value" --keyboard %keyboard% --parsemode %parsemode% --reply %reply%

```

```json title="Result"
{
  "ok": true,
  "result": {
  "message_id": 4638,
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
  "date": 1717072354,
  "text": "String value"
  }
  }
```

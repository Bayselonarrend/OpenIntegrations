---
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
  | Keyboard | --keyboard | String | Keyboard. See FormKeyboardFromButtonArray |
  | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |
  | RepliedID | --reply | String, Number | Reply to message ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>

:::tip
Method at API documentation: [sendMessage](https://core.telegram.org/bots/api#sendmessage)
:::
<br/>


```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    ChatID    = "461699897";
    ChannelID = "@testsichee";
    Text      = "Строковое значение";

    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);

    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text);
```
 



```json title="Result"
{
 "ok": true,
 "result": {
  "message_id": 8302,
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
  "date": 1728453289,
  "text": "Строковое значение"
 }
}
```

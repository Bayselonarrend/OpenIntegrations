---
sidebar_position: 7
---

# Delete message
 Delete message from chat or channel



`Function DeleteMessage(Val Token, Val ChatID, Val MessageID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --chat | String, Number | Target chat ID |
  | MessageID | --message | String, Number | ID of message to delete |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
  Token     = FunctionParameters["Telegram_Token"];
  ChatID    = FunctionParameters["Telegram_ChannelID"];
  MessageID = FunctionParameters["Telegram_ChannelMessageID"];
  
  Result = OPI_Telegram.DeleteMessage(Token, ChatID, MessageID);
```



```sh title="CLI command example"
    
  oint telegram DeleteMessage --token "6129457865:AAFyzNYOAFbu..." --chat "@testsichee" --message "6846"

```

```json title="Result"
{
  "ok": true,
  "result": true
  }
```

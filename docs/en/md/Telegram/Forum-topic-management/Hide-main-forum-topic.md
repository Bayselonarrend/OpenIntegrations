---
sidebar_position: 7
---

# Hide main forum thread
 Hides the main forum thread



`Function HideMainForumTopic(Val Token, Val ChatID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --forum | String, Number | Thread chat ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
  Token = FunctionParameters["Telegram_Token"];
  Chat  = FunctionParameters["Telegram_ForumID"];
  
  Result = OPI_Telegram.HideMainForumTopic(Token, Chat);
```



```sh title="CLI command example"
    
  oint telegram HideMainForumTopic --token "6129457865:AAFyzNYOAFbu..." --forum %forum%

```

```json title="Result"
{
  "ok": true,
  "result": true
  }
```

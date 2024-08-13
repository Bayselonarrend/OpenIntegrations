---
sidebar_position: 9
---

# Edit main forum thread name
 Edits the name of the main forum thread



`Function EditMainForumTopicName(Val Token, Val ChatID, Val Title) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --forum | String, Number | Thread chat ID |
  | Title | --title | String | New main thread name |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
  Title = "New main thread name " + String(New UUID);
  Token = "6129457865:AAFyzNYOAFbu...";
  Chat = "-1001971186208";
  
  Result = OPI_Telegram.EditMainForumTopicName(Token, Chat, Title);
```



```sh title="CLI command example"
    
  oint telegram EditMainForumTopicName --token "6129457865:AAFyzNYOAFbu..." --forum %forum% --title %title%

```

```json title="Result"
{
  "ok": true,
  "result": true
  }
```

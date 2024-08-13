---
sidebar_position: 6
---

# Delete forum thread
 Deletes a forum thread



`Function DeleteForumTopic(Val Token, Val ChatID, Val ThreadID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ChatID | --forum | String, Number | Thread chat ID |
  | ThreadID | --topic | String, Number | Thread ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token = "6129457865:AAFyzNYOAFbu...";
    Chat  = "-1001971186208";
    Topic = "3896";

    Result = OPI_Telegram.DeleteForumTopic(Token, Chat, Topic);
```



```sh title="CLI command example"
    
  oint telegram DeleteForumTopic --token "6129457865:AAFyzNYOAFbu..." --forum %forum% --topic %topic%

```

```json title="Result"
  {
  "ok": true,
  "result": true
  }

```

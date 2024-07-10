---
sidebar_position: 8
---

# Show main forum thread
 Shows a previously hidden main forum thread




<br/>


*Function ShowMainForumTopic(Val Token, Val ChatID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | ChatID | --forum | String, Number | Thread chat ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Telegram


```bsl title="Code example"
 Token = "6129457865:AAFyzNYOAFbu...";
 Chat = "-1001971186208";
 
 Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);
```
	


```sh title="CLI command example"
 
 oint telegram ShowMainForumTopic --token "6129457865:AAFyzNYOAFbu..." --forum %forum%

```

```json title="Result"
 {
 "ok": true,
 "result": true
}
```

---
sidebar_position: 5
---

# Unpin message
 Unpins a message in the chat header


*Function UnpinMessage(Val Token, Val ChatID, Val MessageID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chat | String, Number | Target chat ID |
 | MessageID | --message | String, Number | Target message ID |

 
 Returns: Key-Value Pair - Serialized JSON response from Telegram

```bsl title="Code example"
	
 Token = "6129457865:AAFyzNYOAFbu...";
 ChannelID = "@testsichee";
 MessageID = "4951";
 
 Result = OPI_Telegram.UnpinMessage(Token, ChannelID, MessageID);
 
	
```

```sh title="CLI command example"
 
 oint telegram UnpinMessage --token "6129457865:AAFyzNYOAFbu..." --chat %chat% --message "4951"


```


```json title="Result"

{
 "ok": true,
 "result": true
}

```

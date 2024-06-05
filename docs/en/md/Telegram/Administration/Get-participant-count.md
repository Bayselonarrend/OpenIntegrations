---
sidebar_position: 6
---

# Get participant count
 Gets the total number of chat participants


*Function GetParticipantCount(Val Token, Val ChatID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chat | String, Number | Target chat ID |

 
 Returns: Key-Value Pair - Serialized JSON response from Telegram

```bsl title="Code example"
	
 Token = "6129457865:AAFyzNYOAFbu...";
 ChannelID = "@testsichee";
 
 Result = OPI_Telegram.GetParticipantCount(Token, ChannelID);
 
	
```

```sh title="CLI command example"
 
 oint telegram GetParticipantCount --token "6129457865:AAFyzNYOAFbu..." --chat %chat%


```


```json title="Result"

{
 "ok": true,
 "result": 2
}

```

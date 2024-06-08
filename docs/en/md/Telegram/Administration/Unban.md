---
sidebar_position: 2
---

# Unban
 Unbans a previously banned user


*Function Unban(Val Token, Val ChatID, Val UserID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
 | UserID | --user | String, Number | Target user ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Telegram

```bsl title="Code example"
	
 Token = "6129457865:AAFyzNYOAFbu...";
 UserID = "461699897";
 ChannelID = "@testsichee";
 
 Result = OPI_Telegram.Unban(Token, ChannelID, UserID);
	
```

```sh title="CLI command example"
 
 oint telegram Unban --token "6129457865:AAFyzNYOAFbu..." --chat %chat% --user "461699897"


```


```json title="Result"

{
 "ok": false,
 "error_code": 400,
 "description": "Bad Request: can't remove chat owner"
}

```

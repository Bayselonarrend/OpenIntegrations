---
sidebar_position: 1
---

# Get bot information
Executes the getMe request, returning basic bot information: name, id, ability to add the bot to groups, etc..


*Function GetBotInformation(Val Token) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Telegram

```bsl title="Code example"
	
 Token = "6129457865:AAFyzNYOAFbu...";
 Result = OPI_Telegram.GetBotInformation(Token);
	
```

```sh title="CLI command example"
 
 oint telegram GetBotInformation --token "6129457865:AAFyzNYOAFbu..."


```


```json title="Result"

{
 "ok": true,
 "result": {
 "id": 6129457865,
 "is_bot": true,
 "first_name": "Vitaly The Bot",
 "username": "sicheebot",
 "can_join_groups": true,
 "can_read_all_group_messages": false,
 "supports_inline_queries": false,
 "can_connect_to_business": false
 }
}

```

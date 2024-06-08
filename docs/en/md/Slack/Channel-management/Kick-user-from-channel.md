---
sidebar_position: 8
---

# Kick user from channel
 Removes specified user from channel


*Function KickUserFromChannel(Val Token, Val Channel, Val User) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |
 | User | --user | String | User ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 User = "U06UG1CAYH2";
 Channel = "C070VPMKN8J";
 
 Response = OPI_Slack.KickUserFromChannel(Token, Channel, User); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
	
```

```sh title="CLI command example"
 
 oint slack KickUserFromChannel --token %token% --channel "C070VPMKN8J" --user "U06UG1CAYH2"


```


```json title="Result"

{
 "ok": true
 }

```

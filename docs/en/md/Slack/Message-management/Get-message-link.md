---
sidebar_position: 6
---

# Get message link
 Gets a permanent URL to the channel message


*Function GetMessageLink(Val Token, Val Channel, Val Timestamp) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |
 | Timestamp | --stamp | String | Timestamp or message ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 Channel = "C070VPMKN8J";
 Timestamp = "1714146538.221929";
 
 Response = OPI_Slack.GetMessageLink(Token, Channel, Timestamp); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
 
	
```

```sh title="CLI command example"
 
 oint slack GetMessageLink --token %token% --channel "C070VPMKN8J" --stamp "1714146538.221929"


```


```json title="Result"

{
 "ok": true,
 "permalink": "https://openintegrationsgroup.slack.com/archives/C06UFNUTKUL/p1714146538221929",
 "channel": "C06UFNUTKUL"
 }

```

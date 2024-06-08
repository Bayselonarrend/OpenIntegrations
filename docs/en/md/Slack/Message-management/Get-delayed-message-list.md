---
sidebar_position: 5
---

# Get list of delayed messages
 Gets a list of delayed channel messages


*Function GetDelayedMessageList(Val Token, Val Channel, Val Cursor = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |
 | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 Channel = "C070VPMKN8J";
 
 Response = OPI_Slack.GetDelayedMessageList(Token, Channel); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
	
```

```sh title="CLI command example"
 
 oint slack GetDelayedMessageList --token %token% --channel "C070VPMKN8J" --cursor %cursor%


```


```json title="Result"

{
 "ok": true,
 "scheduled_messages": [],
 "response_metadata": {
 "next_cursor": ""
 }
 }

```

---
sidebar_position: 2
---

# Get channel user list
 Gets a list of users in the specified channel


*Function GetChannelUserList(Val Token, Val Channel, Val Cursor = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |
 | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 Channel = "C070VPMKN8J";
 
 Response = OPI_Slack.GetChannelUserList(Token, Channel); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
	
```

```sh title="CLI command example"
 
 oint slack GetChannelUserList --token %token% --channel "C070VPMKN8J" --cursor %cursor%

```


```json title="Result"

{
 "ok": true,
 "members": [
 "U06UG1CAYH2"
 ],
 "response_metadata": {
 "next_cursor": ""
 }
 }

```

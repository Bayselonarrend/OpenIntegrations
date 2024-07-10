---
sidebar_position: 10
---

# Leave channel
 Removes the current bot from the channel


<br/>


`Function LeaveChannel(Val Token, Val Channel) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
 
 Channel = "C070VPMKN8J";
 
 Response = OPI_Slack.LeaveChannel(Token, Channel); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint slack LeaveChannel --token %token% --channel "C070VPMKN8J"

```

```json title="Result"
{
 "ok": true
 }
```

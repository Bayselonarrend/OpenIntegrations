---
sidebar_position: 4
---

# Archive channel
 Archives an active channel


<br/>


`Function ArchiveChannel(Val Token, Val Channel) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
Channel = "C070VPMKN8J";
 
 Response = OPI_Slack.ArchiveChannel(Token, Channel); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint slack ArchiveChannel --token %token% --channel "C070VPMKN8J"

```

```json title="Result"
{
 "ok": true
 }
```

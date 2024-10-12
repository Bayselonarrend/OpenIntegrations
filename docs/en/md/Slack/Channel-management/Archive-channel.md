---
sidebar_position: 4
---

# Archive channel
 Archives an active channel



`Function ArchiveChannel(Val Token, Val Channel) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C07R61HC15M";

    Result = OPI_Slack.ArchiveChannel(Token, Channel);
```



```sh title="CLI command example"
    
  oint slack ArchiveChannel --token %token% --channel "C070VPMKN8J"

```

```json title="Result"
{
 "ok": true
}
```

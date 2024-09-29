---
sidebar_position: 10
---

# Leave channel
 Removes the current bot from the channel



`Function LeaveChannel(Val Token, Val Channel) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "";

    Result = OPI_Slack.LeaveChannel(Token, Channel);
```



```sh title="CLI command example"
    
  oint slack LeaveChannel --token %token% --channel "C070VPMKN8J"

```

```json title="Result"
{
  "ok": true
  }
```

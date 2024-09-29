---
sidebar_position: 4
---

# Delete message
 Deletes a channel message by timestamp



`Function DeleteMessage(Val Token, Val Channel, Val Timestamp, Val IsDelayed = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Timestamp | --stamp | String | Timestamp or message ID |
  | IsDelayed | --issheduled | Boolean | Indicator of deleting a delayed message |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token     = "xoxb-6965308400114-696804637...";
    Channel   = "C06UFNUTKUL";
    Timestamp = "1727601574.499569";

    Result = OPI_Slack.DeleteMessage(Token, Channel, Timestamp);
```



```sh title="CLI command example"
    
  oint slack DeleteMessage --token %token% --channel "C06UFNUTKUL" --stamp "1714146538.221929" --issheduled %issheduled%

```

```json title="Result"
{
  "ok": true,
  "channel": "C06UFNUTKUL",
  "ts": "1714146538.221929"
  }
```

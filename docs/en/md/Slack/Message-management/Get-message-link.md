---
sidebar_position: 6
---

# Get message link
 Gets a permanent URL to the channel message



`Function GetMessageLink(Val Token, Val Channel, Val Timestamp) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Timestamp | --stamp | String | Timestamp or message ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token     = "xoxb-6965308400114-696804637...";
    Channel   = "C06UFNUTKUL";
    Timestamp = "1727619071.222019";

    Result = OPI_Slack.GetMessageLink(Token, Channel, Timestamp);
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

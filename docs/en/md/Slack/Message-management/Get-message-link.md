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

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token     = "xoxb-6965308400114-696804637...";
    Channel   = "C06UFNUTKUL";
    Timestamp = "1728821869.840169";

    Result = OPI_Slack.GetMessageLink(Token, Channel, Timestamp);
```



```sh title="CLI command example"
    
  oint slack GetMessageLink --token %token% --channel "C070VPMKN8J" --stamp "1714146538.221929"

```

```json title="Result"
{
 "ok": true,
 "permalink": "https://openintegrationsgroup.slack.com/archives/C06UFNUTKUL/p1728454508757479",
 "channel": "C06UFNUTKUL"
}
```

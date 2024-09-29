---
sidebar_position: 5
---

# Get list of delayed messages
 Gets a list of delayed channel messages



`Function GetDelayedMessageList(Val Token, Val Channel, Val Cursor = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C06UFNUTKUL";

    Result = OPI_Slack.GetDelayedMessageList(Token, Channel);
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

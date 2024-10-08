---
sidebar_position: 2
---

# Send ephemeral message
Sends a message that arrives in the channel but is visible only to a specific user



`Function SendEphemeralMessage(Val Token, Val Channel, Val Text = "", Val User = "", Val Blocks = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Text | --text | String | Message text |
  | User | --user | String | User ID |
  | Blocks | --blocks | Array of Structure | JSON array of block descriptions |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C06UFNUTKUL";
    User    = "U06UABH3APP";
    Image   = "https://openyellow.neocities.org/test_data/picture.jpg";
    Text    = "Ephemeral message";

    Block  = OPI_Slack.GenerateImageBlock(Image, "Image");
    Result = OPI_Slack.SendEphemeralMessage(Token, Channel, Text, User, Block);
```



```sh title="CLI command example"
    
  oint slack SendEphemeralMessage --token %token% --channel "C070VPMKN8J" --text %text% --user %user% --blocks %blocks%

```

```json title="Result"
{
 "ok": true,
 "message_ts": "1728328831.000300"
}
```

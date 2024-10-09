---
sidebar_position: 1
---

# Send message
 Sends a message at a selected hour



`Function SendMessage(Val Token, Val Channel, Val Text = "", Val SendingDate = "", Val Blocks = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Text | --text | String | Message text |
  | SendingDate | --date | Date | Sending date for delayed message |
  | Blocks | --blocks | Array of Structure | JSON array of block descriptions |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C06UFNUTKUL";

    // Text

    Text   = "TestMessage1";
    Result = OPI_Slack.SendMessage(Token, Channel, Text);

    // With attachments (picture block in the example)

    Text       = "Message with picture";
    Image      = "https://openyellow.neocities.org/test_data/picture.jpg";
    BlockArray = New Array;

    Block = OPI_Slack.GenerateImageBlock(Image, "Image");
    BlockArray.Add(Block);

    Result = OPI_Slack.SendMessage(Token, Channel, Text, , BlockArray);

    // Sheduled

    Text = "Sheduled message";
    Hour = 3600;
    Day  = 24;

    SendingDate = OPI_Tools.GetCurrentDate() + (Day * Hour);
    Result      = OPI_Slack.SendMessage(Token, Channel, Text, SendingDate);
```



```sh title="CLI command example"
    
  oint slack SendMessage --token %token% --channel "C070VPMKN8J" --text "TestMessage" --date %date% --blocks %blocks%

```

```json title="Result"
{
 "ok": true,
 "channel": "C06UFNUTKUL",
 "ts": "1728454508.757479",
 "message": {
  "user": "U06UG1CAYH2",
  "type": "message",
  "ts": "1728454508.757479",
  "bot_id": "B06TZ0MJV5M",
  "app_id": "A06TYNH45RV",
  "text": "TestMessage1",
  "team": "T06UD92BS3C",
  "bot_profile": {
   "id": "B06TZ0MJV5M",
   "app_id": "A06TYNH45RV",
   "name": "OpenIntegrations",
   "icons": {
    "image_36": "https://a.slack-edge.com/80588/img/plugins/app/bot_36.png",
    "image_48": "https://a.slack-edge.com/80588/img/plugins/app/bot_48.png",
    "image_72": "https://a.slack-edge.com/80588/img/plugins/app/service_72.png"
   },
   "deleted": false,
   "updated": 1713205238,
   "team_id": "T06UD92BS3C"
  },
  "blocks": [
   {
    "type": "rich_text",
    "block_id": "g/EJA",
    "elements": [
     {
      "type": "rich_text_section",
      "elements": [
       {
        "type": "text",
        "text": "TestMessage1"
       }
      ]
     }
    ]
   }
  ]
 }
}
```

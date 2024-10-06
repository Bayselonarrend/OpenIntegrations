---
sidebar_position: 3
---

# Edit message
 Edits the content of an existing message



`Function EditMessage(Val Token, Val Channel, Val Timestamp, Val Text = "", Val BlockArray = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Timestamp | --stamp | String | Message timestamp |
  | Text | --text | String | New message text |
  | BlockArray | --blocks | Array of Structure | JSON array of block descriptions |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token     = "xoxb-6965308400114-696804637...";
    Channel   = "C06UFNUTKUL";
    Timestamp = "1727627095.229429";

    Text = "TestMessage2";

    Result = OPI_Slack.EditMessage(Token, Channel, Timestamp, Text);
```



```sh title="CLI command example"
    
  oint slack EditMessage --token %token% --channel "C070VPMKN8J" --stamp "1714146538.221929" --text "TestMessage2" --blocks %blocks%

```

```json title="Result"
{
 "ok": true,
 "channel": "C06UFNUTKUL",
 "ts": "1728140448.697169",
 "text": "TestMessage2",
 "message": {
  "user": "U06UG1CAYH2",
  "type": "message",
  "edited": {
   "user": "B06TZ0MJV5M",
   "ts": "1728140450.000000"
  },
  "bot_id": "B06TZ0MJV5M",
  "app_id": "A06TYNH45RV",
  "text": "TestMessage2",
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
    "block_id": "x1M",
    "elements": [
     {
      "type": "rich_text_section",
      "elements": [
       {
        "type": "text",
        "text": "TestMessage2"
       }
      ]
     }
    ]
   }
  ]
 }
}
```

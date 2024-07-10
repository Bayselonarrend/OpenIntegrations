---
sidebar_position: 1
---

# Send message
 Sends a message at a selected hour


<br/>


`Function SendMessage(Val Token, Val Channel, Val Text = "", Val SendingDate = "", Val Blocks = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |
 | Text | --text | String | Message text |
 | SendingDate | --date | Date | Sending date for delayed message |
 | Blocks | --blocks | Array of Structure | JSON array of block descriptions |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack





```bsl title="Code example"
 
 Channel = "C070VPMKN8J";
 Text = "TestMessage";
 
 Response = OPI_Slack.SendMessage(Token, Channel, Text); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint slack SendMessage --token %token% --channel "C070VPMKN8J" --text "TestMessage" --date %date% --blocks %blocks%

```

```json title="Result"
 {
 "ok": true,
 "channel": "C06UFNUTKUL",
 "ts": "1714146538.221929",
 "message": {
 "user": "U06UG1CAYH2",
 "type": "message",
 "ts": "1714146538.221929",
 "bot_id": "B06TZ0MJV5M",
 "app_id": "A06TYNH45RV",
 "text": "TestMessage",
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
 "block_id": "MO6",
 "elements": [
 {
 "type": "rich_text_section",
 "elements": [
 {
 "type": "text",
 "text": "TestMessage"
 }
 ]
 }
 ]
 }
 ]
 }
 }
```

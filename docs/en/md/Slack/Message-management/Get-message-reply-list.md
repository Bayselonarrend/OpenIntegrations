﻿---
sidebar_position: 7
---

# Get list of message replies
 Gets an array of messages that are replies to the specified



`Function GetMessageReplyList(Val Token, Val Channel, Val Timestamp, Val Cursor = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Timestamp | --stamp | String | Timestamp or message ID |
  | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token     = "xoxb-6965308400114-696804637...";
    Channel   = "C06UFNUTKUL";
    Timestamp = "1728734663.700299";

    Result = OPI_Slack.GetMessageReplyList(Token, Channel, Timestamp);
```



```sh title="CLI command example"
    
  oint slack GetMessageReplyList --token %token% --channel "C070VPMKN8J" --stamp "1714146538.221929" --cursor %cursor%

```

```json title="Result"
{
 "ok": true,
 "messages": [
  {
   "user": "U06UG1CAYH2",
   "type": "message",
   "ts": "1728454508.757479",
   "edited": {
    "user": "B06TZ0MJV5M",
    "ts": "1728454510.000000"
   },
   "bot_id": "B06TZ0MJV5M",
   "app_id": "A06TYNH45RV",
   "text": "TestMessage2",
   "team": "T06UD92BS3C",
   "bot_profile": {
    "id": "B06TZ0MJV5M",
    "deleted": false,
    "name": "OpenIntegrations",
    "updated": 1713205238,
    "app_id": "A06TYNH45RV",
    "icons": {
     "image_36": "https://a.slack-edge.com/80588/img/plugins/app/bot_36.png",
     "image_48": "https://a.slack-edge.com/80588/img/plugins/app/bot_48.png",
     "image_72": "https://a.slack-edge.com/80588/img/plugins/app/service_72.png"
    },
    "team_id": "T06UD92BS3C"
   },
   "blocks": [
    {
     "type": "rich_text",
     "block_id": "kWY",
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
 ],
 "has_more": false
}
```

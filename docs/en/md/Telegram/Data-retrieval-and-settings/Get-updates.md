﻿---
sidebar_position: 2
---

# Get updates
 Executes a request /getUpdates, returning information about bot events. Used in polling mode



`Function GetUpdates(Val Token, Val Timeout = 0, Val Offset = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Timeout | --timeout | String, Number | Waiting time for new events |
  | Offset | --offset | String, Number | Offset in the list of received messages |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token  = "6129457865:AAFyzNYOAFbu...";
    Result = OPI_Telegram.GetUpdates(Token);
```



```sh title="CLI command example"
    
  oint telegram GetUpdates --token "6129457865:AAFyzNYOAFbu..." --timeout %timeout% --offset %offset%

```

```json title="Result"
{
 "ok": true,
 "result": [
  {
   "update_id": 291369021,
   "channel_post": {
    "message_id": 9439,
    "sender_chat": {
     "id": -1001893407333,
     "title": "Тестовый канал",
     "username": "testsichee",
     "type": "channel"
    },
    "chat": {
     "id": -1001893407333,
     "title": "Тестовый канал",
     "username": "testsichee",
     "type": "channel"
    },
    "date": 1728411383,
    "pinned_message": {
     "message_id": 9420,
     "sender_chat": {
      "id": -1001893407333,
      "title": "Тестовый канал",
      "username": "testsichee",
      "type": "channel"
     },
     "chat": {
      "id": -1001893407333,
      "title": "Тестовый канал",
      "username": "testsichee",
      "type": "channel"
     },
     "date": 1728411163,
     "text": "Строковое значение"
    }
   }
  },
  {
   "update_id": 291369022,
   "message": {
    "message_id": 5396,
    "from": {
     "id": 6129457865,
     "is_bot": true,
     "first_name": "Бот Виталий",
     "username": "sicheebot"
    },
    "chat": {
     "id": -1001971186208,
     "title": "Тест",
     "is_forum": true,
     "type": "supergroup"
    },
    "date": 1728411415,
    "message_thread_id": 5396,
    "forum_topic_created": {
     "name": "TestTopic 8efb59a8-19c1-46f6-afb9-ceadd411e795",
     "icon_color": 7322096,
     "icon_custom_emoji_id": "5357419403325481346"
    },
    "is_topic_message": true
   }
  },
  {
   "update_id": 291369023,
   "message": {
    "message_id": 5398,
    "from": {
     "id": 6129457865,
     "is_bot": true,
     "first_name": "Бот Виталий",
     "username": "sicheebot"
    },
    "chat": {
     "id": -1001971186208,
     "title": "Тест",
     "is_forum": true,
     "type": "supergroup"
    },
    "date": 1728411416,
    "message_thread_id": 5396,
    "reply_to_message": {
     "message_id": 5396,
     "from": {
      "id": 6129457865,
      "is_bot": true,
      "first_name": "Бот Виталий",
      "username": "sicheebot"
     },
     "chat": {
      "id": -1001971186208,
      "title": "Тест",
      "is_forum": true,
      "type": "supergroup"
     },
     "date": 1728411415,
     "message_thread_id": 5396,
     "forum_topic_created": {
      "name": "TestTopic 8efb59a8-19c1-46f6-afb9-ceadd411e795",
      "icon_color": 7322096,
      "icon_custom_emoji_id": "5357419403325481346"
     },
     "is_topic_message": true
    },
    "forum_topic_edited": {
     "name": "NewTestTitle",
     "icon_custom_emoji_id": "5310132165583840589"
    },
    "is_topic_message": true
   }
  },
  {
   "update_id": 291369024,
   "message": {
    "message_id": 5399,
    "from": {
     "id": 6129457865,
     "is_bot": true,
     "first_name": "Бот Виталий",
     "username": "sicheebot"
    },
    "chat": {
     "id": -1001971186208,
     "title": "Тест",
     "is_forum": true,
     "type": "supergroup"
    },
    "date": 1728411421,
    "forum_topic_reopened": {}
   }
  },
  {
   "update_id": 291369025,
   "message": {
    "message_id": 5400,
    "from": {
     "id": 6129457865,
     "is_bot": true,
     "first_name": "Бот Виталий",
     "username": "sicheebot"
    },
    "chat": {
     "id": -1001971186208,
     "title": "Тест",
     "is_forum": true,
     "type": "supergroup"
    },
    "date": 1728411421,
...
```

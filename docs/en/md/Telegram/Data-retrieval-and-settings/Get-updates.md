---
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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

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
   "update_id": 291368966,
   "channel_post": {
    "message_id": 9339,
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
    "date": 1728281085,
    "pinned_message": {
     "message_id": 9320,
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
     "date": 1728280847,
     "text": "Строковое значение"
    }
   }
  },
  {
   "update_id": 291368967,
   "message": {
    "message_id": 5341,
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
    "date": 1728281118,
    "message_thread_id": 5341,
    "forum_topic_created": {
     "name": "Тестовая тема 8898a5f6-baa5-44f3-88c6-869fa23fd971",
     "icon_color": 7322096,
     "icon_custom_emoji_id": "5357419403325481346"
    },
    "is_topic_message": true
   }
  },
  {
   "update_id": 291368968,
   "message": {
    "message_id": 5343,
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
    "date": 1728281119,
    "message_thread_id": 5341,
    "reply_to_message": {
     "message_id": 5341,
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
     "date": 1728281118,
     "message_thread_id": 5341,
     "forum_topic_created": {
      "name": "Тестовая тема 8898a5f6-baa5-44f3-88c6-869fa23fd971",
      "icon_color": 7322096,
      "icon_custom_emoji_id": "5357419403325481346"
     },
     "is_topic_message": true
    },
    "forum_topic_edited": {
     "name": "Новый тестовый заголовок",
     "icon_custom_emoji_id": "5310132165583840589"
    },
    "is_topic_message": true
   }
  },
  {
   "update_id": 291368969,
   "message": {
    "message_id": 5344,
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
    "date": 1728281124,
    "forum_topic_reopened": {}
   }
  },
  {
   "update_id": 291368970,
   "message": {
    "message_id": 5345,
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
    "date": 1728281124,
...
```

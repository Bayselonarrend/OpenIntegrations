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
   "update_id": 291368911,
   "channel_post": {
    "message_id": 9239,
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
    "date": 1728117446,
    "pinned_message": {
     "message_id": 9220,
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
     "date": 1728117234,
     "text": "Строковое значение"
    }
   }
  },
  {
   "update_id": 291368912,
   "message": {
    "message_id": 5286,
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
    "date": 1728117479,
    "message_thread_id": 5286,
    "forum_topic_created": {
     "name": "Тестовая тема 1cefa555-acbb-4e9a-95ab-ecb220943de1",
     "icon_color": 7322096,
     "icon_custom_emoji_id": "5357419403325481346"
    },
    "is_topic_message": true
   }
  },
  {
   "update_id": 291368913,
   "message": {
    "message_id": 5288,
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
    "date": 1728117479,
    "message_thread_id": 5286,
    "reply_to_message": {
     "message_id": 5286,
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
     "date": 1728117479,
     "message_thread_id": 5286,
     "forum_topic_created": {
      "name": "Тестовая тема 1cefa555-acbb-4e9a-95ab-ecb220943de1",
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
   "update_id": 291368914,
   "message": {
    "message_id": 5289,
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
    "date": 1728117484,
    "forum_topic_reopened": {}
   }
  },
  {
   "update_id": 291368915,
   "message": {
    "message_id": 5290,
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
    "date": 1728117484,
...
```

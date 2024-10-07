---
sidebar_position: 2
---

# Получить обновления
 Выполняет запрос /getUpdates, возвращающий информацию о событиях бота. Используется при работе в polling режиме



`Функция ПолучитьОбновления(Знач Токен, Знач Таймаут = 0, Знач Смещение = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Таймаут | --timeout | Строка,Число | Время ожидания новых событий |
  | Смещение | --offset | Строка,Число | Смещение в списке получаемых сообщений |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>




```bsl title="Пример кода"
    Токен          = "6129457865:AAFyzNYOAFbu...";
    Результат      = OPI_Telegram.ПолучитьОбновления(Токен);
```



```sh title="Пример команды CLI"
    
  oint telegram ПолучитьОбновления --token "6129457865:AAFyzNYOAFbu..." --timeout %timeout% --offset %offset%

```

```json title="Результат"
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

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
   "update_id": 291368955,
   "channel_post": {
    "message_id": 9319,
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
    "date": 1728223871,
    "pinned_message": {
     "message_id": 9300,
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
     "date": 1728223640,
     "text": "Строковое значение"
    }
   }
  },
  {
   "update_id": 291368956,
   "message": {
    "message_id": 5330,
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
    "date": 1728223904,
    "message_thread_id": 5330,
    "forum_topic_created": {
     "name": "Тестовая тема d04cf5f7-7845-4ec5-a485-3b327e16dd0d",
     "icon_color": 7322096,
     "icon_custom_emoji_id": "5357419403325481346"
    },
    "is_topic_message": true
   }
  },
  {
   "update_id": 291368957,
   "message": {
    "message_id": 5332,
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
    "date": 1728223904,
    "message_thread_id": 5330,
    "reply_to_message": {
     "message_id": 5330,
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
     "date": 1728223904,
     "message_thread_id": 5330,
     "forum_topic_created": {
      "name": "Тестовая тема d04cf5f7-7845-4ec5-a485-3b327e16dd0d",
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
   "update_id": 291368958,
   "message": {
    "message_id": 5333,
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
    "date": 1728223909,
    "forum_topic_reopened": {}
   }
  },
  {
   "update_id": 291368959,
   "message": {
    "message_id": 5334,
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
    "date": 1728223909,
...
```

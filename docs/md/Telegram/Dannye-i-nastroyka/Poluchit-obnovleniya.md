---
sidebar_position: 2
---

# Получить обновления
Выполняет запрос getUpdates, возвращающий информацию о событиях бота. Используется при работе в polling режиме


*Функция ПолучитьОбновления(Знач Токен, Знач Таймаут = 0, Знач Смещение = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Таймаут | --timeout | Строка,Число | Время ожидания новых событий |
  | Смещение | --offset | Строка,Число | Смещение в списке получаемых сообщений |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
    Токен       = "6129457865:AAFyzNYOAFbu...";
    Результат   = OPI_Telegram.ПолучитьОбновления(Токен);

	
```

```sh title="Пример команд CLI"
    
  oint telegram ПолучитьОбновления --token "6129457865:AAFyzNYOAFbu..." --timeout %timeout% --offset %offset%

```


```json title="Результат"

{
 "ok": true,
 "result": [
  {
   "update_id": 291365945,
   "channel_post": {
    "message_id": 4605,
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
    "date": 1716906762,
    "pinned_message": {
     "message_id": 4590,
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
     "date": 1716906624,
     "text": "Строковое значение"
    }
   }
  },
  {
   "update_id": 291365946,
   "message": {
    "message_id": 2391,
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
    "date": 1716906786,
    "message_thread_id": 2391,
    "forum_topic_created": {
     "name": "Тестовая тема 62658df2-1bcc-4e17-8909-4afc3091c0d1",
     "icon_color": 7322096,
     "icon_custom_emoji_id": "5357419403325481346"
    },
    "is_topic_message": true
   }
  },
  {
   "update_id": 291365947,
   "message": {
    "message_id": 2393,
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
    "date": 1716906786,
    "message_thread_id": 2391,
    "reply_to_message": {
     "message_id": 2391,
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
     "date": 1716906786,
     "message_thread_id": 2391,
     "forum_topic_created": {
      "name": "Тестовая тема 62658df2-1bcc-4e17-8909-4afc3091c0d1",
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
   "update_id": 291365948,
   "message": {
    "message_id": 2394,
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
    "date": 1716906791,
    "forum_topic_reopened": {}
   }
  },
  {
   "update_id": 291365949,
   "message": {
    "message_id": 2395,
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
    "date": 1716906792,
    "forum_topic_closed": {}
   }
  },
  {
   "update_id": 291365950,
   "message": {
    "message_id": 2396,
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
    "date": 1716906792,
    "message_thread_id": 2391,
    "reply_to_message": {
     "message_id": 2391,
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
     "date": 1716906786,
     "message_thread_id": 2391,
     "forum_topic_created": {
      "name": "Тестовая тема 62658df2-1bcc-4e17-8909-4afc3091c0d1",
      "icon_color": 7322096,
      "icon_custom_emoji_id": "5357419403325481346"
     },
     "is_topic_message": true
    },
    "forum_topic_closed": {},
    "is_topic_message": true
   }
  },
  {
   "update_id": 291365951,
   "message": {
    "message_id": 2397,
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
    "date": 1716906817,
    "forum_topic_reopened": {}
   }
  },
  {
   "update_id": 291365952,
   "message": {
    "message_id": 2398,
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
    "date": 1716906817,
    "message_thread_id": 2391,
    "reply_to_message": {
     "message_id": 2391,
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
     "date": 1716906786,
     "message_thread_id": 2391,
     "forum_topic_created": {
      "name": "Тестовая тема 62658df2-1bcc-4e17-8909-4afc3091c0d1",
      "icon_color": 7322096,
      "icon_custom_emoji_id": "5357419403325481346"
     },
     "is_topic_message": true
    },
    "forum_topic_reopened": {},
    "is_topic_message": true
   }
  },
  {
   "update_id": 291365953,
   "message": {
    "message_id": 2399,
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
    "date": 1716906874,
    "forum_topic_edited": {
     "name": "Новое имя главной темы 4165f5f1-3d08-4d4e-830f-c6572cc171c6"
    }
   }
  },
  {
   "update_id": 291365954,
   "message": {
    "message_id": 2400,
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
    "date": 1716906880,
    "general_forum_topic_hidden": {}
   }
  },
  {
   "update_id": 291365955,
   "message": {
    "message_id": 2401,
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
    "date": 1716906885,
    "general_forum_topic_unhidden": {}
   }
  }
 ]
}

```

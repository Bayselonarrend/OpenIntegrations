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
   "update_id": 291366000,
   "channel_post": {
    "message_id": 4685,
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
    "date": 1717054881,
    "pinned_message": {
     "message_id": 4670,
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
     "date": 1717054721,
     "text": "Строковое значение"
    }
   }
  },
  {
   "update_id": 291366001,
   "message": {
    "message_id": 2446,
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
    "date": 1717054906,
    "message_thread_id": 2446,
    "forum_topic_created": {
     "name": "Тестовая тема fb0492fb-3a2d-4496-8309-b119226ef9f9",
     "icon_color": 7322096,
     "icon_custom_emoji_id": "5357419403325481346"
    },
    "is_topic_message": true
   }
  },
  {
   "update_id": 291366002,
   "message": {
    "message_id": 2448,
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
    "date": 1717054907,
    "message_thread_id": 2446,
    "reply_to_message": {
     "message_id": 2446,
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
     "date": 1717054906,
     "message_thread_id": 2446,
     "forum_topic_created": {
      "name": "Тестовая тема fb0492fb-3a2d-4496-8309-b119226ef9f9",
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
   "update_id": 291366003,
   "message": {
    "message_id": 2449,
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
    "date": 1717054912,
    "forum_topic_reopened": {}
   }
  },
  {
   "update_id": 291366004,
   "message": {
    "message_id": 2450,
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
    "date": 1717054912,
    "forum_topic_closed": {}
   }
  },
  {
   "update_id": 291366005,
   "message": {
    "message_id": 2451,
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
    "date": 1717054912,
    "message_thread_id": 2446,
    "reply_to_message": {
     "message_id": 2446,
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
     "date": 1717054906,
     "message_thread_id": 2446,
     "forum_topic_created": {
      "name": "Тестовая тема fb0492fb-3a2d-4496-8309-b119226ef9f9",
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
   "update_id": 291366006,
   "message": {
    "message_id": 2452,
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
    "date": 1717054937,
    "forum_topic_reopened": {}
   }
  },
  {
   "update_id": 291366007,
   "message": {
    "message_id": 2453,
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
    "date": 1717054937,
    "message_thread_id": 2446,
    "reply_to_message": {
     "message_id": 2446,
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
     "date": 1717054906,
     "message_thread_id": 2446,
     "forum_topic_created": {
      "name": "Тестовая тема fb0492fb-3a2d-4496-8309-b119226ef9f9",
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
   "update_id": 291366008,
   "message": {
    "message_id": 2454,
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
    "date": 1717054995,
    "forum_topic_edited": {
     "name": "Новое имя главной темы b7ff8b12-563b-417f-8218-a460d59d7f7f"
    }
   }
  },
  {
   "update_id": 291366009,
   "message": {
    "message_id": 2455,
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
    "date": 1717055002,
    "general_forum_topic_hidden": {}
   }
  },
  {
   "update_id": 291366010,
   "message": {
    "message_id": 2456,
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
    "date": 1717055007,
    "general_forum_topic_unhidden": {}
   }
  }
 ]
}

```

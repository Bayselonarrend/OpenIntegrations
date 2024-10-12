---
sidebar_position: 3
---

# Изменить сообщение
 Изменяет состав существующего сообщения



`Функция ИзменитьСообщение(Знач Токен, Знач Канал, Знач Отметка, Знач Текст = "", Знач МассивБлоков = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | Идентификатор канала |
  | Отметка | --stamp | Строка | Временная отметка сообщения |
  | Текст | --text | Строка | Новый текст сообщения |
  | МассивБлоков | --blocks | Массив Из Структура | JSON массива описаний блоков |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен   = "xoxb-6965308400114-696804637...";
    Канал   = "C06UFNUTKUL";
    Отметка = "1728734663.700299";

    Текст = "Тестовое сообщение 2";

    Результат = OPI_Slack.ИзменитьСообщение(Токен, Канал, Отметка, Текст);
```



```sh title="Пример команды CLI"
    
  oint slack ИзменитьСообщение --token %token% --channel "C070VPMKN8J" --stamp "1714146538.221929" --text "Тестовое сообщение 2" --blocks %blocks%

```

```json title="Результат"
{
 "ok": true,
 "channel": "C06UFNUTKUL",
 "ts": "1728409447.484679",
 "text": "Тестовое сообщение 2",
 "message": {
  "user": "U06UG1CAYH2",
  "type": "message",
  "edited": {
   "user": "B06TZ0MJV5M",
   "ts": "1728409448.000000"
  },
  "bot_id": "B06TZ0MJV5M",
  "app_id": "A06TYNH45RV",
  "text": "Тестовое сообщение 2",
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
    "block_id": "gpG",
    "elements": [
     {
      "type": "rich_text_section",
      "elements": [
       {
        "type": "text",
        "text": "Тестовое сообщение 2"
       }
      ]
     }
    ]
   }
  ]
 }
}
```

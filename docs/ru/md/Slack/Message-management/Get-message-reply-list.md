---
sidebar_position: 7
---

# Получить список ответов на сообщение
 Получает массив сообщений, которые являются ответом на указанное



`Функция ПолучитьСписокОтветовНаСообщение(Знач Токен, Знач Канал, Знач Отметка, Знач Курсор = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | Идентификатор канала |
  | Отметка | --stamp | Строка | Временная отметка или ID сообщения |
  | Курсор | --cursor | Строка | Указатель из предыдущего запроса, если строк результата > 100 |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен   = "xoxb-6965308400114-696804637...";
    Канал   = "C06UFNUTKUL";
    Отметка = "1727627095.229429";

    Результат = OPI_Slack.ПолучитьСписокОтветовНаСообщение(Токен, Канал, Отметка);
```



```sh title="Пример команды CLI"
    
  oint slack ПолучитьСписокОтветовНаСообщение --token %token% --channel "C070VPMKN8J" --stamp "1714146538.221929" --cursor %cursor%

```

```json title="Результат"
{
 "ok": true,
 "messages": [
  {
   "user": "U06UG1CAYH2",
   "type": "message",
   "ts": "1728306062.198279",
   "edited": {
    "user": "B06TZ0MJV5M",
    "ts": "1728306063.000000"
   },
   "bot_id": "B06TZ0MJV5M",
   "app_id": "A06TYNH45RV",
   "text": "Тестовое сообщение 2",
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
     "block_id": "rmnG0",
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
 ],
 "has_more": false
}
```

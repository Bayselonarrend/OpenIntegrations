---
sidebar_position: 1
---

# Отправить сообщение
 Отправляет сообщение в выбранный час


*Функция ОтправитьСообщение(Знач Токен, Знач Канал, Знач Текст = "", Знач ДатаОтправки = "", Знач Блоки = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | Идентификатор канала |
  | Текст | --text | Строка | Текст сообщения |
  | ДатаОтправки | --date | Дата | Дата отправки для отложенного сообщения |
  | Блоки | --blocks | Массив Из Структура | JSON массива описаний блоков |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

```bsl title="Пример кода"
	
  
  Канал   = "C070VPMKN8J";
  Текст   = "Тестовое сообщение";
  
  Ответ = OPI_Slack.ОтправитьСообщение(Токен, Канал, Текст); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                //JSON строка
  

	
```

```sh title="Пример команды CLI"
    
  oint slack ОтправитьСообщение --token %token% --channel "C070VPMKN8J" --text "Тестовое сообщение" --date %date% --blocks %blocks%


```


```json title="Результат"

{
  "ok": true,
  "channel": "C06UFNUTKUL",
  "ts": "1714146538.221929",
  "message": {
  "user": "U06UG1CAYH2",
  "type": "message",
  "ts": "1714146538.221929",
  "bot_id": "B06TZ0MJV5M",
  "app_id": "A06TYNH45RV",
  "text": "Тестовое сообщение",
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
  "block_id": "MO6",
  "elements": [
  {
  "type": "rich_text_section",
  "elements": [
  {
  "type": "text",
  "text": "Тестовое сообщение"
  }
  ]
  }
  ]
  }
  ]
  }
  }

```

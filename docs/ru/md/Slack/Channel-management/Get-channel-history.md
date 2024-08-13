---
sidebar_position: 6
---

# Получить историю канала
 Получает информацию событиях канала



`Функция ПолучитьИсториюКанала(Знач Токен, Знач Канал) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
  
  Канал = "C070VPMKN8J";
  
  Ответ = OPI_Slack.ПолучитьИсториюКанала(Токен, Канал); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);            //JSON строка
```



```sh title="Пример команды CLI"
    
  oint slack ПолучитьИсториюКанала --token %token% --channel "C070VPMKN8J"

```

```json title="Результат"
{
  "ok": true,
  "messages": [
  {
  "subtype": "channel_join",
  "user": "U06UABH3APP",
  "text": "<@U06UABH3APP> has joined the channel",
  "inviter": "U06UG1CAYH2",
  "type": "message",
  "ts": "1714146543.286219"
  },
  {
  "subtype": "channel_purpose",
  "user": "U06UG1CAYH2",
  "purpose": "Тестовая цель",
  "text": "set the channel description: Тестовая цель",
  "type": "message",
  "ts": "1714146543.014349"
  },
  {
  "subtype": "channel_topic",
  "user": "U06UG1CAYH2",
  "topic": "Тестовая тема",
  "text": "set the channel topic: Тестовая тема",
  "type": "message",
  "ts": "1714146542.849559"
  },
  {
  "subtype": "channel_join",
  "user": "U06UG1CAYH2",
  "text": "<@U06UG1CAYH2> has joined the channel",
  "type": "message",
  "ts": "1714146542.605859"
  }
  ],
  "has_more": false,
  "pin_count": 0,
  "channel_actions_ts": null,
  "channel_actions_count": 0
  }
```

---
sidebar_position: 5
---

# Переместить событие
 Перемещает событие в другой календарь


*Функция ПереместитьСобытие(Знач Токен, Знач КалендарьИсточник, Знач КалендарьПриемник, Знач Событие) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | КалендарьИсточник | --from | Строка | ID календаря источника |
  | КалендарьПриемник | --to | Строка | ID календаря приемника |
  | Событие | --event | Строка | ID события календаря источника |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	
  
  Ответ = OPI_GoogleCalendar.ПереместитьСобытие(Токен, "bayselonarrend@gmail.com", "55868c32be16935f0...", "j4nonfcc0m2...");  //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                                                                  //Строка
  
	
```

```sh title="Пример команды CLI"
    
  oint gcalendar ПереместитьСобытие --token %token% --from %from% --to %to% --event %event%

```


```json title="Результат"

{
  "eventType": "default",
  "attachments": [
  {
  "iconLink": "",
  "title": "Картинка2",
  "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1"
  },
  {
  "iconLink": "",
  "title": "Картинка1",
  "fileUrl": "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png"
  }
  ],
  "reminders": {
  "useDefault": true
  },
  "sequence": 0,
  "start": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-24T16:20:49+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-24T17:20:49+03:00"
  },
  "iCalUID": "f9kkj2omsqtt67g12qh2jig8uk@google.com",
  "description": "Описание тестового события",
  "updated": "2024-02-24T10:20:51.234Z",
  "created": "2024-02-24T10:20:49.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=Zjlra2oyb21zcXR0NjdnMTJxaDJqaWc4dWsgYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "В офисе",
  "summary": "Новое событие",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "f9kkj2omsqtt67g12qh2jig8uk",
  "etag": "\"3417540102468000\"",
  "kind": "calendar#event"
  }

```

---
sidebar_position: 3
---

# Получить событие
 Получает событие по ID


*Функция ПолучитьСобытие(Знач Токен, Знач Календарь, Знач Событие) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | Событие | --event | Строка | ID события |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	
  
  Ответ = OPI_GoogleCalendar.ПолучитьСобытие(Токен, "55868c32be16935f0...", "j4nonfcc0m2...");  //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                                   //Строка
  
	
```

```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьСобытие --token %token% --calendar %calendar% --event %event%

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
  "dateTime": "2024-02-21T15:16:25+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-21T16:16:25+03:00"
  },
  "iCalUID": "j4nonfcc0m2mtop1vc8ivo8tb8@google.com",
  "description": "Описание тестового события",
  "updated": "2024-02-21T09:16:28.474Z",
  "created": "2024-02-21T09:16:28.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=ajRub25mY2MwbTJtdG9wMXZjOGl2bzh0YjggYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "В оффисе",
  "summary": "Новое событие",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "j4nonfcc0m2mtop1vc8ivo8tb8",
  "etag": "\"3417013976948000\"",
  "kind": "calendar#event"
  }

```

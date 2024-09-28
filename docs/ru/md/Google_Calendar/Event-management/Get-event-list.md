---
sidebar_position: 2
---

# Получить список событий
 Получает список всех событий календаря



`Функция ПолучитьСписокСобытий(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - Массив соответствий событий

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Календарь = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ПолучитьСписокСобытий(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьСписокСобытий --token %token% --calendar %calendar%

```

```json title="Результат"
[
  
  {
  "eventType": "default",
  "attachments": [
  {
  "iconLink": "",
  "title": "",
  "fileUrl": "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png"
  },
  {
  "iconLink": "",
  "title": "",
  "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1"
  }
  ],
  "reminders": {
  "useDefault": true
  },
  "sequence": 0,
  "start": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-20T05:31:12+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-20T06:31:12+03:00"
  },
  "iCalUID": "o6dt8kbedrmu15o53pgbrrv35o@google.com",
  "description": "Описание тестового события",
  "updated": "2024-02-20T11:31:13.044Z",
  "created": "2024-02-20T11:31:13.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=bzZkdDhrYmVkcm11MTVvNTNwZ2JycnYzNW8gYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "В оффисе",
  "summary": "Новое событие",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "o6dt8kbedrmu15o53pgbrrv35o",
  "etag": "\"3416857346088000\"",
  "kind": "calendar#event"
  },
  
  ]
```

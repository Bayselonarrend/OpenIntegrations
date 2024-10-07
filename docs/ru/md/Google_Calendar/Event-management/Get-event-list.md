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
    Токен     = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ПолучитьСписокСобытий(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьСписокСобытий --token %token% --calendar %calendar%

```

```json title="Результат"
[
 {
  "kind": "calendar#event",
  "etag": "\"3456563828924000\"",
  "id": "4updfl5oespcksbg2sh53i5u9o",
  "status": "confirmed",
  "htmlLink": "https://www.google.com/calendar/event?eid=NHVwZGZsNW9lc3Bja3NiZzJzaDUzaTV1OW8gM2UxNGUyZTliMTMwMmM3NGZkZTRiZjg5N2RiNGY0YTU1NmEyYzlhOWY5YzlhMmJmOTg4OGEzNGFhNDFiYjFlOUBn",
  "created": "2024-10-07T06:18:31Z",
  "updated": "2024-10-07T06:18:34.462Z",
  "summary": "Новое событие",
  "description": "Новое описание события",
  "location": "В офисе",
  "creator": {
   "email": "bayselonarrend@gmail.com"
  },
  "organizer": {
   "email": "3e14e2e9b1302c74fde4bf897db4f4a556a2c9a9f9c9a2bf9888a34aa41bb1e9@group.calendar.google.com",
   "displayName": "Тестовый календарь",
   "self": true
  },
  "start": {
   "dateTime": "2024-10-07T12:18:31+03:00",
   "timeZone": "Europe/Moscow"
  },
  "end": {
   "dateTime": "2024-10-07T13:18:31+03:00",
   "timeZone": "Europe/Moscow"
  },
  "iCalUID": "4updfl5oespcksbg2sh53i5u9o@google.com",
  "sequence": 0,
  "reminders": {
   "useDefault": true
  },
  "attachments": [
   {
    "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
    "title": "Картинка1",
    "iconLink": ""
   },
   {
    "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
    "title": "Картинка2",
    "iconLink": ""
   }
  ],
  "eventType": "default"
 }
]
```

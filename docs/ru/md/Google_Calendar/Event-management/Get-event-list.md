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
  "etag": "\"3456611767020000\"",
  "id": "v1nbiqleefc8mvhaifcic86h3c",
  "status": "confirmed",
  "htmlLink": "https://www.google.com/calendar/event?eid=djFuYmlxbGVlZmM4bXZoYWlmY2ljODZoM2MgZjE2YzUxYWNkN2ZmMDAwZjM3NzZjNGIzOGVlMWI2OGRmMDEzZjAyYTk5ZGYyNWYyZjc3MGU4NzM5Mzk4Y2Q0ZUBn",
  "created": "2024-10-07T12:58:00Z",
  "updated": "2024-10-07T12:58:03.51Z",
  "summary": "Новое событие",
  "description": "Новое описание события",
  "location": "В офисе",
  "creator": {
   "email": "bayselonarrend@gmail.com"
  },
  "organizer": {
   "email": "f16c51acd7ff000f3776c4b38ee1b68df013f02a99df25f2f770e8739398cd4e@group.calendar.google.com",
   "displayName": "Тестовый календарь",
   "self": true
  },
  "start": {
   "dateTime": "2024-10-07T18:58:00+03:00",
   "timeZone": "Europe/Moscow"
  },
  "end": {
   "dateTime": "2024-10-07T19:58:00+03:00",
   "timeZone": "Europe/Moscow"
  },
  "iCalUID": "v1nbiqleefc8mvhaifcic86h3c@google.com",
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

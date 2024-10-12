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
    Токен     = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Календарь = "c3e1276b51960f0e037480209bde23a7fded89b36e9d689e0d00951403165f59@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ПолучитьСписокСобытий(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьСписокСобытий --token %token% --calendar %calendar%

```

```json title="Результат"
[
 {
  "kind": "calendar#event",
  "etag": "\"3456818530772000\"",
  "id": "ukaeqabapn045fr78jnkr0m6dk",
  "status": "confirmed",
  "htmlLink": "https://www.google.com/calendar/event?eid=dWthZXFhYmFwbjA0NWZyNzhqbmtyMG02ZGsgZjhjYjI1MzUxNmNjOTkwZDFmMzZhN2QxNWNkYjgyNWZmZGMxNWM2Y2VlYWEyNWVmNzg5MjRkZTliZWVhM2E1NkBn",
  "created": "2024-10-08T17:41:01Z",
  "updated": "2024-10-08T17:41:05.386Z",
  "summary": "Новое событие",
  "description": "Новое описание события",
  "location": "В офисе",
  "creator": {
   "email": "bayselonarrend@gmail.com"
  },
  "organizer": {
   "email": "f8cb253516cc990d1f36a7d15cdb825ffdc15c6ceeaa25ef78924de9beea3a56@group.calendar.google.com",
   "displayName": "Тестовый календарь",
   "self": true
  },
  "start": {
   "dateTime": "2024-10-08T23:41:01+03:00",
   "timeZone": "Europe/Moscow"
  },
  "end": {
   "dateTime": "2024-10-09T00:41:01+03:00",
   "timeZone": "Europe/Moscow"
  },
  "iCalUID": "ukaeqabapn045fr78jnkr0m6dk@google.com",
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

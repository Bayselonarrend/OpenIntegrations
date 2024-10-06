---
sidebar_position: 3
---

# Получить событие
 Получает событие по ID



`Функция ПолучитьСобытие(Знач Токен, Знач Календарь, Знач Событие) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | Событие | --event | Строка | ID события |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    Событие   = "ro3gv4dokajnh90pcn58lel8e4";

    Результат = OPI_GoogleCalendar.ПолучитьСобытие(Токен, Календарь, Событие);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьСобытие --token %token% --calendar %calendar% --event %event%

```

```json title="Результат"
{
 "kind": "calendar#event",
 "etag": "\"3456449456840000\"",
 "id": "i54htl9nrvkh96c3l3c1inq5gc",
 "status": "confirmed",
 "htmlLink": "https://www.google.com/calendar/event?eid=aTU0aHRsOW5ydmtoOTZjM2wzYzFpbnE1Z2MgOGJlNDM0YzRhODY4N2I1ZTRjN2UzZGE3N2E3OWMwNGEzYzIwNGNhZTU2NjAxOTMyNWI2MjM2ZGQ3OGM4MmExMkBn",
 "created": "2024-10-06T14:25:27Z",
 "updated": "2024-10-06T14:25:28.42Z",
 "summary": "Новое событие",
 "description": "Новое описание события",
 "location": "В офисе",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "8be434c4a8687b5e4c7e3da77a79c04a3c204cae566019325b6236dd78c82a12@group.calendar.google.com",
  "displayName": "Тестовый календарь",
  "self": true
 },
 "start": {
  "dateTime": "2024-10-06T20:25:27+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-10-06T21:25:27+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "i54htl9nrvkh96c3l3c1inq5gc@google.com",
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
```

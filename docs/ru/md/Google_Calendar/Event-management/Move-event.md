---
sidebar_position: 5
---

# Переместить событие
 Перемещает событие в другой календарь



`Функция ПереместитьСобытие(Знач Токен, Знач КалендарьИсточник, Знач КалендарьПриемник, Знач Событие) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | КалендарьИсточник | --from | Строка | ID календаря источника |
  | КалендарьПриемник | --to | Строка | ID календаря приемника |
  | Событие | --event | Строка | ID события календаря источника |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Событие   = "ro3gv4dokajnh90pcn58lel8e4";

    КалендарьИсточник = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    КалендарьПриемник = "bayselonarrend@gmail.com";

    Результат = OPI_GoogleCalendar.ПереместитьСобытие(Токен, КалендарьИсточник, КалендарьПриемник, Событие);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПереместитьСобытие --token %token% --from %from% --to %to% --event %event%

```

```json title="Результат"
{
 "kind": "calendar#event",
 "etag": "\"3455224620938000\"",
 "id": "p0u9h3a7ouj4kg5682nesifg3o",
 "status": "cancelled",
 "htmlLink": "https://www.google.com/calendar/event?eid=cDB1OWgzYTdvdWo0a2c1NjgybmVzaWZnM28gMjZkMzIxMmM3NDYwYTQ2NDkwMWE1MTEzZDVjMWQ5MmRkZDExZWJlNDQ3MjJmMTBjYTVhNTJlZjdiMGFiNmI3ZUBn",
 "created": "2024-09-29T12:18:29Z",
 "updated": "2024-09-29T12:18:30.469Z",
 "summary": "Новое событие",
 "description": "Новое описание события",
 "location": "В офисе",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "bayselonarrend@gmail.com"
 },
 "start": {
  "dateTime": "2024-09-29T18:18:29+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-09-29T19:18:29+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "p0u9h3a7ouj4kg5682nesifg3o@google.com",
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

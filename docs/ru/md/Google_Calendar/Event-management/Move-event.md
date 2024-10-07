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
 "etag": "\"3456652628762000\"",
 "id": "0l4ive29hv02idgvqmhdvk6br4",
 "status": "cancelled",
 "htmlLink": "https://www.google.com/calendar/event?eid=MGw0aXZlMjlodjAyaWRndnFtaGR2azZicjQgY2I2NWU0MzIyNTBjZTZmMzI0MzI4OGMxM2IxYjAyZGJhY2E5YTg2MDBhY2Y5YzVhYWYzMzlhZTIwZTllYWE5ZEBn",
 "created": "2024-10-07T18:38:33Z",
 "updated": "2024-10-07T18:38:34.381Z",
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
  "dateTime": "2024-10-08T00:38:33+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-10-08T01:38:33+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "0l4ive29hv02idgvqmhdvk6br4@google.com",
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

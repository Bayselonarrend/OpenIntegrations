---
sidebar_position: 6
---

# Изменить событие
 Изменяет существующее событие



`Функция ИзменитьСобытие(Знач Токен, Знач Календарь, Знач ОписаниеСобытия, Знач Событие) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | ОписаниеСобытия | --props | Строка | Новое описание события |
  | Событие | --event | Строка | ID события |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    Событие   = "ro3gv4dokajnh90pcn58lel8e4";
    Описание  = "Новое описание события";

    ОписаниеСобытия = Новый Соответствие;
    ОписаниеСобытия.Вставить("Описание", Описание);

    Результат = OPI_GoogleCalendar.ИзменитьСобытие(Токен, Календарь, ОписаниеСобытия, Событие);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ИзменитьСобытие --token %token% --calendar %calendar% --props %props% --event %event%

```

```json title="Результат"
{
 "kind": "calendar#event",
 "etag": "\"3456652628762000\"",
 "id": "0l4ive29hv02idgvqmhdvk6br4",
 "status": "confirmed",
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
  "email": "cb65e432250ce6f3243288c13b1b02dbaca9a8600acf9c5aaf339ae20e9eaa9d@group.calendar.google.com",
  "displayName": "Тестовый календарь",
  "self": true
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

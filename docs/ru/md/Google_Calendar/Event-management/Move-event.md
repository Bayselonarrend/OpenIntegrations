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
    Токен     = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Событие   = "h51qr9dclbnie1hh633er26umo";

    КалендарьИсточник = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
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

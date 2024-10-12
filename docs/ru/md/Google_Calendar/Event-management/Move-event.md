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
    Токен     = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Событие   = "emu67rik57itgnpe7q5pp9vih0";

    КалендарьИсточник = "348d646d44d8e791661edfec6bce5af62e9022716033332bf3e3f18fea26a59e@group.calendar.google.com";
    КалендарьПриемник = "bayselonarrend@gmail.com";

    Результат = OPI_GoogleCalendar.ПереместитьСобытие(Токен, КалендарьИсточник, КалендарьПриемник, Событие);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПереместитьСобытие --token %token% --from %from% --to %to% --event %event%

```

```json title="Результат"
{
 "kind": "calendar#event",
 "etag": "\"3456818524660000\"",
 "id": "ukaeqabapn045fr78jnkr0m6dk",
 "status": "cancelled",
 "htmlLink": "https://www.google.com/calendar/event?eid=dWthZXFhYmFwbjA0NWZyNzhqbmtyMG02ZGsgZjhjYjI1MzUxNmNjOTkwZDFmMzZhN2QxNWNkYjgyNWZmZGMxNWM2Y2VlYWEyNWVmNzg5MjRkZTliZWVhM2E1NkBn",
 "created": "2024-10-08T17:41:01Z",
 "updated": "2024-10-08T17:41:02.33Z",
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
```

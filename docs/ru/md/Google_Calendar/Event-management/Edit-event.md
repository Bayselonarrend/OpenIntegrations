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
    Токен     = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Календарь = "cf73bcfa8a16eff552d6aa79a9610fdb38ec4db055ab1a0e3b93e32f8414f77c@group.calendar.google.com";
    Событие   = "g631dg23bi0fep1qd3qudu0ia4";
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
 "etag": "\"3456818524660000\"",
 "id": "ukaeqabapn045fr78jnkr0m6dk",
 "status": "confirmed",
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
```

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
    Токен     = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Календарь = "6fc8b0f11deef05d38eb5d351ab183db9cef1ba870b46367836fc9dc9b9eb4a4@group.calendar.google.com";
    Событие   = "941qv5ck599c83mplir8b0gqv0";
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

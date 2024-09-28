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
    Токен     = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Календарь = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Событие   = "h51qr9dclbnie1hh633er26umo";
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
  "eventType": "default",
  "attachments": [
  {
  "iconLink": "",
  "title": "Картинка2",
  "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1"
  },
  {
  "iconLink": "",
  "title": "Картинка1",
  "fileUrl": "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png"
  }
  ],
  "reminders": {
  "useDefault": true
  },
  "sequence": 0,
  "start": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-24T16:42:28+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-24T17:42:28+03:00"
  },
  "iCalUID": "7c2s6g3k6ib1mr2v1b7lnt9kfk@google.com",
  "description": "Описание тестового события (изм.)",
  "updated": "2024-02-24T10:42:42.401Z",
  "created": "2024-02-24T10:42:32.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=N2MyczZnM2s2aWIxbXIydjFiN2xudDlrZmsgYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "В офисе",
  "summary": "Новое событие",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "7c2s6g3k6ib1mr2v1b7lnt9kfk",
  "etag": "\"3417542724802000\"",
  "kind": "calendar#event"
  }
```

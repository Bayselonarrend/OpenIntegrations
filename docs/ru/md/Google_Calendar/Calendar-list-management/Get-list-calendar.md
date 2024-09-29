---
sidebar_position: 3
---

# Получить календарь списка
 Получает календарь из списка пользователя по ID



`Функция ПолучитьКалендарьСписка(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Календарь = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ПолучитьКалендарьСписка(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьКалендарьСписка --token %token% --calendar %calendar%

```

```json title="Результат"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1727612292253000\"",
 "id": "8b82e5e84747cf3a497bfbfa46baa7196614dd8f1211cd2ea79f02d2f9134b03@group.calendar.google.com",
 "summary": "Новое наименование",
 "description": "Новое описание",
 "timeZone": "Europe/Moscow",
 "colorId": "6",
 "backgroundColor": "#ffd800",
 "foregroundColor": "#000000",
 "accessRole": "owner",
 "defaultReminders": [],
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```

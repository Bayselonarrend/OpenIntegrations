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
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "accessRole": "owner",
  "foregroundColor": "#000000",
  "backgroundColor": "#ffd800",
  "colorId": "6",
  "description": "Тестовое описание",
  "summary": "Тестовый календарь (изм.)",
  "defaultReminders": [],
  "timeZone": "UTC",
  "id": "f0fad8c7db43ef0adb71cbf035eb08cf80d8f8d51ba31fa86f4d5680dc2e9725@group.calendar.google.com",
  "etag": "\"1708423563386000\"",
  "kind": "calendar#calendarListEntry"
  }
```

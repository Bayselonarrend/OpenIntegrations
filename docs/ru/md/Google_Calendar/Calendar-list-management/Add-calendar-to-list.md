---
sidebar_position: 2
---

# Добавить календарь в список
 Добавляет существующий календарь в список пользователя



`Функция ДобавитьКалендарьВСписок(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь    = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ДобавитьКалендарьВСписок(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ДобавитьКалендарьВСписок --token %token% --calendar %calendar%

```

```json title="Результат"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728305864217000\"",
 "id": "f09c0afb68a9fb0d25948a580d8d79f8aed1880e17329ae9ad23935d4310137a@group.calendar.google.com",
 "summary": "Новое наименование",
 "description": "Новое описание",
 "timeZone": "Europe/Moscow",
 "colorId": "3",
 "backgroundColor": "#f83a22",
 "foregroundColor": "#000000",
 "selected": true,
 "accessRole": "owner",
 "defaultReminders": [],
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```

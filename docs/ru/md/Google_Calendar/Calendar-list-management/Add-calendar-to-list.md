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
 "etag": "\"1728281895252000\"",
 "id": "9d9ef12d4d46423abf932e9356a4c8f5cfd6dc746bb10309ca904cb9a1ecfc6f@group.calendar.google.com",
 "summary": "Новое наименование",
 "description": "Новое описание",
 "timeZone": "Europe/Moscow",
 "colorId": "4",
 "backgroundColor": "#fa573c",
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

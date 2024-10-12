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
    Токен        = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Календарь    = "348d646d44d8e791661edfec6bce5af62e9022716033332bf3e3f18fea26a59e@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ДобавитьКалендарьВСписок(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ДобавитьКалендарьВСписок --token %token% --calendar %calendar%

```

```json title="Результат"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728409243618000\"",
 "id": "cc92fd648db664e3e2fcd62db4c9fd9f458cc49bbc6382560c48f59105aede70@group.calendar.google.com",
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

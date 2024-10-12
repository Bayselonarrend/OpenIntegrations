---
sidebar_position: 5
---

# Изменить календарь списка
 Изменяет свойства календаря из списка пользователей



`Функция ИзменитьКалендарьСписка(Знач Токен, Знач Календарь, Знач ОсновнойЦвет, Знач ДополнительныйЦвет, Знач Скрытый = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | ОсновнойЦвет | --primary | Строка | HEX основного цвета (#ffffff) |
  | ДополнительныйЦвет | --secondary | Строка | HEX дополнительного цвета (#ffffff) |
  | Скрытый | --hidden | Булево | Скрытый календарь |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен              = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Календарь          = "348d646d44d8e791661edfec6bce5af62e9022716033332bf3e3f18fea26a59e@group.calendar.google.com";
    ОсновнойЦвет       = "#000000";
    ДополнительныйЦвет = "#ffd800";
    Скрытый            = Ложь;

    Результат = OPI_GoogleCalendar.ИзменитьКалендарьСписка(Токен
        , Календарь
        , ОсновнойЦвет
        , ДополнительныйЦвет
        , Скрытый);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ИзменитьКалендарьСписка --token %token% --calendar %calendar% --primary %primary% --secondary %secondary% --hidden %hidden%

```

```json title="Результат"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728409243961000\"",
 "id": "cc92fd648db664e3e2fcd62db4c9fd9f458cc49bbc6382560c48f59105aede70@group.calendar.google.com",
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

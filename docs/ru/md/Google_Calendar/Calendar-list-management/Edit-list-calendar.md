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
    Токен              = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Календарь          = "cf73bcfa8a16eff552d6aa79a9610fdb38ec4db055ab1a0e3b93e32f8414f77c@group.calendar.google.com";
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

---
sidebar_position: 3
---

# Изменить календарь
 Изменяет свойства существуещего календаря



`Функция ИзменитьМетаданныеКалендаря(Знач Токен, Знач Календарь, Знач Наименование = "", Знач Описание = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | Наименование | --title | Строка | Новое наименование |
  | Описание | --description | Строка | Новое описание календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Календарь    = "cf73bcfa8a16eff552d6aa79a9610fdb38ec4db055ab1a0e3b93e32f8414f77c@group.calendar.google.com";
    Наименование = "Новое наименование";
    Описание     = "Новое описание";

    Результат = OPI_GoogleCalendar.ИзменитьМетаданныеКалендаря(Токен, Календарь, Наименование, Описание);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ИзменитьМетаданныеКалендаря --token %token% --calendar %calendar% --title "Тестовый календарь (изм.)" --description "Тестовое описание"

```

```json title="Результат"
{
 "kind": "calendar#calendar",
 "etag": "\"-qYh74xTwKSw29QLKr4MJFvKBgU\"",
 "id": "cc92fd648db664e3e2fcd62db4c9fd9f458cc49bbc6382560c48f59105aede70@group.calendar.google.com",
 "summary": "Новое наименование",
 "description": "Новое описание",
 "timeZone": "Europe/Moscow",
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```

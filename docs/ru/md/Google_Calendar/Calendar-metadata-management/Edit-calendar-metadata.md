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
    Токен        = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Календарь    = "9776ffc9103041e891559c22442cd210f397ca598957939d3a9fa15edfccfd62@group.calendar.google.com";
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

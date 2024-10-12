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
    Токен        = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Календарь    = "6fc8b0f11deef05d38eb5d351ab183db9cef1ba870b46367836fc9dc9b9eb4a4@group.calendar.google.com";
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

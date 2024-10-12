---
sidebar_position: 2
---

# Получить календарь
 Получает информацию о календаре по ID



`Функция ПолучитьМетаданныеКалендаря(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Календарь    = "c3e1276b51960f0e037480209bde23a7fded89b36e9d689e0d00951403165f59@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ПолучитьМетаданныеКалендаря(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьМетаданныеКалендаря --token %token% --calendar %calendar%

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

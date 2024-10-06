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
    Токен        = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь    = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
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
 "etag": "\"pRmTObvx1UZ_TCksYQmmSqHEdkA\"",
 "id": "131ea619014eaa11a1b297307da6c5e069825d5bb0a264f687d109f68f8264ef@group.calendar.google.com",
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

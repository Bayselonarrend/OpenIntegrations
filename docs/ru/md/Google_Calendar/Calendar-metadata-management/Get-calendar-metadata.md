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
    Токен        = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь    = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ПолучитьМетаданныеКалендаря(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьМетаданныеКалендаря --token %token% --calendar %calendar%

```

```json title="Результат"
{
 "kind": "calendar#calendar",
 "etag": "\"30buO-D-Pc_G7UUV5nHihm9JgF8\"",
 "id": "8b82e5e84747cf3a497bfbfa46baa7196614dd8f1211cd2ea79f02d2f9134b03@group.calendar.google.com",
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

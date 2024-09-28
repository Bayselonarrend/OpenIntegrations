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
    Токен        = "ya29.a0AcM612yhdixI9i7TxOgZIa9kwI5a42S4MfHVMdYZeolUKySbI7x1gtyAhGDlso57x7N6WNRpp9BZX0N3MQOcZEdR6lDciUHI4nof3u9xi...";
    Календарь    = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ПолучитьМетаданныеКалендаря(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьМетаданныеКалендаря --token %token% --calendar %calendar%

```

```json title="Результат"
{
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "description": "Тестовое описание",
  "summary": "Тестовый календарь (изм.)",
  "timeZone": "UTC",
  "id": "155868c32be26e4c4123a107810d40b929b516935f080e4747261fdc3416227c@group.calendar.google.com",
  "etag": "\"4A10_PI6FFY129ggELzZ8veUU-U\"",
  "kind": "calendar#calendar"
  }
```

---
sidebar_position: 2
---

# Получить календарь
 Получает информацию о календаре по ID


*Функция ПолучитьМетаданныеКалендаря(Знач Токен, Знач Календарь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	
  
  Ответ = OPI_GoogleCalendar.ПолучитьМетаданныеКалендаря(Токен, "55868c32be16935f0..."); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                            //Строка
  

	
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

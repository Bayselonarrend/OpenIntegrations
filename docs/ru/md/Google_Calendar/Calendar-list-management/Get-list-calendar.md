---
sidebar_position: 3
---

# Получить календарь списка
 Получает календарь из списка пользователя по ID



`Функция ПолучитьКалендарьСписка(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
  
  Ответ = OPI_GoogleCalendar.ПолучитьКалендарьСписка(Токен, "55868c32be16935f0..."); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                        //Строка
```
	


```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьКалендарьСписка --token %token% --calendar %calendar%

```

```json title="Результат"
{
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "accessRole": "owner",
  "foregroundColor": "#000000",
  "backgroundColor": "#ffd800",
  "colorId": "6",
  "description": "Тестовое описание",
  "summary": "Тестовый календарь (изм.)",
  "defaultReminders": [],
  "timeZone": "UTC",
  "id": "f0fad8c7db43ef0adb71cbf035eb08cf80d8f8d51ba31fa86f4d5680dc2e9725@group.calendar.google.com",
  "etag": "\"1708423563386000\"",
  "kind": "calendar#calendarListEntry"
  }
```

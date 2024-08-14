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
  
  
  Черный = "#000000";
  Желтый = "#ffd800";
  
  Ответ  = OPI_GoogleCalendar.ИзменитьКалендарьСписка(Токен, "55868c32be16935f0...", Черный, Желтый, Ложь); //Соответствие
  Ответ  = OPI_Инструменты.JSONСтрокой(Ответ);                                                              //Строка
```



```sh title="Пример команды CLI"
    
  oint gcalendar ИзменитьКалендарьСписка --token %token% --calendar %calendar% --primary %primary% --secondary %secondary% --hidden %hidden%

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
  "id": "0da65d69eba1e4b27f980447827b251ca2d94ecb1d30dba22c83559c33d0ea29@group.calendar.google.com",
  "etag": "\"1708424005038000\"",
  "kind": "calendar#calendarListEntry"
  }
```

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
    Токен              = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь          = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    ОсновнойЦвет       = "#000000";
    ДополнительныйЦвет = "#ffd800";
    Скрытый            = Ложь;

    Результат = OPI_GoogleCalendar.ИзменитьКалендарьСписка(Токен, Календарь, ОсновнойЦвет, ДополнительныйЦвет, Ложь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ИзменитьКалендарьСписка --token %token% --calendar %calendar% --primary %primary% --secondary %secondary% --hidden %hidden%

```

```json title="Результат"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728224710134000\"",
 "id": "131ea619014eaa11a1b297307da6c5e069825d5bb0a264f687d109f68f8264ef@group.calendar.google.com",
 "summary": "Новое наименование",
 "description": "Новое описание",
 "timeZone": "Europe/Moscow",
 "colorId": "6",
 "backgroundColor": "#ffd800",
 "foregroundColor": "#000000",
 "accessRole": "owner",
 "defaultReminders": [],
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```

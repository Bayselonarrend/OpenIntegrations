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
    Токен     = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Календарь = "9776ffc9103041e891559c22442cd210f397ca598957939d3a9fa15edfccfd62@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.ПолучитьКалендарьСписка(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ПолучитьКалендарьСписка --token %token% --calendar %calendar%

```

```json title="Результат"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728409243961000\"",
 "id": "cc92fd648db664e3e2fcd62db4c9fd9f458cc49bbc6382560c48f59105aede70@group.calendar.google.com",
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

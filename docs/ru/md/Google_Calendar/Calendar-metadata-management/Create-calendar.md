---
sidebar_position: 1
---

# Создать календарь
 Создает пустой календарь



`Функция СоздатьКалендарь(Знач Токен, Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Наименование | --title | Строка | Наименование создаваемого календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Наименование = "Тестовый календарь";

    Результат = OPI_GoogleCalendar.СоздатьКалендарь(Токен, Наименование);
```



```sh title="Пример команды CLI"
    
  oint gcalendar СоздатьКалендарь --token %token% --title %title%

```

```json title="Результат"
{
 "kind": "calendar#calendar",
 "etag": "\"3HshD0LA889W8w5lSPGvE18X3Co\"",
 "id": "f8cb253516cc990d1f36a7d15cdb825ffdc15c6ceeaa25ef78924de9beea3a56@group.calendar.google.com",
 "summary": "Тестовый календарь",
 "timeZone": "Europe/Moscow",
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```

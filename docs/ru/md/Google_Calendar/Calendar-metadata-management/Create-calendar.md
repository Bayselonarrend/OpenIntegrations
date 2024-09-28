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
    Токен        = "ya29.a0AcM612yhdixI9i7TxOgZIa9kwI5a42S4MfHVMdYZeolUKySbI7x1gtyAhGDlso57x7N6WNRpp9BZX0N3MQOcZEdR6lDciUHI4nof3u9xi...";
    Наименование = "Тестовый календарь";

    Результат = OPI_GoogleCalendar.СоздатьКалендарь(Токен, Наименование);
```



```sh title="Пример команды CLI"
    
  oint gcalendar СоздатьКалендарь --token %token% --title %title%

```

```json title="Результат"
{
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "summary": "Тестовый календарь",
  "timeZone": "UTC",
  "id": "75b64bec8700a640b004af3491867ac5e479884794f529699da23e7009f7d691@group.calendar.google.com",
  "etag": "\"ZlOrbHnYjwJB0APkTQupgFm7F3s\"",
  "kind": "calendar#calendar"
  }
```

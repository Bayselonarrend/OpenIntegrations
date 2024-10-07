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
    Токен        = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Наименование = "Тестовый календарь";

    Результат = OPI_GoogleCalendar.СоздатьКалендарь(Токен, Наименование);
```



```sh title="Пример команды CLI"
    
  oint gcalendar СоздатьКалендарь --token %token% --title %title%

```

```json title="Результат"
{
 "kind": "calendar#calendar",
 "etag": "\"-MyY7qTO_UIuA9uzSkRrg71pavc\"",
 "id": "f16c51acd7ff000f3776c4b38ee1b68df013f02a99df25f2f770e8739398cd4e@group.calendar.google.com",
 "summary": "Тестовый календарь",
 "timeZone": "Europe/Moscow",
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```

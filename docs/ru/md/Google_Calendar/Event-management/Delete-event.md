---
sidebar_position: 7
---

# Удалить событие
 Удаляет событие по ID



`Функция УдалитьСобытие(Знач Токен, Знач Календарь, Знач Событие) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | Событие | --event | Строка | ID события |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    Событие   = "ro3gv4dokajnh90pcn58lel8e4";

    Результат = OPI_GoogleCalendar.УдалитьСобытие(Токен, Календарь, Событие);
```



```sh title="Пример команды CLI"
    
  oint gcalendar УдалитьСобытие --token %token% --calendar %calendar% --event %event%

```

```json title="Результат"
null
```

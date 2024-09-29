---
sidebar_position: 5
---

# Удалить календарь
 Удаляет календарь по ID



`Функция УдалитьКалендарь(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.УдалитьКалендарь(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar УдалитьКалендарь --token %token% --calendar %calendar%

```

```json title="Результат"
null
```

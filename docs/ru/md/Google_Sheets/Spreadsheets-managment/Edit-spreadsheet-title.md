---
sidebar_position: 3
---

# Изменить наименование книги
 Изменяет наименование существующей книги



`Функция ИзменитьНаименованиеКниги(Знач Токен, Знач Книга, Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | ID книги |
  | Наименование | --title | Строка | Новое наименование |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Книга        = "1MvjT6qO5jQzS0O1o33GVv4ui59dIeDkdY8QLR6z5k9o";
    Наименование = "Тестовая таблица (изм.)";

    Результат    = OPI_GoogleSheets.ИзменитьНаименованиеКниги(Токен, Книга, Наименование);
```



```sh title="Пример команды CLI"
    
  oint gsheets ИзменитьНаименованиеКниги --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Тестовая таблица (изм.)"

```

```json title="Результат"
{
 "spreadsheetId": "10X8iuovjxQu8ZmOZ-r1d9dO5bxLqh25FVttLvk2-Uzg",
 "replies": [
  {}
 ]
}
```

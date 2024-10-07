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
    Токен        = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Книга        = "1IIUxPvgvrPCB92SXFISbKBFLAbmbHUIu_OysyC9w3Ow";
    Наименование = "Тестовая таблица (изм.)";

    Результат    = OPI_GoogleSheets.ИзменитьНаименованиеКниги(Токен, Книга, Наименование);
```



```sh title="Пример команды CLI"
    
  oint gsheets ИзменитьНаименованиеКниги --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Тестовая таблица (изм.)"

```

```json title="Результат"
{
 "spreadsheetId": "1GoN_UNuBUxoHe24oc6E9kkc3wMNwrscwHe1u0P0woZc",
 "replies": [
  {}
 ]
}
```

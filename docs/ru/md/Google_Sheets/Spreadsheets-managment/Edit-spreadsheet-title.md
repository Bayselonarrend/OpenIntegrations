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
    Токен        = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Книга        = "187aOtcDnHwx1wmHhU-QuGHMWyqZptBif9IVa_tBanNk";
    Наименование = "Тестовая таблица (изм.)";

    Результат    = OPI_GoogleSheets.ИзменитьНаименованиеКниги(Токен, Книга, Наименование);
```



```sh title="Пример команды CLI"
    
  oint gsheets ИзменитьНаименованиеКниги --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Тестовая таблица (изм.)"

```

```json title="Результат"
{
 "spreadsheetId": "1NH03Re5tvG0eZ8H3qgzKAMok6gim33SHvV4cRTHqlac",
 "replies": [
  {}
 ]
}
```

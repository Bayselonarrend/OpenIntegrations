---
sidebar_position: 2
---

# Удалить лист
 Удаляет лист из книги



`Функция УдалитьЛист(Знач Токен, Знач Книга, Знач Лист) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | Идентификатор книги |
  | Лист | --sheet | Строка | Идентификатор удаляемого листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Книга  = "187aOtcDnHwx1wmHhU-QuGHMWyqZptBif9IVa_tBanNk";
    Лист   = "1651217167";

    Результат = OPI_GoogleSheets.УдалитьЛист(Токен, Книга, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets УдалитьЛист --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --sheet "1790807910"

```

```json title="Результат"
{
 "spreadsheetId": "1NH03Re5tvG0eZ8H3qgzKAMok6gim33SHvV4cRTHqlac",
 "replies": [
  {}
 ]
}
```

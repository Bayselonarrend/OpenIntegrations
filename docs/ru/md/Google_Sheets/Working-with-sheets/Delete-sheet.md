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
    Токен  = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Книга  = "1byey4pYpbD_Bmh0c49QYSEfwkqTUwcTIqhMtrDyq7vQ";
    Лист   = "799706357";

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

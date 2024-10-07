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
    Токен  = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Книга  = "1IIUxPvgvrPCB92SXFISbKBFLAbmbHUIu_OysyC9w3Ow";
    Лист   = "1572277025";

    Результат = OPI_GoogleSheets.УдалитьЛист(Токен, Книга, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets УдалитьЛист --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --sheet "1790807910"

```

```json title="Результат"
{
 "spreadsheetId": "1V0OLeMMH0ZujcnH9qOlSlIYsaZJNWNp-FvX5qLDiJSs",
 "replies": [
  {}
 ]
}
```

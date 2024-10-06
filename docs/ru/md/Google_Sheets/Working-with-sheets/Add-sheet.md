---
sidebar_position: 1
---

# Добавить лист
 Добавляет новый лист в книгу



`Функция ДобавитьЛист(Знач Токен, Знач Книга, Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | Идентификатор книги |
  | Наименование | --title | Строка | Наименование нового листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Книга        = "1IIUxPvgvrPCB92SXFISbKBFLAbmbHUIu_OysyC9w3Ow";
    Наименование = "Тестовый лист";

    Результат = OPI_GoogleSheets.ДобавитьЛист(Токен, Книга, Наименование);
```



```sh title="Пример команды CLI"
    
  oint gsheets ДобавитьЛист --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Тестовый лист"

```

```json title="Результат"
{
 "spreadsheetId": "1mxYmxhIHE3DwJc3hRCgRlu_P0mVVNzgkQZHYZswmVuU",
 "replies": [
  {
   "addSheet": {
    "properties": {
     "sheetId": 95264201,
     "title": "Тестовый лист",
     "index": 2,
     "sheetType": "GRID",
     "gridProperties": {
      "rowCount": 1000,
      "columnCount": 26
     }
    }
   }
  }
 ]
}
```

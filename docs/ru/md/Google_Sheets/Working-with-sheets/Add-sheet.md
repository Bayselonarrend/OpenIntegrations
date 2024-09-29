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
    Токен        = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Книга        = "1pqjld5QO6zoOe8zPMthfFhGcwwaE6FdlDyw-UHgEP5c";
    Наименование = "Тестовый лист";

    Результат = OPI_GoogleSheets.ДобавитьЛист(Токен, Книга, Наименование);
```



```sh title="Пример команды CLI"
    
  oint gsheets ДобавитьЛист --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Тестовый лист"

```

```json title="Результат"
{
 "spreadsheetId": "10X8iuovjxQu8ZmOZ-r1d9dO5bxLqh25FVttLvk2-Uzg",
 "replies": [
  {
   "addSheet": {
    "properties": {
     "sheetId": 1451131863,
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

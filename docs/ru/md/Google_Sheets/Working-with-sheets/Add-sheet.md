---
sidebar_position: 1
---

# Добавить лист
 Добавляет новый лист в книгу


<br/>


`Функция ДобавитьЛист(Знач Токен, Знач Книга, Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | Идентификатор книги |
  | Наименование | --title | Строка | Наименование нового листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
  
  Книга        = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
  Наименование = "Тестовый лист";
  
  Ответ = OPI_GoogleSheets.ДобавитьЛист(Токен, Книга, Наименование); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                        //JSON строка
  
```
	


```sh title="Пример команды CLI"
    
  oint gsheets ДобавитьЛист --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --title "Тестовый лист"

```

```json title="Результат"
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "replies": [
  {
  "addSheet": {
  "properties": {
  "sheetId": 321892522,
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

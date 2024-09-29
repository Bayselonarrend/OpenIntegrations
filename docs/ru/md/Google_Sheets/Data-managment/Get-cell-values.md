---
sidebar_position: 3
---

# Получить значения ячеек
 Получает значения ячеек таблицы



`Функция ПолучитьЗначенияЯчеек(Знач Токен, Знач Книга, Знач МассивЯчеек = "", Знач Лист = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | ID книги |
  | МассивЯчеек | --cells | Массив из Строка | Массив ячеек вида А1 для получения (весь лист, если не заполнено) |
  | Лист | --sheetname | Строка | Имя листа (первый лист по умолчанию) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Книга  = "1pqjld5QO6zoOe8zPMthfFhGcwwaE6FdlDyw-UHgEP5c";
    Лист   = "Лист2";

    МассивЯчеек = Новый Массив;
    МассивЯчеек.Добавить("B2");
    МассивЯчеек.Добавить("A3");
    МассивЯчеек.Добавить("B4");

    Результат = OPI_GoogleSheets.ПолучитьЗначенияЯчеек(Токен, Книга, МассивЯчеек, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets ПолучитьЗначенияЯчеек --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --cells %cells% --sheetname "Лист2"

```

```json title="Результат"
{
 "spreadsheetId": "13s7kQuIHdVJR_QYXS3upKMWgHwBCDqsyz2vj_qTJWPg",
 "valueRanges": [
  {
   "range": "'Лист2'!B2",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это B2"
    ]
   ]
  },
  {
   "range": "'Лист2'!A3",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это A3"
    ]
   ]
  },
  {
   "range": "'Лист2'!B4",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это B4"
    ]
   ]
  }
 ]
}
```

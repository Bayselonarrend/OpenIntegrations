---
sidebar_position: 1
---

# Установить значения ячеек
 Устанавливает значения ячеек листа


*Функция УстановитьЗначенияЯчеек(Знач Токен, Знач Книга, Знач СоответствиеЗначений, Знач Лист = "", Знач ОсновноеИзмерение = "COLUMNS") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | ID книги |
  | СоответствиеЗначений | --data | Соответствие Из КлючИЗначение | Данные заполнения, где ключ это имя ячейки вида A1 |
  | Лист | --sheetname | Строка | Имя листа (первый лист по умолчанию) |
  | ОсновноеИзмерение | --dim | Строка | Основное измерение при заполнении диапазона массивом |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	
  
  СоответствиеЗначений = Новый Соответствие;
  СоответствиеЗначений.Вставить("A1", "Это A1");
  СоответствиеЗначений.Вставить("A2", "Это A2");
  СоответствиеЗначений.Вставить("B2", "Это B2");
  СоответствиеЗначений.Вставить("B3", "Это B3");
  СоответствиеЗначений.Вставить("A3", "Это A3");
  СоответствиеЗначений.Вставить("A4", "Это A4");
  СоответствиеЗначений.Вставить("B1", "Это B1");
  СоответствиеЗначений.Вставить("B4", "Это B4");
  
  Книга = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
  Лист  = "Лист2";
  
  Ответ = OPI_GoogleSheets.УстановитьЗначенияЯчеек(Токен, Книга, СоответствиеЗначений, Лист); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                                 //JSON строка
  

	
```

```sh title="Пример команды CLI"
    
  oint gsheets УстановитьЗначенияЯчеек --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --data %data% --sheetname "Лист2" --dim %dim%


```


```json title="Результат"

{
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "totalUpdatedRows": 4,
  "totalUpdatedColumns": 2,
  "totalUpdatedCells": 8,
  "totalUpdatedSheets": 1,
  "responses": [
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "updatedRange": "'Лист2'!A1",
  "updatedRows": 1,
  "updatedColumns": 1,
  "updatedCells": 1
  },
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "updatedRange": "'Лист2'!A2",
  "updatedRows": 1,
  "updatedColumns": 1,
  "updatedCells": 1
  },
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "updatedRange": "'Лист2'!B2",
  "updatedRows": 1,
  "updatedColumns": 1,
  "updatedCells": 1
  },
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "updatedRange": "'Лист2'!B3",
  "updatedRows": 1,
  "updatedColumns": 1,
  "updatedCells": 1
  },
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "updatedRange": "'Лист2'!A3",
  "updatedRows": 1,
  "updatedColumns": 1,
  "updatedCells": 1
  },
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "updatedRange": "'Лист2'!A4",
  "updatedRows": 1,
  "updatedColumns": 1,
  "updatedCells": 1
  },
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "updatedRange": "'Лист2'!B1",
  "updatedRows": 1,
  "updatedColumns": 1,
  "updatedCells": 1
  },
  {
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "updatedRange": "'Лист2'!B4",
  "updatedRows": 1,
  "updatedColumns": 1,
  "updatedCells": 1
  }
  ]
  }

```

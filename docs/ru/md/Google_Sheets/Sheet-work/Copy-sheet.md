---
sidebar_position: 3
---

# Копировать лист
 Копирует лист из одной книги в другую


*Функция КопироватьЛист(Знач Токен, Знач Откуда, Знач Куда, Знач Лист) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Откуда | --from | Строка | ID книги источника |
  | Куда | --to | Строка | ID книги приемника |
  | Лист | --sheet | Строка | ID копируемого листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	
  
  Откуда = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
  Куда   = "1tPDQHmduH9NASRhy0I-a6--ebNNJ5A6wXhhTRcNhD7s";
  Лист   = "25093199";
  
  Ответ = OPI_GoogleSheets.КопироватьЛист(Токен, Откуда, Куда, Лист); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                         //JSON строка
  

	
```

```sh title="Пример команды CLI"
    
  oint gsheets КопироватьЛист --token %token% --from "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --to "1tPDQHmduH9NASRhy0I-a6--ebNNJ5A6wXhhTRcNhD7s" --sheet "25093199"


```


```json title="Результат"

{
  "sheetId": 1790807910,
  "title": "Лист2 (копия)",
  "index": 2,
  "sheetType": "GRID",
  "gridProperties": {
  "rowCount": 1000,
  "columnCount": 26
  }
  }

```

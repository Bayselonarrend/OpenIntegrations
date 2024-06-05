---
sidebar_position: 2
---

# Удалить лист
 Удаляет лист из книги


*Функция УдалитьЛист(Знач Токен, Знач Книга, Знач Лист) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | Идентификатор книги |
  | Лист | --sheet | Строка | Идентификатор удаляемого листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	
  
  Книга = "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc";
  Лист  = "1790807910";
  
  Ответ = OPI_GoogleSheets.УдалитьЛист(Токен, Книга, Лист); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);               //JSON строка
  

	
```

```sh title="Пример команды CLI"
    
  oint gsheets УдалитьЛист --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --sheet "1790807910"


```


```json title="Результат"

{
  "spreadsheetId": "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc",
  "replies": [
  {}
  ]
  }

```

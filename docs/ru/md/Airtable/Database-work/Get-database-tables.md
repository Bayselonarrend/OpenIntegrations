---
sidebar_position: 2
---

# Получить таблицы базы
 Получает схему таблиц базы


*Функция ПолучитьТаблицыБазы(Знач Токен, Знач База) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

```bsl title="Пример кода"
	
      
      База = "apptm8Xqo7TwMaipQ";
      
      Ответ = OPI_Airtable.ПолучитьТаблицыБазы(Токен, База); //Соответствие
      Ответ = OPI_Инструменты.JSONСтрокой(Ответ);            //JSON строка
      
    
	
```

```sh title="Пример команды CLI"
    
      oint airtable ПолучитьТаблицыБазы --token %token% --base "apptm8Xqo7TwMaipQ"


```


```json title="Результат"

{
  "tables": [
  {
  "id": "tblqZzW78Rvsdt9gt",
  "name": "Тестовая таблица",
  "primaryFieldId": "fldj9Z3fEpLzv40d0",
  "fields": [
  {
  "type": "number",
  "options": {
  "precision": 0
  },
  "id": "fldj9Z3fEpLzv40d0",
  "name": "Номер"
  },
  {
  "type": "richText",
  "id": "fldX1kR7lienmcdEj",
  "name": "Строковое"
  }
  ],
  "views": [
  {
  "id": "viwbKE3PS9jl6bqJl",
  "name": "Grid view",
  "type": "grid"
  }
  ]
  }
  ]
  }

```

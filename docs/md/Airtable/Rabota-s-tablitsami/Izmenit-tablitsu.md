---
sidebar_position: 2
---

# Изменить таблицу
 Изменяет наименование и|или описание базы


*Функция ИзменитьТаблицу(Знач Токен, Знач База, Знач Таблица, Знач Наименование = "", Знач Описание = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | Наименование | --title | Строка | Новое наименование |
  | Описание | --description | Строка | Новое описание |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

```bsl title="Пример кода"
	

  Ответ = OPI_Airtable.ИзменитьТаблицу(Токен, База, Таблица, Наименование, Описание); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ); //JSON строка
	
```

```sh title="Пример команд CLI"
    
  oint Airtable ИзменитьТаблицу --token %token% --base %base% --table %table% --title %title% --description %description%

```


```json title="Результат"

{
 "id": "tblGCTowGBin5S8Xp",
 "name": "Тестовая таблица 2 (изм.)",
 "description": "Новая таблица (изм.)",
 "primaryFieldId": "fld57VBxeJ0Kz1oHT",
 "fields": [
  {
   "id": "fld57VBxeJ0Kz1oHT",
   "name": "Номер",
   "type": "number",
   "options": {
    "precision": 0
   }
  },
  {
   "id": "fldF3JiY6kD55VD5L",
   "name": "Строковое",
   "type": "richText"
  }
 ],
 "views": [
  {
   "id": "viw1RYgETyIB8zVIR",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}

```

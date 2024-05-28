---
sidebar_position: 1
---

# Создать таблицу
 Создает новую таблицу в базе


*Функция СоздатьТаблицу(Знач Токен, Знач База, Знач Наименование, Знач МассивПолей, Знач Описание = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы |
  | Наименование | --title | Строка | Наименование новой таблицы |
  | МассивПолей | --fieldsdata | Массив Из Структура | Массив описаний полей |
  | Описание | --description | Строка | Описание таблицы |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

```bsl title="Пример кода"
	

  Ответ = OPI_Airtable.СоздатьТаблицу(Токен, База, Наименование, МассивПолей, Описание); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ); //JSON строка
	
```

```sh title="Пример команд CLI"
    
  oint Airtable СоздатьТаблицу --token %token% --base %base% --title %title% --fieldsdata %fieldsdata% --description %description%

```


```json title="Результат"

{
 "id": "tblGCTowGBin5S8Xp",
 "name": "Тестовая таблица 2",
 "description": "Новая таблица",
 "primaryFieldId": "fld57VBxeJ0Kz1oHT",
 "fields": [
  {
   "type": "number",
   "options": {
    "precision": 0
   },
   "id": "fld57VBxeJ0Kz1oHT",
   "name": "Номер"
  },
  {
   "type": "richText",
   "id": "fldF3JiY6kD55VD5L",
   "name": "Строковое"
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

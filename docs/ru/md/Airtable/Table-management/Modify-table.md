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

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

```bsl title="Пример кода"
	
  
  База         = "apptm8Xqo7TwMaipQ";
  Таблица      = "tbl9G4jVoTJpxYwSY";
  Наименование = "Тестовая таблица 2 (изм.)";
  Описание     = "Новая таблица (изм.)";
  
  Ответ = OPI_Airtable.ИзменитьТаблицу(Токен, База, Таблица, Наименование, Описание); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                         //JSON строка
  

	
```

```sh title="Пример команды CLI"
    
  oint airtable ИзменитьТаблицу --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --title "Тестовая таблица 2 (изм.)" --description "Новая таблица (изм.)"


```


```json title="Результат"

{
  "id": "tblT64aWyrMUAbUmF",
  "name": "Тестовая таблица 2 (изм.)",
  "description": "Новая таблица (изм.)",
  "primaryFieldId": "fldoHs3kv6RLc8pjo",
  "fields": [
  {
  "id": "fldoHs3kv6RLc8pjo",
  "name": "Номер",
  "type": "number",
  "options": {
  "precision": 0
  }
  },
  {
  "id": "fldzY5xRHDY7ClKxa",
  "name": "Строковое",
  "type": "richText"
  },
  {
  "id": "fldYHxxXPALKl3yHp",
  "name": "Вложение",
  "type": "multipleAttachments",
  "options": {
  "isReversed": false
  }
  },
  {
  "id": "fldRUoggUObfqckXh",
  "name": "Флажок",
  "type": "checkbox",
  "options": {
  "icon": "check",
  "color": "yellowBright"
  }
  },
  {
  "id": "fldvtwjapJM7s99nN",
  "name": "Дата",
  "type": "date",
  "options": {
  "dateFormat": {
  "name": "iso",
  "format": "YYYY-MM-DD"
  }
  }
  },
  {
  "id": "flda4VY8dVd2mbqz9",
  "name": "Телефон",
  "type": "phoneNumber"
  },
  {
  "id": "fld8ZLKndqBIkT72s",
  "name": "Почта",
  "type": "email"
  },
  {
  "id": "fldqjsCp1c2KaAS53",
  "name": "Ссылка",
  "type": "url"
  }
  ],
  "views": [
  {
  "id": "viwX3vEGO5vB2Km4k",
  "name": "Grid view",
  "type": "grid"
  }
  ]
  }

```

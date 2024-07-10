---
sidebar_position: 1
---

# Создать таблицу
 Создает новую таблицу в базе



`Функция СоздатьТаблицу(Знач Токен, Знач База, Знач Наименование, Знач МассивПолей, Знач Описание = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы |
  | Наименование | --title | Строка | Наименование новой таблицы |
  | МассивПолей | --fieldsdata | Массив Из Структура | Массив описаний полей |
  | Описание | --description | Строка | Описание таблицы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

<br/>




```bsl title="Пример кода"
  
  База       = "apptm8Xqo7TwMaipQ";
  ИмяТаблицы = "Тестовая таблица 2";
  Описание   = "Новая таблица";
  
  МассивПолей = Новый Массив;
  МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеНомера("Номер"));
  МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеСтроковое("Строковое"));
  МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеВложения("Вложение"));
  МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеФлажка("Флажок"));
  МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеДаты("Дата"));
  МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеТелефона("Телефон"));
  МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеПочты("Почта"));
  МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеСсылки("Ссылка"));
  
  Ответ = OPI_Airtable.СоздатьТаблицу(Токен, База, Наименование, МассивПолей, Описание); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                            //JSON строка
```
	


```sh title="Пример команды CLI"
    
  oint airtable СоздатьТаблицу --token %token% --base "apptm8Xqo7TwMaipQ" --title %title% --fieldsdata %fieldsdata% --description "Новая таблица"

```

```json title="Результат"
{
  "id": "tblT64aWyrMUAbUmF",
  "name": "Тестовая таблица 2",
  "description": "Новая таблица",
  "primaryFieldId": "fldoHs3kv6RLc8pjo",
  "fields": [
  {
  "type": "number",
  "options": {
  "precision": 0
  },
  "id": "fldoHs3kv6RLc8pjo",
  "name": "Номер"
  },
  {
  "type": "richText",
  "id": "fldzY5xRHDY7ClKxa",
  "name": "Строковое"
  },
  {
  "type": "multipleAttachments",
  "options": {
  "isReversed": false
  },
  "id": "fldYHxxXPALKl3yHp",
  "name": "Вложение"
  },
  {
  "type": "checkbox",
  "options": {
  "icon": "check",
  "color": "yellowBright"
  },
  "id": "fldRUoggUObfqckXh",
  "name": "Флажок"
  },
  {
  "type": "date",
  "options": {
  "dateFormat": {
  "name": "iso",
  "format": "YYYY-MM-DD"
  }
  },
  "id": "fldvtwjapJM7s99nN",
  "name": "Дата"
  },
  {
  "type": "phoneNumber",
  "id": "flda4VY8dVd2mbqz9",
  "name": "Телефон"
  },
  {
  "type": "email",
  "id": "fld8ZLKndqBIkT72s",
  "name": "Почта"
  },
  {
  "type": "url",
  "id": "fldqjsCp1c2KaAS53",
  "name": "Ссылка"
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

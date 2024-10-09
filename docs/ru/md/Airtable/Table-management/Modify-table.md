---
sidebar_position: 2
---

# Изменить таблицу
 Изменяет наименование и|или описание базы



`Функция ИзменитьТаблицу(Знач Токен, Знач База, Знач Таблица, Знач Наименование = "", Знач Описание = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | Наименование | --title | Строка | Новое наименование |
  | Описание | --description | Строка | Новое описание |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

<br/>




```bsl title="Пример кода"
    Токен        = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    База         = "app9bSgL4YtTVGTlE";
    Таблица      = "tblDUGAZFZaeOwE6x";
    Наименование = "Тестовая таблица 2 (изм.)";
    Описание     = "Новая таблица (изм.)";

    Результат = OPI_Airtable.ИзменитьТаблицу(Токен, База, Таблица, Наименование, Описание);
```



```sh title="Пример команды CLI"
    
  oint airtable ИзменитьТаблицу --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --title "Тестовая таблица 2 (изм.)" --description "Новая таблица (изм.)"

```

```json title="Результат"
{
 "id": "tblhBYsKZ3w9qZzlj",
 "name": "Тестовая таблица 2 (изм.)",
 "description": "Новая таблица (изм.)",
 "primaryFieldId": "fld9iS1ofdALjC2yT",
 "fields": [
  {
   "id": "fld9iS1ofdALjC2yT",
   "name": "Номер",
   "type": "number",
   "options": {
    "precision": 0
   }
  },
  {
   "id": "fldcMrmBANDdi3wjL",
   "name": "Строковое",
   "type": "richText"
  },
  {
   "id": "fldQlnMrCcjrKoGvN",
   "name": "Вложение",
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   }
  },
  {
   "id": "fldPKXJmkzAFRo41T",
   "name": "Флажок",
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   }
  },
  {
   "id": "fldvgGvcjT2zaVAoa",
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
   "id": "fldxpWaIK8kfA0bdI",
   "name": "Телефон",
   "type": "phoneNumber"
  },
  {
   "id": "fldSIeymPzrNvPv5E",
   "name": "Почта",
   "type": "email"
  },
  {
   "id": "fldFczkpBLZWvsRld",
   "name": "Ссылка",
   "type": "url"
  }
 ],
 "views": [
  {
   "id": "viw1FaP6XyTzHPsAD",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

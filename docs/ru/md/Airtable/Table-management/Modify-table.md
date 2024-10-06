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
 "id": "tblGu8xhI9qXgeNVG",
 "name": "Тестовая таблица 2 (изм.)",
 "description": "Новая таблица (изм.)",
 "primaryFieldId": "fld1ui3lieS7X0zPN",
 "fields": [
  {
   "id": "fld1ui3lieS7X0zPN",
   "name": "Номер",
   "type": "number",
   "options": {
    "precision": 0
   }
  },
  {
   "id": "fldh4eJIApOFsIJwD",
   "name": "Строковое",
   "type": "richText"
  },
  {
   "id": "fldv2wbYeOT34U7UW",
   "name": "Вложение",
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   }
  },
  {
   "id": "fldjlMsxcDuXmv2iE",
   "name": "Флажок",
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   }
  },
  {
   "id": "fldDOGMheTkkKpldG",
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
   "id": "fldfUBfBACvyiJTYP",
   "name": "Телефон",
   "type": "phoneNumber"
  },
  {
   "id": "fldthYb6rET59RPak",
   "name": "Почта",
   "type": "email"
  },
  {
   "id": "fld5y5NmDi2JAF3jR",
   "name": "Ссылка",
   "type": "url"
  }
 ],
 "views": [
  {
   "id": "viwB8lKHsiB4GNtXU",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

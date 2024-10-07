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
 "id": "tblhb2OTfBOVSeDqw",
 "name": "Тестовая таблица 2 (изм.)",
 "description": "Новая таблица (изм.)",
 "primaryFieldId": "fldd9NQlZIA3jn5Gq",
 "fields": [
  {
   "id": "fldd9NQlZIA3jn5Gq",
   "name": "Номер",
   "type": "number",
   "options": {
    "precision": 0
   }
  },
  {
   "id": "fld98fjniJFnx3yMW",
   "name": "Строковое",
   "type": "richText"
  },
  {
   "id": "fldha5SElpuQQD3Gs",
   "name": "Вложение",
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   }
  },
  {
   "id": "fldXR6ddew4rl50wJ",
   "name": "Флажок",
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   }
  },
  {
   "id": "fldpfNO1xDWs0OaZt",
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
   "id": "fld7tLKgx29zLRTIJ",
   "name": "Телефон",
   "type": "phoneNumber"
  },
  {
   "id": "fld2SWCc1zkuOP4hS",
   "name": "Почта",
   "type": "email"
  },
  {
   "id": "fldqjFwMyJDbcOCJ3",
   "name": "Ссылка",
   "type": "url"
  }
 ],
 "views": [
  {
   "id": "viw8a31RK6Euytpmh",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

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
    Токен = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    База  = "app9bSgL4YtTVGTlE";

    МассивПолей = Новый Массив;
    МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеНомера("Номер"));
    МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеСтроковое("Строковое"));
    МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеВложения("Вложение"));
    МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеФлажка("Флажок"));
    МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеДаты("Дата"));
    МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеТелефона("Телефон"));
    МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеПочты("Почта"));
    МассивПолей.Добавить(OPI_Airtable.ПолучитьПолеСсылки("Ссылка"));

    Наименование = "Тестовая таблица 2";
    Описание     = "Новая таблица";

    Результат = OPI_Airtable.СоздатьТаблицу(Токен, База, Наименование, МассивПолей, Описание);
```



```sh title="Пример команды CLI"
    
  oint airtable СоздатьТаблицу --token %token% --base "apptm8Xqo7TwMaipQ" --title %title% --fieldsdata %fieldsdata% --description "Новая таблица"

```

```json title="Результат"
{
 "id": "tblGu8xhI9qXgeNVG",
 "name": "Тестовая таблица 2",
 "description": "Новая таблица",
 "primaryFieldId": "fld1ui3lieS7X0zPN",
 "fields": [
  {
   "type": "number",
   "options": {
    "precision": 0
   },
   "id": "fld1ui3lieS7X0zPN",
   "name": "Номер"
  },
  {
   "type": "richText",
   "id": "fldh4eJIApOFsIJwD",
   "name": "Строковое"
  },
  {
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   },
   "id": "fldv2wbYeOT34U7UW",
   "name": "Вложение"
  },
  {
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   },
   "id": "fldjlMsxcDuXmv2iE",
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
   "id": "fldDOGMheTkkKpldG",
   "name": "Дата"
  },
  {
   "type": "phoneNumber",
   "id": "fldfUBfBACvyiJTYP",
   "name": "Телефон"
  },
  {
   "type": "email",
   "id": "fldthYb6rET59RPak",
   "name": "Почта"
  },
  {
   "type": "url",
   "id": "fld5y5NmDi2JAF3jR",
   "name": "Ссылка"
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

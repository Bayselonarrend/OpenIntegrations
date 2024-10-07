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
 "id": "tblEnITVUkSlgHI65",
 "name": "Тестовая таблица 2",
 "description": "Новая таблица",
 "primaryFieldId": "flds0gJ8oK76wO3Wh",
 "fields": [
  {
   "type": "number",
   "options": {
    "precision": 0
   },
   "id": "flds0gJ8oK76wO3Wh",
   "name": "Номер"
  },
  {
   "type": "richText",
   "id": "fld6Jwim3eYiyvb1T",
   "name": "Строковое"
  },
  {
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   },
   "id": "fld82xkFFOdO82YXz",
   "name": "Вложение"
  },
  {
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   },
   "id": "fldIG87iTcDZMpSUg",
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
   "id": "fld85KB0qAiUcrtm7",
   "name": "Дата"
  },
  {
   "type": "phoneNumber",
   "id": "fld0etGulIBZETKo3",
   "name": "Телефон"
  },
  {
   "type": "email",
   "id": "fldEuMHEaCz1PUoav",
   "name": "Почта"
  },
  {
   "type": "url",
   "id": "fldgRI3hInqlYM7zA",
   "name": "Ссылка"
  }
 ],
 "views": [
  {
   "id": "viwpQS657guaqiL6O",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

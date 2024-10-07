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
 "id": "tbloOBELtY2PnGlFk",
 "name": "Тестовая таблица 2",
 "description": "Новая таблица",
 "primaryFieldId": "fldURQ8ztwQ1E24Ca",
 "fields": [
  {
   "type": "number",
   "options": {
    "precision": 0
   },
   "id": "fldURQ8ztwQ1E24Ca",
   "name": "Номер"
  },
  {
   "type": "richText",
   "id": "fldRPSMMnTiarZIho",
   "name": "Строковое"
  },
  {
   "type": "multipleAttachments",
   "options": {
    "isReversed": false
   },
   "id": "fldFWfqVeSF5D1Z49",
   "name": "Вложение"
  },
  {
   "type": "checkbox",
   "options": {
    "icon": "check",
    "color": "yellowBright"
   },
   "id": "fldaT6KbQuNJltfYZ",
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
   "id": "fldas7tnSlxD8FmYF",
   "name": "Дата"
  },
  {
   "type": "phoneNumber",
   "id": "fldUTqGO5oU4614Er",
   "name": "Телефон"
  },
  {
   "type": "email",
   "id": "fldDLWaf9vvNE5nVK",
   "name": "Почта"
  },
  {
   "type": "url",
   "id": "fldMicP6wE7B7gAfD",
   "name": "Ссылка"
  }
 ],
 "views": [
  {
   "id": "viwbfV7CZP8UmJszP",
   "name": "Grid view",
   "type": "grid"
  }
 ]
}
```

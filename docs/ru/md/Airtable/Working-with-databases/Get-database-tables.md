---
sidebar_position: 2
---

# Получить таблицы базы
 Получает схему таблиц базы



`Функция ПолучитьТаблицыБазы(Знач Токен, Знач База) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

<br/>




```bsl title="Пример кода"
    Токен = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    База  = "app9bSgL4YtTVGTlE";

    Результат = OPI_Airtable.ПолучитьТаблицыБазы(Токен, База);
```



```sh title="Пример команды CLI"
    
  oint airtable ПолучитьТаблицыБазы --token %token% --base "apptm8Xqo7TwMaipQ"

```

```json title="Результат"
{
 "tables": [
  {
   "id": "tbl2fNf2ozKTXV3r3",
   "name": "Тестовая таблица",
   "primaryFieldId": "fldQSx6MzlpLHsxfj",
   "fields": [
    {
     "type": "number",
     "options": {
      "precision": 0
     },
     "id": "fldQSx6MzlpLHsxfj",
     "name": "Номер"
    },
    {
     "type": "richText",
     "id": "fldE9RFvs5tYrWJaQ",
     "name": "Строковое"
    }
   ],
   "views": [
    {
     "id": "viwo7fEgQeu9OM6PY",
     "name": "Grid view",
     "type": "grid"
    }
   ]
  }
 ]
}
```

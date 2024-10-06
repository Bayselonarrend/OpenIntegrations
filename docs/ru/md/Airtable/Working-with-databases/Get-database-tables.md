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
   "id": "tbljzPSJsE4GimVfW",
   "name": "Тестовая таблица",
   "primaryFieldId": "fldzWgGL6Tn5tUBxV",
   "fields": [
    {
     "type": "number",
     "options": {
      "precision": 0
     },
     "id": "fldzWgGL6Tn5tUBxV",
     "name": "Номер"
    },
    {
     "type": "richText",
     "id": "fldvkQV8BWgO1ajVb",
     "name": "Строковое"
    }
   ],
   "views": [
    {
     "id": "viwOQNmvYnMlVwYbo",
     "name": "Grid view",
     "type": "grid"
    }
   ]
  }
 ]
}
```

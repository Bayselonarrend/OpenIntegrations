---
sidebar_position: 2
---

# Получить таблицы базы
 Получает схему таблиц базы


*Функция ПолучитьТаблицыБазы(Знач Токен, Знач База) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

```bsl title="Пример кода"
	

  Ответ = OPI_Airtable.ПолучитьТаблицыБазы(Токен, База); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ); //JSON строка
	
```

```sh title="Пример команд CLI"
    
  oint Airtable ПолучитьТаблицыБазы --token %token% --base %base%

```


```json title="Результат"

{
 "tables": [
  {
   "id": "tblEQ96elYhCbE3Jj",
   "name": "Тестовая таблица",
   "primaryFieldId": "fld2mb9dHV1Jt9lXi",
   "fields": [
    {
     "type": "number",
     "options": {
      "precision": 0
     },
     "id": "fld2mb9dHV1Jt9lXi",
     "name": "Номер"
    },
    {
     "type": "richText",
     "id": "fldICvkOjAYaNQNiG",
     "name": "Строковое"
    }
   ],
   "views": [
    {
     "id": "viwBWVJCK7ndNEYsL",
     "name": "Grid view",
     "type": "grid"
    }
   ]
  }
 ]
}

```

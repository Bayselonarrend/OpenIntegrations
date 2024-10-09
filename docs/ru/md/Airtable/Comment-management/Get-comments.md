---
sidebar_position: 1
---

# Получить комментарии
 Получает список комментариев к записи в таблице



`Функция ПолучитьКомментарии(Знач Токен, Знач База, Знач Таблица, Знач Запись, Знач Отступ = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы данных |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | Запись | --record | Строка | Идентификатор записи в таблице |
  | Отступ | --offset | Строка | Иднтификатор следующей страницы данных из предыдущего запроса |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

<br/>




```bsl title="Пример кода"
    Токен       = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    База        = "app9bSgL4YtTVGTlE";
    Таблица     = "tblDUGAZFZaeOwE6x";
    Запись      = "recydoiybO8id17n5";

    Результат = OPI_Airtable.ПолучитьКомментарии(Токен, База, Таблица, Запись);
```



```sh title="Пример команды CLI"
    
  oint airtable ПолучитьКомментарии --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --offset %offset%

```

```json title="Результат"
{
 "comments": [
  {
   "id": "comtbulEbTtAISgHM",
   "author": {
    "id": "usrFlaAHlTfYWAbVW",
    "email": "bayselonarrend@gmail.com",
    "name": "Антон Титовец"
   },
   "text": "Тестовый комментарий (изм.)",
   "createdTime": "2024-10-08T17:44:50Z",
   "lastUpdatedTime": "2024-10-08T17:44:50Z"
  }
 ],
 "offset": null
}
```

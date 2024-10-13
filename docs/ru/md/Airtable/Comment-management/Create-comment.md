---
sidebar_position: 2
---

# Создать комментарий
 Создает комментарий к записи в таблице



`Функция СоздатьКомментарий(Знач Токен, Знач База, Знач Таблица, Знач Запись, Знач Текст) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы данных |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | Запись | --record | Строка | Идентификатор записи в таблице |
  | Текст | --text | Строка | Текст комментария |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

<br/>




```bsl title="Пример кода"
    Токен   = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    База    = "appESy99HYCLbuWlV";
    Таблица = "tbl5gZLQ8i5xKuVTy";
    Запись  = "recHqUT4ruWn8KnYi";
    Текст   = "Тестовый комментарий";

    Результат = OPI_Airtable.СоздатьКомментарий(Токен, База, Таблица, Запись, Текст);
```



```sh title="Пример команды CLI"
    
  oint airtable СоздатьКомментарий --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --record "recV6DxeLQMBNJrUk" --text "Тестовый комментарий"

```

```json title="Результат"
{
 "id": "comtbulEbTtAISgHM",
 "author": {
  "id": "usrFlaAHlTfYWAbVW",
  "email": "bayselonarrend@gmail.com",
  "name": "Антон Титовец"
 },
 "text": "Тестовый комментарий",
 "createdTime": "2024-10-08T17:44:49.632Z",
 "lastUpdatedTime": null
}
```

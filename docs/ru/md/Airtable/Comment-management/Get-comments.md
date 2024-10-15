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
    База        = "appESy99HYCLbuWlV";
    Таблица     = "tbl5gZLQ8i5xKuVTy";
    Запись      = "recHqUT4ruWn8KnYi";

    Результат = OPI_Airtable.ПолучитьКомментарии(Токен, База, Таблица, Запись);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint airtable ПолучитьКомментарии --token "***" \
              --base "app0r5m50QN7nWAAv" \
              --table "tbl99eHW7uVpn8cdR" \
              --record "rec6pv1dpsrdVxaD4"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint airtable ПолучитьКомментарии ^
              --token "***" ^
              --base "app0r5m50QN7nWAAv" ^
              --table "tbl99eHW7uVpn8cdR" ^
              --record "rec6pv1dpsrdVxaD4"
        ```
    </TabItem>
</Tabs>


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

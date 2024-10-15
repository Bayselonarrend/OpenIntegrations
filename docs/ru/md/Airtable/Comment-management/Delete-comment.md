---
sidebar_position: 4
---

# Удалить комментарий
 Удаляет комментарий к записи таблицы



`Функция УдалитьКомментарий(Знач Токен, Знач База, Знач Таблица, Знач Запись, Знач Комментарий) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы данных |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | Запись | --record | Строка | Идентификатор записи в таблице |
  | Комментарий | --comment | Строка | Идентификатор комментария |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

<br/>




```bsl title="Пример кода"
    Токен       = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    База        = "appmy5B6qi09E4wrF";
    Таблица     = "tblYwj7Cnw6w3FGWh";
    Запись      = "recnOWHAPOyCl0kUj";
    Комментарий = "comNQ9mG1pWpJqgif";

    Результат = OPI_Airtable.УдалитьКомментарий(Токен, База, Таблица, Запись, Комментарий);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint airtable УдалитьКомментарий --token "***" \
              --base "app0r5m50QN7nWAAv" \
              --table "tbl99eHW7uVpn8cdR" \
              --record "rec6pv1dpsrdVxaD4" \
              --comment "comeCfbRggeCTqOZT"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint airtable УдалитьКомментарий ^
              --token "***" ^
              --base "app0r5m50QN7nWAAv" ^
              --table "tbl99eHW7uVpn8cdR" ^
              --record "rec6pv1dpsrdVxaD4" ^
              --comment "comeCfbRggeCTqOZT"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "id": "comtbulEbTtAISgHM",
 "deleted": true
}
```

---
sidebar_position: 2
---

# Получить запись
 Получает данные строки таблицы по идентификатору



`Функция ПолучитьЗапись(Знач Токен, Знач База, Знач Таблица, Знач Запись) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы данных |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | Запись | --record | Строка | Идентификатор записи в таблице |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

<br/>




```bsl title="Пример кода"
    Токен   = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    База    = "appmy5B6qi09E4wrF";
    Таблица = "tblYwj7Cnw6w3FGWh";
    Запись  = "recnOWHAPOyCl0kUj";

    Результат = OPI_Airtable.ПолучитьЗапись(Токен, База, Таблица, Запись);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint airtable ПолучитьЗапись --token "***" \
              --base "app0r5m50QN7nWAAv" \
              --table "tbl99eHW7uVpn8cdR" \
              --record "rec6pv1dpsrdVxaD4"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint airtable ПолучитьЗапись ^
              --token "***" ^
              --base "app0r5m50QN7nWAAv" ^
              --table "tbl99eHW7uVpn8cdR" ^
              --record "rec6pv1dpsrdVxaD4"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "id": "rec9dR46CmDQMkUJ0",
 "createdTime": "2024-10-08T17:44:49Z",
 "fields": {
  "Номер": 10,
  "Строковое": "Привет\n"
 }
}
```

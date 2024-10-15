---
sidebar_position: 2
---

# Изменить поле
 Изменяет имя и|или описание существующего поля таблицы



`Функция ИзменитьПоле(Знач Токен, Знач База, Знач Таблица, Знач Поле, Знач Наименование = "", Знач Описание = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы База |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | Поле | --field | Строка | Идентификатор поля |
  | Наименование | --title | Строка | Новое наименование |
  | Описание | --description | Строка | Новое описание |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

<br/>




```bsl title="Пример кода"
    Токен   = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    База    = "appESy99HYCLbuWlV";
    Таблица = "tbl5gZLQ8i5xKuVTy";
    Поле    = "fldzPMAQ2obgGcvxG";

    Имя       = Строка(Новый УникальныйИдентификатор) + "(изм.)";
    Описание  = "Новое описание";

    Результат = OPI_Airtable.ИзменитьПоле(Токен, База, Таблица, Поле, Имя, Описание);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint airtable ИзменитьПоле --token "***" \
              --base "app0r5m50QN7nWAAv" \
              --table "tbl99eHW7uVpn8cdR" \
              --field "fld1Zk1Ge9yDx5iAq" \
              --title "02e54087-9009-41b8-a1cb-02fd47d372ef(изм.)" \
              --description "Новое описание"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint airtable ИзменитьПоле ^
              --token "***" ^
              --base "app0r5m50QN7nWAAv" ^
              --table "tbl99eHW7uVpn8cdR" ^
              --field "fld1Zk1Ge9yDx5iAq" ^
              --title "02e54087-9009-41b8-a1cb-02fd47d372ef(изм.)" ^
              --description "Новое описание"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "type": "number",
 "options": {
  "precision": 0
 },
 "id": "fldVcZeSTEx69J6u2",
 "name": "12ed7670-e343-4773-87b4-de3ff5855144(изм.)",
 "description": "Новое описание"
}
```

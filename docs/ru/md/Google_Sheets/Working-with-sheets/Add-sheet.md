---
sidebar_position: 1
---

# Добавить лист
 Добавляет новый лист в книгу



`Функция ДобавитьЛист(Знач Токен, Знач Книга, Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | Идентификатор книги |
  | Наименование | --title | Строка | Наименование нового листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Книга        = "1ybexzLz6S_cthsQNdMkNbOlAD3yjFzdArRm_589T_FQ";
    Наименование = "Тестовый лист";

    Результат = OPI_GoogleSheets.ДобавитьЛист(Токен, Книга, Наименование);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint gsheets ДобавитьЛист --token "***" \
              --spreadsheet "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98" \
              --title "Тестовый лист"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gsheets ДобавитьЛист ^
              --token "***" ^
              --spreadsheet "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98" ^
              --title "Тестовый лист"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "spreadsheetId": "1NH03Re5tvG0eZ8H3qgzKAMok6gim33SHvV4cRTHqlac",
 "replies": [
  {
   "addSheet": {
    "properties": {
     "sheetId": 2055557456,
     "title": "Тестовый лист",
     "index": 2,
     "sheetType": "GRID",
     "gridProperties": {
      "rowCount": 1000,
      "columnCount": 26
     }
    }
   }
  }
 ]
}
```

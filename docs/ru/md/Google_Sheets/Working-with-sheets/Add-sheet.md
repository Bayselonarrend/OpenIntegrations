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
    Токен        = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Книга        = "1O3ZKBO8P6IhCsFCYl-QRW_7Kjp2DQWef2234pjZmsBg";
    Наименование = "Тестовый лист";

    Результат = OPI_GoogleSheets.ДобавитьЛист(Токен, Книга, Наименование);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
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

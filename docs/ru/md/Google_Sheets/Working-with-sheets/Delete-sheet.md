---
sidebar_position: 2
---

# Удалить лист
 Удаляет лист из книги



`Функция УдалитьЛист(Знач Токен, Знач Книга, Знач Лист) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | Идентификатор книги |
  | Лист | --sheet | Строка | Идентификатор удаляемого листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Книга  = "1O3ZKBO8P6IhCsFCYl-QRW_7Kjp2DQWef2234pjZmsBg";
    Лист   = "501655435";

    Результат = OPI_GoogleSheets.УдалитьЛист(Токен, Книга, Лист);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gsheets УдалитьЛист --token "***" \
              --spreadsheet "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98" \
              --sheet "616761557"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gsheets УдалитьЛист ^
              --token "***" ^
              --spreadsheet "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98" ^
              --sheet "616761557"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "spreadsheetId": "1NH03Re5tvG0eZ8H3qgzKAMok6gim33SHvV4cRTHqlac",
 "replies": [
  {}
 ]
}
```

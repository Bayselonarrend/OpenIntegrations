---
sidebar_position: 3
---

# Изменить наименование книги
 Изменяет наименование существующей книги



`Функция ИзменитьНаименованиеКниги(Знач Токен, Знач Книга, Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | ID книги |
  | Наименование | --title | Строка | Новое наименование |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Книга        = "1O3ZKBO8P6IhCsFCYl-QRW_7Kjp2DQWef2234pjZmsBg";
    Наименование = "Тестовая таблица (изм.)";

    Результат    = OPI_GoogleSheets.ИзменитьНаименованиеКниги(Токен, Книга, Наименование);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gsheets ИзменитьНаименованиеКниги --token "***" \
              --spreadsheet "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98" \
              --title "Тестовая таблица (изм.)"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gsheets ИзменитьНаименованиеКниги ^
              --token "***" ^
              --spreadsheet "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98" ^
              --title "Тестовая таблица (изм.)"
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

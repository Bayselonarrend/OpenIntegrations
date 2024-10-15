---
sidebar_position: 2
---

# Получить книгу
 Получает информацию о книге по ID



`Функция ПолучитьКнигу(Знач Токен, Знач Идентификатор) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --spreadsheet | Строка | Идентификатор книги |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Идентификатор = "1O3ZKBO8P6IhCsFCYl-QRW_7Kjp2DQWef2234pjZmsBg";

    Результат = OPI_GoogleSheets.ПолучитьКнигу(Токен, Идентификатор);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gsheets ПолучитьКнигу --token "***" \
              --spreadsheet "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gsheets ПолучитьКнигу ^
              --token "***" ^
              --spreadsheet "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98"
        ```
    </TabItem>
</Tabs>


```json title="Результат"

```

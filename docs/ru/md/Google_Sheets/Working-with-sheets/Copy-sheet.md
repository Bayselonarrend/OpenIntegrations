---
sidebar_position: 3
---

# Копировать лист
 Копирует лист из одной книги в другую



`Функция КопироватьЛист(Знач Токен, Знач Откуда, Знач Куда, Знач Лист) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Откуда | --from | Строка | ID книги источника |
  | Куда | --to | Строка | ID книги приемника |
  | Лист | --sheet | Строка | ID копируемого листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Откуда = "1O3ZKBO8P6IhCsFCYl-QRW_7Kjp2DQWef2234pjZmsBg";
    Куда   = "1CMjanhXxVBuxSLj6tAIya9LldwB5crkM-7DJuiutM1k";
    Лист   = "501655435";

    Результат = OPI_GoogleSheets.КопироватьЛист(Токен, Откуда, Куда, Лист);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gsheets КопироватьЛист --token "***" \
              --from "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98" \
              --to "1-KNA3DAeS60iWjWATJCZSpuBLGuOOjFRj65wHWXtzrU" \
              --sheet "616761557"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gsheets КопироватьЛист ^
              --token "***" ^
              --from "1ZUsPnNQMNtLS0RGKFegPvF2jwU4xJp8AhmpgFNTq-98" ^
              --to "1-KNA3DAeS60iWjWATJCZSpuBLGuOOjFRj65wHWXtzrU" ^
              --sheet "616761557"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "sheetId": 2030603781,
 "title": "Лист1 (копия)",
 "index": 2,
 "sheetType": "GRID",
 "gridProperties": {
  "rowCount": 1000,
  "columnCount": 26
 }
}
```

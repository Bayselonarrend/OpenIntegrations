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
    Токен  = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Откуда = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";
    Куда   = "1KrDW917ri-VT9BAnejvb0ysLjEEWyMSQ04bvNJjKM0o";
    Лист   = "326904167";

    Результат = OPI_GoogleSheets.КопироватьЛист(Токен, Откуда, Куда, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets КопироватьЛист --token %token% --from "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --to "1tPDQHmduH9NASRhy0I-a6--ebNNJ5A6wXhhTRcNhD7s" --sheet "25093199"

```

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

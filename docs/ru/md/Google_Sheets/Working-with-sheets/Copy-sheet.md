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
    Токен  = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Откуда = "1IIUxPvgvrPCB92SXFISbKBFLAbmbHUIu_OysyC9w3Ow";
    Куда   = "1p_TOtMYpcf_KGyUs2W44df1vAL-faoQnqW02GiT4qlA";
    Лист   = "1572277025";

    Результат = OPI_GoogleSheets.КопироватьЛист(Токен, Откуда, Куда, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets КопироватьЛист --token %token% --from "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --to "1tPDQHmduH9NASRhy0I-a6--ebNNJ5A6wXhhTRcNhD7s" --sheet "25093199"

```

```json title="Результат"
{
 "sheetId": 1629996592,
 "title": "Лист1 (копия)",
 "index": 2,
 "sheetType": "GRID",
 "gridProperties": {
  "rowCount": 1000,
  "columnCount": 26
 }
}
```

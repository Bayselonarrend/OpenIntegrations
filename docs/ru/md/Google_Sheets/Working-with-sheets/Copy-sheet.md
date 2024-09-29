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
    Токен  = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Откуда = "1pqjld5QO6zoOe8zPMthfFhGcwwaE6FdlDyw-UHgEP5c";
    Куда   = "1-ogKRDNtqYdnfqV32mzKeVWE3lXftgJMkJHwx3kkcSo";
    Лист   = "1771443618";

    Результат = OPI_GoogleSheets.КопироватьЛист(Токен, Откуда, Куда, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets КопироватьЛист --token %token% --from "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --to "1tPDQHmduH9NASRhy0I-a6--ebNNJ5A6wXhhTRcNhD7s" --sheet "25093199"

```

```json title="Результат"
{
 "sheetId": 1753921555,
 "title": "Лист1 (копия)",
 "index": 2,
 "sheetType": "GRID",
 "gridProperties": {
  "rowCount": 1000,
  "columnCount": 26
 }
}
```

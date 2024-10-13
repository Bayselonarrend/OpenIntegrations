---
sidebar_position: 2
---

# Очистить ячейки
 Очищает значение в ячейках



`Функция ОчиститьЯчейки(Знач Токен, Знач Книга, Знач МассивЯчеек, Знач Лист = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | ID книги |
  | МассивЯчеек | --cells | Массив из Строка | Массив ячеек вида А1 для очистки |
  | Лист | --sheetname | Строка | Имя листа (первый лист по умолчанию) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Книга  = "1ybexzLz6S_cthsQNdMkNbOlAD3yjFzdArRm_589T_FQ";
    Лист   = "Лист2";

    МассивЯчеек = Новый Массив;
    МассивЯчеек.Добавить("B2");
    МассивЯчеек.Добавить("A3");
    МассивЯчеек.Добавить("B4");

    Результат = OPI_GoogleSheets.ОчиститьЯчейки(Токен, Книга, МассивЯчеек, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets ОчиститьЯчейки --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --cells %cells% --sheetname "Лист2"

```

```json title="Результат"
{
 "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
 "clearedRanges": [
  "'Лист2'!B2",
  "'Лист2'!A3",
  "'Лист2'!B4"
 ]
}
```

---
sidebar_position: 3
---

# Получить значения ячеек
 Получает значения ячеек таблицы



`Функция ПолучитьЗначенияЯчеек(Знач Токен, Знач Книга, Знач МассивЯчеек = "", Знач Лист = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | ID книги |
  | МассивЯчеек | --cells | Массив из Строка | Массив ячеек вида А1 для получения (весь лист, если не заполнено) |
  | Лист | --sheetname | Строка | Имя листа (первый лист по умолчанию) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Книга  = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";
    Лист   = "Лист2";

    МассивЯчеек = Новый Массив;
    МассивЯчеек.Добавить("B2");
    МассивЯчеек.Добавить("A3");
    МассивЯчеек.Добавить("B4");

    Результат = OPI_GoogleSheets.ПолучитьЗначенияЯчеек(Токен, Книга, МассивЯчеек, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets ПолучитьЗначенияЯчеек --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --cells %cells% --sheetname "Лист2"

```

```json title="Результат"
{
 "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
 "valueRanges": [
  {
   "range": "'Лист2'!B2",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это B2"
    ]
   ]
  },
  {
   "range": "'Лист2'!A3",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это A3"
    ]
   ]
  },
  {
   "range": "'Лист2'!B4",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это B4"
    ]
   ]
  }
 ]
}
```

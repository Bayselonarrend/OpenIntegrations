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
    Токен         = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Идентификатор = "187aOtcDnHwx1wmHhU-QuGHMWyqZptBif9IVa_tBanNk";

    Результат = OPI_GoogleSheets.ПолучитьКнигу(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gsheets ПолучитьКнигу --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc"

```

```json title="Результат"

```

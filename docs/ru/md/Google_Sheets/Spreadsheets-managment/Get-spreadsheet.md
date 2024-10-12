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
    Токен         = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Идентификатор = "1byey4pYpbD_Bmh0c49QYSEfwkqTUwcTIqhMtrDyq7vQ";

    Результат = OPI_GoogleSheets.ПолучитьКнигу(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gsheets ПолучитьКнигу --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc"

```

```json title="Результат"

```

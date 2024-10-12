---
sidebar_position: 2
---

# Удалить лист
 Удаляет лист из книги



`Функция УдалитьЛист(Знач Токен, Знач Книга, Знач Лист) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | Идентификатор книги |
  | Лист | --sheet | Строка | Идентификатор удаляемого листа |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Книга  = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";
    Лист   = "326904167";

    Результат = OPI_GoogleSheets.УдалитьЛист(Токен, Книга, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets УдалитьЛист --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --sheet "1790807910"

```

```json title="Результат"
{
 "spreadsheetId": "1NH03Re5tvG0eZ8H3qgzKAMok6gim33SHvV4cRTHqlac",
 "replies": [
  {}
 ]
}
```

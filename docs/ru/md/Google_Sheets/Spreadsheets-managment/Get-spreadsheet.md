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
    Токен         = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Идентификатор = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";

    Результат = OPI_GoogleSheets.ПолучитьКнигу(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gsheets ПолучитьКнигу --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc"

```

```json title="Результат"

```

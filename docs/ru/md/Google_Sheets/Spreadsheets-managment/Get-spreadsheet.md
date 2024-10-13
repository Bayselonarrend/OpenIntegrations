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
    Токен         = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Идентификатор = "1ybexzLz6S_cthsQNdMkNbOlAD3yjFzdArRm_589T_FQ";

    Результат = OPI_GoogleSheets.ПолучитьКнигу(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gsheets ПолучитьКнигу --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc"

```

```json title="Результат"

```

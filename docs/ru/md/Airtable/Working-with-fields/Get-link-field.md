﻿---
sidebar_position: 10
---

# Получить поле (url)
 Получает описание поля с URL



`Функция ПолучитьПолеСсылки(Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Наименование | --title | Строка | Наименование поля |

  
  Возвращаемое значение:   Структура -  Описание поля

<br/>




```bsl title="Пример кода"
    Результат = OPI_Airtable.ПолучитьПолеСсылки("Ссылка");
```



```sh title="Пример команды CLI"
    
  oint airtable ПолучитьПолеСсылки --title "Ссылка"

```

```json title="Результат"
{
 "name": "Ссылка",
 "type": "url"
}
```

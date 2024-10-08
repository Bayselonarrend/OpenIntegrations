﻿---
sidebar_position: 9
---

# Переместить объект
 Перемещает объект по выбранному пути



`Функция ПереместитьОбъект(Знач Токен, Знач Откуда, Знач Куда) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Откуда | --form | Строка | Путь к объекту оригинала |
  | Куда | --to | Строка | Целевой путь для нового объекта |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    ОригиналныйПуть  = "/New/pic.png";
    ЦелевойПуть      = "/pic.png";
    Токен            = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";

    Результат = OPI_Dropbox.ПереместитьОбъект(Токен, ОригиналныйПуть, ЦелевойПуть);
```



```sh title="Пример команды CLI"
    
  oint dropbox ПереместитьОбъект --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --form %form% --to %to%

```

```json title="Результат"
{
 "metadata": {
  ".tag": "file",
  "name": "pic.png",
  "path_lower": "/pic.png",
  "path_display": "/pic.png",
  "id": "id:kJU6-a-pT48AAAAAAAAcWQ",
  "client_modified": "2024-10-08T17:44:58Z",
  "server_modified": "2024-10-08T17:45:37Z",
  "rev": "623fab47c7ce8bd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```

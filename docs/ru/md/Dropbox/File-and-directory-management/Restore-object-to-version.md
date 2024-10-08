﻿---
sidebar_position: 14
---

# Восстановить объект к версии
 Восстанавливает состояние объекта к необходимой версии (ревизии)



`Функция ВосстановитьОбъектКВерсии(Знач Токен, Знач Путь, Знач Версия) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |
  | Версия | --rev | Строка | ID версии (ревизии) для востановления |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Версия    = "6231884a427a3bd841553";
    Токен     = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Путь      = "/New/pic.png";

    Результат = OPI_Dropbox.ВосстановитьОбъектКВерсии(Токен, Путь, Версия);
```



```sh title="Пример команды CLI"
    
  oint dropbox ВосстановитьОбъектКВерсии --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --rev "61a0b76320a6fbd841553"

```

```json title="Результат"
{
 "name": "pic.png",
 "path_lower": "/new/pic.png",
 "path_display": "/New/pic.png",
 "id": "id:kJU6-a-pT48AAAAAAAAcWQ",
 "client_modified": "2024-10-08T17:44:58Z",
 "server_modified": "2024-10-08T17:44:59Z",
 "rev": "623fab23a7559bd841553",
 "size": 2114023,
 "is_downloadable": true,
 "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
}
```

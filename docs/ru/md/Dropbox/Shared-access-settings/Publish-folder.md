﻿---
sidebar_position: 1
---

# Опубликовать папку
 Переводит каталог в режим публичного доступа



`Функция ОпубликоватьПапку(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к целевому каталогу |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен     = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Путь      = "/New";

    Результат = OPI_Dropbox.ОпубликоватьПапку(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint dropbox ОпубликоватьПапку --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path%

```

```json title="Результат"
{
 ".tag": "complete",
 "access_type": {
  ".tag": "owner"
 },
 "is_inside_team_folder": false,
 "is_team_folder": false,
 "path_display": "/New",
 "path_lower": "/new",
 "name": "New",
 "policy": {
  "acl_update_policy": {
   ".tag": "editors"
  },
  "shared_link_policy": {
   ".tag": "anyone"
  },
  "viewer_info_policy": {
   ".tag": "enabled"
  }
 },
 "preview_url": "https://www.dropbox.com/scl/fo/5smnsl41asw9myx8vr3c3/h?dl=0",
 "shared_folder_id": "11680513169",
 "time_invited": "2024-10-08T17:47:13Z",
 "access_inheritance": {
  ".tag": "inherit"
 },
 "folder_id": "id:kJU6-a-pT48AAAAAAAAcVw"
}
```

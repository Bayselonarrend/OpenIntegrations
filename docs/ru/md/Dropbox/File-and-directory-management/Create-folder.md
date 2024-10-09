﻿---
sidebar_position: 10
---

# Создать папку
 Создает пустой каталог по выбранному пути



`Функция СоздатьПапку(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Целевой путь создания каталога |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен     = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Путь      = "/Новый каталог";

    Результат = OPI_Dropbox.СоздатьПапку(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint dropbox СоздатьПапку --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path%

```

```json title="Результат"
{
 "metadata": {
  "name": "Новый каталог",
  "path_lower": "/новый каталог",
  "path_display": "/Новый каталог",
  "id": "id:kJU6-a-pT48AAAAAAAAcXQ"
 }
}
```

---
sidebar_position: 2
---

# Создать папку
 Создает каталог на диске



`Функция СоздатьПапку(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к созаваемой папке |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь  = "/" + Строка(Новый УникальныйИдентификатор);

    Результат = OPI_YandexDisk.СоздатьПапку(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk СоздатьПапку --token "y0_AgAAAABdylaOAA..." --path "/Тестовая папка"

```

```json title="Результат"
{
 "_embedded": {
  "sort": "",
  "items": [],
  "limit": 20,
  "offset": 0,
  "path": "disk:/45e71524-1ddd-42e1-9e82-d24e2d22a220",
  "total": 0
 },
 "name": "45e71524-1ddd-42e1-9e82-d24e2d22a220",
 "exif": {},
 "resource_id": "1573541518:8688269dd3b8b9b6fb4ea14d6291b0af3d3674ec9898c1e4c906523bed448ab1",
 "created": "2024-09-29T15:14:00+03:00",
 "modified": "2024-09-29T15:14:00+03:00",
 "path": "disk:/45e71524-1ddd-42e1-9e82-d24e2d22a220",
 "comment_ids": {
  "private_resource": "1573541518:8688269dd3b8b9b6fb4ea14d6291b0af3d3674ec9898c1e4c906523bed448ab1",
  "public_resource": "1573541518:8688269dd3b8b9b6fb4ea14d6291b0af3d3674ec9898c1e4c906523bed448ab1"
 },
 "type": "dir",
 "revision": 1727612040930762
}
```

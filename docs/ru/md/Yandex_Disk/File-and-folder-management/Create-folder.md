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
  "path": "disk:/7b2ea9b7-abfa-4a16-a075-4a61398e442b",
  "total": 0
 },
 "name": "7b2ea9b7-abfa-4a16-a075-4a61398e442b",
 "exif": {},
 "resource_id": "1573541518:e1b2728525bb9daefca5339f86d93ff3614d8c4f3268c7702c692ef54d58ce35",
 "created": "2024-10-06T17:20:58+03:00",
 "modified": "2024-10-06T17:20:58+03:00",
 "path": "disk:/7b2ea9b7-abfa-4a16-a075-4a61398e442b",
 "comment_ids": {
  "private_resource": "1573541518:e1b2728525bb9daefca5339f86d93ff3614d8c4f3268c7702c692ef54d58ce35",
  "public_resource": "1573541518:e1b2728525bb9daefca5339f86d93ff3614d8c4f3268c7702c692ef54d58ce35"
 },
 "type": "dir",
 "revision": 1728224458939559
}
```

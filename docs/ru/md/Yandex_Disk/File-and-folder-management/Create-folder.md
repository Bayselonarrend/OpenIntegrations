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
  "path": "disk:/964bfef1-2d42-4af2-9efd-643bf7e07dd1",
  "total": 0
 },
 "name": "964bfef1-2d42-4af2-9efd-643bf7e07dd1",
 "exif": {},
 "resource_id": "1573541518:958f1da8c127d6b5aa8d5f9936cc1f6aabc6146355804c4cc18f0241e4aaa8e0",
 "created": "2024-10-07T09:14:03+03:00",
 "modified": "2024-10-07T09:14:03+03:00",
 "path": "disk:/964bfef1-2d42-4af2-9efd-643bf7e07dd1",
 "comment_ids": {
  "private_resource": "1573541518:958f1da8c127d6b5aa8d5f9936cc1f6aabc6146355804c4cc18f0241e4aaa8e0",
  "public_resource": "1573541518:958f1da8c127d6b5aa8d5f9936cc1f6aabc6146355804c4cc18f0241e4aaa8e0"
 },
 "type": "dir",
 "revision": 1728281643791163
}
```

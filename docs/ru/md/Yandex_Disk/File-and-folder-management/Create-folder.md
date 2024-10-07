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
  "path": "disk:/bcd25044-843e-40de-a6f1-9d69a5907fac",
  "total": 0
 },
 "name": "bcd25044-843e-40de-a6f1-9d69a5907fac",
 "exif": {},
 "resource_id": "1573541518:87d823002797118d7fa38e611c8431608dfaa3e617bb4ebb109ff139ee87637f",
 "created": "2024-10-07T15:53:43+03:00",
 "modified": "2024-10-07T15:53:43+03:00",
 "path": "disk:/bcd25044-843e-40de-a6f1-9d69a5907fac",
 "comment_ids": {
  "private_resource": "1573541518:87d823002797118d7fa38e611c8431608dfaa3e617bb4ebb109ff139ee87637f",
  "public_resource": "1573541518:87d823002797118d7fa38e611c8431608dfaa3e617bb4ebb109ff139ee87637f"
 },
 "type": "dir",
 "revision": 1728305623679271
}
```

---
sidebar_position: 4
---

# Получить публичный объект
 Получает информацию об опубликованном объекте по его URL



`Функция ПолучитьПубличныйОбъект(Знач Токен, Знач URL, Знач Количество = 0, Знач СмещениеОтНачала = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URL | --url | Строка | Адрес объекта |
  | Количество | --amount | Число | Количество возвращаемых вложенных объектов (для каталога) |
  | СмещениеОтНачала | --offset | Число | Смещение для получение вложенных объектов не из начала списка |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен  = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL    = "https://yadi.sk/d/pbI5RwM66dK-nA";

    Результат   = OPI_YandexDisk.ПолучитьПубличныйОбъект(Токен, URL);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьПубличныйОбъект --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --amount %amount% --offset %offset%

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "public_key": "fLfKnKmtqPt6TSTumjWC+GMkuduPJAnpx5lwlWVVqp8zeDXp5X74XLJ2GbNOAgYIq/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/yOLqz8yUAZeE0g",
 "views_count": 0,
 "exif": {},
 "created": "2024-10-08T20:39:25+03:00",
 "type": "file",
 "resource_id": "1573541518:37b19cb1e46f814bb80288ca074d36440e9a4aace2331d9d71390839d4ad7c4e",
 "modified": "2024-10-08T20:39:25+03:00",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:37b19cb1e46f814bb80288ca074d36440e9a4aace2331d9d71390839d4ad7c4e",
  "public_resource": "1573541518:37b19cb1e46f814bb80288ca074d36440e9a4aace2331d9d71390839d4ad7c4e"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/c4253bc7630c64e30f5623d8e60b4b819746fcba2015fb6af9d08c88edcf5ccd/6705a6a2/gwThwhLBKYvLhQCNnqAHirWAoEC4dKsPFFzSTeWuFK5ceIUkIDC7fKzI6e0Ic1rFWZAX7ZAMHvmKl9PvgqcSEQ%3D%3D?uid=0&filename=95934d00-67ef-43eb-a306-73a490a0aac0.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=0&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "/",
 "owner": {
  "login": "bayselonarrend",
  "display_name": "bayselonarrend",
  "uid": "1573541518"
 },
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "revision": 1728409184987250,
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "name": "95934d00-67ef-43eb-a306-73a490a0aac0.png"
}
```

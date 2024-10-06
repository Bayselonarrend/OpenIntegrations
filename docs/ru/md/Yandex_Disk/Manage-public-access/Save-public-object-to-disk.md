---
sidebar_position: 6
---

# Сохранить публичный объект на диск
 Сохраняет публичный объект на ваш диск



`Функция СохранитьПубличныйОбъектНаДиск(Знач Токен, Знач URL, Откуда = "", Куда = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URL | --url | Строка | Адрес объекта |
  | Откуда | --from | Строка | Путь внутри публичного каталога (только для папок) |
  | Куда | --to | Строка | Путь сохранения файла |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен  = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL    = "https://yadi.sk/d/3kAeHCjAHV_7sg";

    Результат   = OPI_YandexDisk.СохранитьПубличныйОбъектНаДиск(Токен, URL);
```



```sh title="Пример команды CLI"
    
  oint yadisk СохранитьПубличныйОбъектНаДиск --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --from %from% --to %to%

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:aae1c70bccdee3e0812e7147e6f49da3892947708e0bcbce9743c83127e314f4",
  "public_resource": "1573541518:aae1c70bccdee3e0812e7147e6f49da3892947708e0bcbce9743c83127e314f4"
 },
 "name": "34055c70-602e-4b99-aed5-c21da31de28a.png",
 "exif": {},
 "created": "2024-10-06T17:24:16+03:00",
 "resource_id": "1573541518:aae1c70bccdee3e0812e7147e6f49da3892947708e0bcbce9743c83127e314f4",
 "modified": "2024-10-06T17:24:16+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/5e53e4a6b5ac60c6dcc34b46043fb2561ca1ac13255c344ea84e13bf6cdbe964/6702d5d2/gwThwhLBKYvLhQCNnqAHihVVz7ErQebVldoswZNJ8EZu6ft-neADkw8Jwv-02j2HwzPltvEmOSYv32VMUJrffg%3D%3D?uid=1573541518&filename=34055c70-602e-4b99-aed5-c21da31de28a.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/34055c70-602e-4b99-aed5-c21da31de28a.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728224656976251
}
```

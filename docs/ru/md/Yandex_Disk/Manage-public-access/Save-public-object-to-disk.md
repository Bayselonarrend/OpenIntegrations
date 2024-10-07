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
  "private_resource": "1573541518:b622580500c518bb1f7335b265df766f4322634e21359e23bb5644cdc109fa0c",
  "public_resource": "1573541518:b622580500c518bb1f7335b265df766f4322634e21359e23bb5644cdc109fa0c"
 },
 "name": "828ddf48-c40b-4642-b39b-3892c7e6609b.png",
 "exif": {},
 "created": "2024-10-07T09:17:22+03:00",
 "resource_id": "1573541518:b622580500c518bb1f7335b265df766f4322634e21359e23bb5644cdc109fa0c",
 "modified": "2024-10-07T09:17:21+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/377943bb4385c5efcca460ff29ac48f0a7264a5d5ed8c844b3bfd3f7d65da0b5/6703b532/gwThwhLBKYvLhQCNnqAHim3BuGQ8RObPrs3AaDo7vReBAh7IXV2qdMeuU1Ft0Xe29kKVdyJGyiwpYTXJSyMSBw%3D%3D?uid=1573541518&filename=828ddf48-c40b-4642-b39b-3892c7e6609b.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/828ddf48-c40b-4642-b39b-3892c7e6609b.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728281842142993
}
```

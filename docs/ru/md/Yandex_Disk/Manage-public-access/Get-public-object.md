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
    URL    = "https://yadi.sk/d/3kAeHCjAHV_7sg";

    Результат   = OPI_YandexDisk.ПолучитьПубличныйОбъект(Токен, URL);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьПубличныйОбъект --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --amount %amount% --offset %offset%

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "public_key": "BIODtMp7NsiCN0rEdJUYS+T9v2zV8UrEk9b56/qY67T2Lz+6R4ZZFbwC49gmP67qq/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/SxNfqCwjC2ENyg",
 "views_count": 0,
 "exif": {},
 "created": "2024-10-07T15:56:29+03:00",
 "type": "file",
 "resource_id": "1573541518:086f972edd3c4332ebb6cd629cf131952f6a3980638257586b39b35292d5d0ab",
 "modified": "2024-10-07T15:56:29+03:00",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:086f972edd3c4332ebb6cd629cf131952f6a3980638257586b39b35292d5d0ab",
  "public_resource": "1573541518:086f972edd3c4332ebb6cd629cf131952f6a3980638257586b39b35292d5d0ab"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/00ad7c04c26224c317b19660e08c7565412b11f39eef9b518c38aa427c6c7170/670412d1/gwThwhLBKYvLhQCNnqAHis2EWtCdXZRJSLA1zSgtBU9Djrgh-V0mdnGiQnh0H9VCEFrtexEQitKlZKYlrsi-6g%3D%3D?uid=0&filename=11c6368e-227f-4b35-bfef-813c4c40e956.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=0&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "/",
 "owner": {
  "login": "bayselonarrend",
  "display_name": "bayselonarrend",
  "uid": "1573541518"
 },
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "revision": 1728305808954156,
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "name": "11c6368e-227f-4b35-bfef-813c4c40e956.png"
}
```

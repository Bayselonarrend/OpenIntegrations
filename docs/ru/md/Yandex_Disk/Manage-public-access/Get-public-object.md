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
 "public_key": "jCcNsaKiHZ0F7U83UuZCRx3AV3F3P0VK3ULQ8seniieoRnGzPssDMZSpVJvesWa4q/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/cTm4ZcAk5mSn9Q",
 "views_count": 0,
 "exif": {},
 "created": "2024-10-07T09:16:59+03:00",
 "type": "file",
 "resource_id": "1573541518:1287e23f1ec52f3515c3c5719443d6f33767a8012fb099f6660709d6aa3df0cb",
 "modified": "2024-10-07T09:16:59+03:00",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:1287e23f1ec52f3515c3c5719443d6f33767a8012fb099f6660709d6aa3df0cb",
  "public_resource": "1573541518:1287e23f1ec52f3515c3c5719443d6f33767a8012fb099f6660709d6aa3df0cb"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/531c2a4fa73f2d77bdfee4860c318061a2e10ae0189817f8f5a2a9a04acb0e9d/6703b531/gwThwhLBKYvLhQCNnqAHim3BuGQ8RObPrs3AaDo7vReBAh7IXV2qdMeuU1Ft0Xe29kKVdyJGyiwpYTXJSyMSBw%3D%3D?uid=0&filename=828ddf48-c40b-4642-b39b-3892c7e6609b.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=0&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "/",
 "owner": {
  "login": "bayselonarrend",
  "display_name": "bayselonarrend",
  "uid": "1573541518"
 },
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "revision": 1728281840270577,
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "name": "828ddf48-c40b-4642-b39b-3892c7e6609b.png"
}
```

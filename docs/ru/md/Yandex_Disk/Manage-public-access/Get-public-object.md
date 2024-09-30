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
 "public_key": "9Pm0+OsRhA3wtsvbnPm64NYm5bUWdauzGm3OAjnau5FDZJr8gRF88b9FyMGwR2yQq/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/oV0bJc2J-h8FkA",
 "views_count": 0,
 "exif": {},
 "created": "2024-09-30T09:44:53+03:00",
 "type": "file",
 "resource_id": "1573541518:cb9fa58a6647b5015d366457267da4cdddd50f49dd6bdcc8564c4047eed2bc53",
 "modified": "2024-09-30T09:44:53+03:00",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:cb9fa58a6647b5015d366457267da4cdddd50f49dd6bdcc8564c4047eed2bc53",
  "public_resource": "1573541518:cb9fa58a6647b5015d366457267da4cdddd50f49dd6bdcc8564c4047eed2bc53"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/a4000f224a8141544db111597ea7adf98f084708c7ff70fb85ec4c5615f44545/66fa813a/gwThwhLBKYvLhQCNnqAHirWoU-SMxin8a4qdJD8xoaMIwA6bDN1fQuhR6jiVweW4rEAMi8JTgtkkvNgO2h04pg%3D%3D?uid=0&filename=94b703a8-83cf-4641-a5fe-4f3c042e814c.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=0&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "/",
 "owner": {
  "login": "bayselonarrend",
  "display_name": "bayselonarrend",
  "uid": "1573541518"
 },
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "revision": 1727678713770295,
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "name": "94b703a8-83cf-4641-a5fe-4f3c042e814c.png"
}
```

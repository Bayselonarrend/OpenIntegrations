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
  "private_resource": "1573541518:b50ec35d32fdb7f057212cab4e34f9747a3aec14d6a4538a138c98d355c9c28d",
  "public_resource": "1573541518:b50ec35d32fdb7f057212cab4e34f9747a3aec14d6a4538a138c98d355c9c28d"
 },
 "name": "94b703a8-83cf-4641-a5fe-4f3c042e814c.png",
 "exif": {},
 "created": "2024-09-30T09:45:15+03:00",
 "resource_id": "1573541518:b50ec35d32fdb7f057212cab4e34f9747a3aec14d6a4538a138c98d355c9c28d",
 "modified": "2024-09-30T09:45:15+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/63894dc8e36321d03c224edc092b7b4b0de6fb039b95a9886747e5a4a6e925ba/66fa813c/gwThwhLBKYvLhQCNnqAHirWoU-SMxin8a4qdJD8xoaMIwA6bDN1fQuhR6jiVweW4rEAMi8JTgtkkvNgO2h04pg%3D%3D?uid=1573541518&filename=94b703a8-83cf-4641-a5fe-4f3c042e814c.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/94b703a8-83cf-4641-a5fe-4f3c042e814c.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1727678715833419
}
```

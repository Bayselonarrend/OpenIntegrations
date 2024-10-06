---
sidebar_position: 3
---

# Получить объект
 Получает информацию об объекте диска по заданному пути



`Функция ПолучитьОбъект(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к папке или файлу |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь  = "/90663562-d505-474e-a778-e25c2cf50b4b.png";

    Результат = OPI_YandexDisk.ПолучитьОбъект(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьОбъект --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:bddbdf97754320bb0d11aeed50fdceec144cfb29358319a17d4a8640727c3119",
  "public_resource": "1573541518:bddbdf97754320bb0d11aeed50fdceec144cfb29358319a17d4a8640727c3119"
 },
 "name": "6d7ad129-8c75-4360-adf3-461a4c71c4ae.png",
 "exif": {},
 "created": "2024-10-06T17:21:10+03:00",
 "resource_id": "1573541518:bddbdf97754320bb0d11aeed50fdceec144cfb29358319a17d4a8640727c3119",
 "modified": "2024-10-06T17:21:10+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/78fe39ceb79b0cc77399df2ff53a7cd0f5e9f53dbd9bc8bf9778c66b325696e8/6702d519/gwThwhLBKYvLhQCNnqAHiheNGzC_GrcINLjKfGL-iFxSZC-V0pT00qrr-5minWJzRluxb4Cd2iSgOIgtMkAXZA%3D%3D?uid=1573541518&filename=6d7ad129-8c75-4360-adf3-461a4c71c4ae.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/6d7ad129-8c75-4360-adf3-461a4c71c4ae.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728224470938838
}
```

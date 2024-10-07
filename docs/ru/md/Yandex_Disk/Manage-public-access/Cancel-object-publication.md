---
sidebar_position: 2
---

# Отменить публикацию объекта
 Отменяет публикацию ранее опубликованного объекта



`Функция ОтменитьПубликациюОбъекта(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к опубликованному ранее объекту |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен  = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь   = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";

    Результат = OPI_YandexDisk.ОтменитьПубликациюОбъекта(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk ОтменитьПубликациюОбъекта --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:1287e23f1ec52f3515c3c5719443d6f33767a8012fb099f6660709d6aa3df0cb",
  "public_resource": "1573541518:1287e23f1ec52f3515c3c5719443d6f33767a8012fb099f6660709d6aa3df0cb"
 },
 "name": "828ddf48-c40b-4642-b39b-3892c7e6609b.png",
 "exif": {},
 "created": "2024-10-07T09:16:59+03:00",
 "resource_id": "1573541518:1287e23f1ec52f3515c3c5719443d6f33767a8012fb099f6660709d6aa3df0cb",
 "modified": "2024-10-07T09:16:59+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/a7fd645326bcae9c3555a293dbc30f739e62f106359ad681aba709267832290d/6703b533/gwThwhLBKYvLhQCNnqAHim3BuGQ8RObPrs3AaDo7vReBAh7IXV2qdMeuU1Ft0Xe29kKVdyJGyiwpYTXJSyMSBw%3D%3D?uid=1573541518&filename=828ddf48-c40b-4642-b39b-3892c7e6609b.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/828ddf48-c40b-4642-b39b-3892c7e6609b.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728281843393539
}
```

---
sidebar_position: 1
---

# Опубликовать объект
 Публикует объект диска в публичный доступ



`Функция ОпубликоватьОбъект(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к публикуемому объекту |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен  = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь   = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";

    Результат = OPI_YandexDisk.ОпубликоватьОбъект(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk ОпубликоватьОбъект --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "public_key": "05KGTvef64w7ISzzce5gt8dJfpZ2eAE5x2qw+nd39+X1AvLhYGD9i9B7SG67iqsXq/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/C6knnNm8j77t-A",
 "name": "222a2fc4-39f9-457a-94a4-c69278c48e25.png",
 "exif": {},
 "created": "2024-10-07T21:36:51+03:00",
 "size": 2114023,
 "resource_id": "1573541518:4cc8d261cd582759a6adc615c7e6e583d4a618de4b08b732a4c855d720d58571",
 "modified": "2024-10-07T21:36:51+03:00",
 "comment_ids": {
  "private_resource": "1573541518:4cc8d261cd582759a6adc615c7e6e583d4a618de4b08b732a4c855d720d58571",
  "public_resource": "1573541518:4cc8d261cd582759a6adc615c7e6e583d4a618de4b08b732a4c855d720d58571"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/0fa74b47254f3686157fdc4b40cc0dfbf2a9c0965f95a4d41c9f8b11e80acda4/67046299/gwThwhLBKYvLhQCNnqAHitjtYP_sMEGdXpAYnCH3CeOI2TmJ3n1LCawN581CYeuif0mayq9-vnAgzEVZSHXCMA%3D%3D?uid=1573541518&filename=222a2fc4-39f9-457a-94a4-c69278c48e25.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/222a2fc4-39f9-457a-94a4-c69278c48e25.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728326232207978
}
```

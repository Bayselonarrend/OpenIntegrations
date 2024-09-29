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
    Путь   = "/f668c8b9-d6d8-4da5-b6f5-c6b0916b2185.png";

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
  "private_resource": "1573541518:1913b8c1eddfdb9444793c6276d0c4d315a7f587f9f473d5fc378535d30a3b79",
  "public_resource": "1573541518:1913b8c1eddfdb9444793c6276d0c4d315a7f587f9f473d5fc378535d30a3b79"
 },
 "name": "0e9270bc-6c4a-4a9e-807b-14b9824a2caa.png",
 "exif": {},
 "created": "2024-09-29T15:16:56+03:00",
 "resource_id": "1573541518:1913b8c1eddfdb9444793c6276d0c4d315a7f587f9f473d5fc378535d30a3b79",
 "modified": "2024-09-29T15:16:56+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/7c75da4954e12a5259b30391790f27bf6c79e104b6b23d579715cc1b061d3ace/66f97d90/gwThwhLBKYvLhQCNnqAHivTyW17WRM8SPPMQOvH6-qbQz8d8VWOGlkwZCgoP8dJ0gy2XfMgP1GVEF7gL_kPWBA%3D%3D?uid=1573541518&filename=0e9270bc-6c4a-4a9e-807b-14b9824a2caa.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/0e9270bc-6c4a-4a9e-807b-14b9824a2caa.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1727612239661270
}
```

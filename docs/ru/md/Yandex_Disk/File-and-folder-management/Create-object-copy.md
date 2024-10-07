---
sidebar_position: 5
---

# Создать копию объекта
 Создает копию объекта по заданному пути и пути к оригиналу



`Функция СоздатьКопиюОбъекта(Знач Токен, Знач Оригинал, Знач Путь, Знач Перезаписывать = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Оригинал | --from | Строка | Путь к оригинальному файлу или каталогу |
  | Путь | --to | Строка | Путь назначения для копии |
  | Перезаписывать | --rewrite | Булево | Перезаписывать если файл с таким именем уже существует |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен     = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Оригинал  = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";
    Путь      = "/" + Строка(Новый УникальныйИдентификатор) + ".png";

    Результат = OPI_YandexDisk.СоздатьКопиюОбъекта(Токен, Оригинал, Путь, Истина);
```



```sh title="Пример команды CLI"
    
  oint yadisk СоздатьКопиюОбъекта --token "y0_AgAAAABdylaOAA..." --from "/Альпака.png" --to "/Альпака (копия).png" --rewrite %rewrite%

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:76fad1f3204fbf4c7279967b33bffd34f03cae80739ec7e77f0db9e5eca1aa6d",
  "public_resource": "1573541518:76fad1f3204fbf4c7279967b33bffd34f03cae80739ec7e77f0db9e5eca1aa6d"
 },
 "name": "d033674a-599c-4639-9f5d-be36a8c81d28.png",
 "exif": {},
 "created": "2024-10-07T09:15:16+03:00",
 "resource_id": "1573541518:76fad1f3204fbf4c7279967b33bffd34f03cae80739ec7e77f0db9e5eca1aa6d",
 "modified": "2024-10-07T09:15:16+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/4965fd5289f2b60c19c253bf378a7ce330ce7c0a3226ba35fd2b7bc3bff20e17/6703b4b4/gwThwhLBKYvLhQCNnqAHim3BuGQ8RObPrs3AaDo7vReBAh7IXV2qdMeuU1Ft0Xe29kKVdyJGyiwpYTXJSyMSBw%3D%3D?uid=1573541518&filename=d033674a-599c-4639-9f5d-be36a8c81d28.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/d033674a-599c-4639-9f5d-be36a8c81d28.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728281716302599
}
```

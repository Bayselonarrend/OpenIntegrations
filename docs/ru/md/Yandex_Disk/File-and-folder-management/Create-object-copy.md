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
  "private_resource": "1573541518:c70b1db434fcef3dd54814b275c380b90304de08af82bc7d4f9930a8201718d0",
  "public_resource": "1573541518:c70b1db434fcef3dd54814b275c380b90304de08af82bc7d4f9930a8201718d0"
 },
 "name": "9ea34de4-5832-4a61-9632-3cf840007d73.png",
 "exif": {},
 "created": "2024-09-29T15:15:20+03:00",
 "resource_id": "1573541518:c70b1db434fcef3dd54814b275c380b90304de08af82bc7d4f9930a8201718d0",
 "modified": "2024-09-29T15:15:20+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/e3e35e28b46d51a0f3ed65e6f977768913db5cfa8e1968a9fd3a0dd7a0e10d97/66f97d18/gwThwhLBKYvLhQCNnqAHivTyW17WRM8SPPMQOvH6-qbQz8d8VWOGlkwZCgoP8dJ0gy2XfMgP1GVEF7gL_kPWBA%3D%3D?uid=1573541518&filename=9ea34de4-5832-4a61-9632-3cf840007d73.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/9ea34de4-5832-4a61-9632-3cf840007d73.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1727612120343168
}
```

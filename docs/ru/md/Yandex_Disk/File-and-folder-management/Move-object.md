---
sidebar_position: 9
---

# Переместить объект
 Перемещает объект по заданному пути и пути к оригиналу



`Функция ПереместитьОбъект(Знач Токен, Знач Оригинал, Знач Путь, Знач Перезаписывать = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Оригинал | --from | Строка | Путь к оригинальному файлу или папке |
  | Путь | --to | Строка | Путь назначение для перемещения |
  | Перезаписывать | --rewrite | Булево | Перезаписывать если файл с таким именем уже существует |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен     = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Оригинал  = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";
    Путь      = "/" + Строка(Новый УникальныйИдентификатор) + ".png";

    Результат = OPI_YandexDisk.ПереместитьОбъект(Токен, Оригинал, Путь, Истина);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПереместитьОбъект --token "y0_AgAAAABdylaOAA..." --from "/Альпака.png" --to "/Тестовая папка/Альпака (Перемещенная).png" --rewrite %rewrite%

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:59731e01638f4b14be004035a693dbdbd2d6883a7cc7caa0c071db68dd9f2579",
  "public_resource": "1573541518:59731e01638f4b14be004035a693dbdbd2d6883a7cc7caa0c071db68dd9f2579"
 },
 "name": "d1aceb75-7072-449c-a6c5-d2f616cef200.png",
 "exif": {},
 "created": "2024-09-29T15:16:19+03:00",
 "resource_id": "1573541518:59731e01638f4b14be004035a693dbdbd2d6883a7cc7caa0c071db68dd9f2579",
 "modified": "2024-09-29T15:16:41+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/37bcf800f77986199e077c8f0d8e3de7b863ea01350e4a117641a06d6c94e259/66f97d69/gwThwhLBKYvLhQCNnqAHivTyW17WRM8SPPMQOvH6-qbQz8d8VWOGlkwZCgoP8dJ0gy2XfMgP1GVEF7gL_kPWBA%3D%3D?uid=1573541518&filename=d1aceb75-7072-449c-a6c5-d2f616cef200.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/d1aceb75-7072-449c-a6c5-d2f616cef200.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1727612201228686
}
```

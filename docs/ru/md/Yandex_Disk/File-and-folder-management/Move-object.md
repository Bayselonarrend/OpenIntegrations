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
  "private_resource": "1573541518:e8fdbf44991b1a662c0297de6bd97c6dfab23da4e8c2c57e05677927b505e826",
  "public_resource": "1573541518:e8fdbf44991b1a662c0297de6bd97c6dfab23da4e8c2c57e05677927b505e826"
 },
 "name": "a92aaa91-1147-4caf-9131-31f4f9c74a30.png",
 "exif": {},
 "created": "2024-10-06T17:23:18+03:00",
 "resource_id": "1573541518:e8fdbf44991b1a662c0297de6bd97c6dfab23da4e8c2c57e05677927b505e826",
 "modified": "2024-10-06T17:23:39+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/d34a92b6d72a13deb35aa6c4d43815e2ca57b58d4ee4975e661f1cb6ca492ad2/6702d5ab/gwThwhLBKYvLhQCNnqAHihVVz7ErQebVldoswZNJ8EZu6ft-neADkw8Jwv-02j2HwzPltvEmOSYv32VMUJrffg%3D%3D?uid=1573541518&filename=a92aaa91-1147-4caf-9131-31f4f9c74a30.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/a92aaa91-1147-4caf-9131-31f4f9c74a30.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728224619441990
}
```

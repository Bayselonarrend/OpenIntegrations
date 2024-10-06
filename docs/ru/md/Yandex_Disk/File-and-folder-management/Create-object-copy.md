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
  "private_resource": "1573541518:b4b1b5de57615c0d8a853be1df8ce386c3a0d302edd83f8ebb7690da47eb9b8b",
  "public_resource": "1573541518:b4b1b5de57615c0d8a853be1df8ce386c3a0d302edd83f8ebb7690da47eb9b8b"
 },
 "name": "95a1d55b-2783-4cab-8f66-51e7d0e51274.png",
 "exif": {},
 "created": "2024-10-06T17:22:18+03:00",
 "resource_id": "1573541518:b4b1b5de57615c0d8a853be1df8ce386c3a0d302edd83f8ebb7690da47eb9b8b",
 "modified": "2024-10-06T17:22:18+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/dc77b1acd756705cbc887757ff7aeacdd849c05fcffd0f68cf759cbd564bc2cf/6702d55b/gwThwhLBKYvLhQCNnqAHihVVz7ErQebVldoswZNJ8EZu6ft-neADkw8Jwv-02j2HwzPltvEmOSYv32VMUJrffg%3D%3D?uid=1573541518&filename=95a1d55b-2783-4cab-8f66-51e7d0e51274.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/95a1d55b-2783-4cab-8f66-51e7d0e51274.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728224538797231
}
```

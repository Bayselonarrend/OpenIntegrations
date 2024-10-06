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
 "public_key": "WAX0l0uNT0M57pccIIFSf7oZmPOM8M9sdwmhmokM/8kImg4SfawJcrqMzfd1b5hYq/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/Heov6AKbX1rpVQ",
 "name": "34055c70-602e-4b99-aed5-c21da31de28a.png",
 "exif": {},
 "created": "2024-10-06T17:23:55+03:00",
 "size": 2114023,
 "resource_id": "1573541518:624d4a16e6c75f7d05e9fb0b1b046eef1f7b17175d3bd2ca90893a26b9ad78d2",
 "modified": "2024-10-06T17:23:55+03:00",
 "comment_ids": {
  "private_resource": "1573541518:624d4a16e6c75f7d05e9fb0b1b046eef1f7b17175d3bd2ca90893a26b9ad78d2",
  "public_resource": "1573541518:624d4a16e6c75f7d05e9fb0b1b046eef1f7b17175d3bd2ca90893a26b9ad78d2"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/3025e75d0132da536e5630fd8b26f396d231340a6ced4dd48cba45015e72e1b5/6702d5cf/gwThwhLBKYvLhQCNnqAHihVVz7ErQebVldoswZNJ8EZu6ft-neADkw8Jwv-02j2HwzPltvEmOSYv32VMUJrffg%3D%3D?uid=1573541518&filename=34055c70-602e-4b99-aed5-c21da31de28a.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/34055c70-602e-4b99-aed5-c21da31de28a.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728224655462341
}
```

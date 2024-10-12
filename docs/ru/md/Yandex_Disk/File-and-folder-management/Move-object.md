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
    Оригинал  = "/bfdb9ec8-6012-49b0-8793-69c69783a3a7.png";
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
  "private_resource": "1573541518:3118f85db2c52d63f46739f577b98e05246dde4586b4ab1cc0e24dd78d620f05",
  "public_resource": "1573541518:3118f85db2c52d63f46739f577b98e05246dde4586b4ab1cc0e24dd78d620f05"
 },
 "name": "8c8186aa-c5cf-48ce-b708-9414a656b3c5.png",
 "exif": {},
 "created": "2024-10-08T20:38:47+03:00",
 "resource_id": "1573541518:3118f85db2c52d63f46739f577b98e05246dde4586b4ab1cc0e24dd78d620f05",
 "modified": "2024-10-08T20:39:07+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/9208eb610a8ebc365afcea9f3804f32bc9f0ee3ca14862dae8921832b46aaa15/6705a67c/gwThwhLBKYvLhQCNnqAHirWAoEC4dKsPFFzSTeWuFK5ceIUkIDC7fKzI6e0Ic1rFWZAX7ZAMHvmKl9PvgqcSEQ%3D%3D?uid=1573541518&filename=8c8186aa-c5cf-48ce-b708-9414a656b3c5.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/8c8186aa-c5cf-48ce-b708-9414a656b3c5.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728409147932226
}
```

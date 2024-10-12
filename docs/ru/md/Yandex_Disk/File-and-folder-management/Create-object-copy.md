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
    Оригинал  = "/d51f82d0-0399-49b9-a45e-a00330797a14.png";
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
  "private_resource": "1573541518:78a00502b73055618006dcdf96af1d8867a982076ecfb35fb57f6e6bd09ac053",
  "public_resource": "1573541518:78a00502b73055618006dcdf96af1d8867a982076ecfb35fb57f6e6bd09ac053"
 },
 "name": "62d0280f-b17f-47bf-9305-1eac20cec63e.png",
 "exif": {},
 "created": "2024-10-08T20:37:45+03:00",
 "resource_id": "1573541518:78a00502b73055618006dcdf96af1d8867a982076ecfb35fb57f6e6bd09ac053",
 "modified": "2024-10-08T20:37:44+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/134dca3fa4b231f3ad8f586d42d1633a159217bca10bcf3ebff5610ca8a0d776/6705a62a/gwThwhLBKYvLhQCNnqAHirWAoEC4dKsPFFzSTeWuFK5ceIUkIDC7fKzI6e0Ic1rFWZAX7ZAMHvmKl9PvgqcSEQ%3D%3D?uid=1573541518&filename=62d0280f-b17f-47bf-9305-1eac20cec63e.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/62d0280f-b17f-47bf-9305-1eac20cec63e.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728409065245429
}
```

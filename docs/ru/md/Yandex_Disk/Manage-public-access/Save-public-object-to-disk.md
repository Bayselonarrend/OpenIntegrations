---
sidebar_position: 6
---

# Сохранить публичный объект на диск
 Сохраняет публичный объект на ваш диск



`Функция СохранитьПубличныйОбъектНаДиск(Знач Токен, Знач URL, Откуда = "", Куда = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URL | --url | Строка | Адрес объекта |
  | Откуда | --from | Строка | Путь внутри публичного каталога (только для папок) |
  | Куда | --to | Строка | Путь сохранения файла |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен  = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL    = "https://yadi.sk/d/3kAeHCjAHV_7sg";

    Результат   = OPI_YandexDisk.СохранитьПубличныйОбъектНаДиск(Токен, URL);
```



```sh title="Пример команды CLI"
    
  oint yadisk СохранитьПубличныйОбъектНаДиск --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --from %from% --to %to%

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:932e5aa55283d6159158a187e4f968c3e2f9810dbb1709ae38c3698a36472a65",
  "public_resource": "1573541518:932e5aa55283d6159158a187e4f968c3e2f9810dbb1709ae38c3698a36472a65"
 },
 "name": "222a2fc4-39f9-457a-94a4-c69278c48e25.png",
 "exif": {},
 "created": "2024-10-07T21:37:15+03:00",
 "resource_id": "1573541518:932e5aa55283d6159158a187e4f968c3e2f9810dbb1709ae38c3698a36472a65",
 "modified": "2024-10-07T21:37:15+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/03a416abbd49570d8b35a9187f07c1675ddacdecca84575cfd9d5ec56a58a989/6704629f/gwThwhLBKYvLhQCNnqAHitjtYP_sMEGdXpAYnCH3CeOI2TmJ3n1LCawN581CYeuif0mayq9-vnAgzEVZSHXCMA%3D%3D?uid=1573541518&filename=222a2fc4-39f9-457a-94a4-c69278c48e25.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/222a2fc4-39f9-457a-94a4-c69278c48e25.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728326235972820
}
```

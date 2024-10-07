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
  "private_resource": "1573541518:659510ebedede93de04b9aef7e1e1d8e078d026205e1187ea2e722a5d42478c3",
  "public_resource": "1573541518:659510ebedede93de04b9aef7e1e1d8e078d026205e1187ea2e722a5d42478c3"
 },
 "name": "11c6368e-227f-4b35-bfef-813c4c40e956.png",
 "exif": {},
 "created": "2024-10-07T15:56:50+03:00",
 "resource_id": "1573541518:659510ebedede93de04b9aef7e1e1d8e078d026205e1187ea2e722a5d42478c3",
 "modified": "2024-10-07T15:56:50+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/de3ae846aa8e3392dc795cc7c41a549febc04808395d181074b660569b90c058/670412d3/gwThwhLBKYvLhQCNnqAHis2EWtCdXZRJSLA1zSgtBU9Djrgh-V0mdnGiQnh0H9VCEFrtexEQitKlZKYlrsi-6g%3D%3D?uid=1573541518&filename=11c6368e-227f-4b35-bfef-813c4c40e956.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/11c6368e-227f-4b35-bfef-813c4c40e956.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728305811149507
}
```

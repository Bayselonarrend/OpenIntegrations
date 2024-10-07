---
sidebar_position: 2
---

# Отменить публикацию объекта
 Отменяет публикацию ранее опубликованного объекта



`Функция ОтменитьПубликациюОбъекта(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к опубликованному ранее объекту |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен  = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь   = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";

    Результат = OPI_YandexDisk.ОтменитьПубликациюОбъекта(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk ОтменитьПубликациюОбъекта --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:086f972edd3c4332ebb6cd629cf131952f6a3980638257586b39b35292d5d0ab",
  "public_resource": "1573541518:086f972edd3c4332ebb6cd629cf131952f6a3980638257586b39b35292d5d0ab"
 },
 "name": "11c6368e-227f-4b35-bfef-813c4c40e956.png",
 "exif": {},
 "created": "2024-10-07T15:56:29+03:00",
 "resource_id": "1573541518:086f972edd3c4332ebb6cd629cf131952f6a3980638257586b39b35292d5d0ab",
 "modified": "2024-10-07T15:56:29+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/8e1af076fe677d213a6f33a03524c949701bfbe4dea0b3c63764aa01f5e33034/670412d4/gwThwhLBKYvLhQCNnqAHis2EWtCdXZRJSLA1zSgtBU9Djrgh-V0mdnGiQnh0H9VCEFrtexEQitKlZKYlrsi-6g%3D%3D?uid=1573541518&filename=11c6368e-227f-4b35-bfef-813c4c40e956.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/11c6368e-227f-4b35-bfef-813c4c40e956.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728305812333530
}
```

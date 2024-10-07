---
sidebar_position: 3
---

# Получить объект
 Получает информацию об объекте диска по заданному пути



`Функция ПолучитьОбъект(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к папке или файлу |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь  = "/90663562-d505-474e-a778-e25c2cf50b4b.png";

    Результат = OPI_YandexDisk.ПолучитьОбъект(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьОбъект --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:116f9bfc15b1ea3e572b5ddcd512f19271e0c0a561c2e490220ddd196bda537a",
  "public_resource": "1573541518:116f9bfc15b1ea3e572b5ddcd512f19271e0c0a561c2e490220ddd196bda537a"
 },
 "name": "f943b11d-13f5-417a-aa4f-38604cdf7f58.png",
 "exif": {},
 "created": "2024-10-07T15:53:54+03:00",
 "resource_id": "1573541518:116f9bfc15b1ea3e572b5ddcd512f19271e0c0a561c2e490220ddd196bda537a",
 "modified": "2024-10-07T15:53:54+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/c614f8d0b542b6fc71e01e4bdf1f8c6d28e2db510ea2501f75b01d489be4248a/67041226/gwThwhLBKYvLhQCNnqAHim3BuGQ8RObPrs3AaDo7vReBAh7IXV2qdMeuU1Ft0Xe29kKVdyJGyiwpYTXJSyMSBw%3D%3D?uid=1573541518&filename=f943b11d-13f5-417a-aa4f-38604cdf7f58.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/f943b11d-13f5-417a-aa4f-38604cdf7f58.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728305635480810
}
```

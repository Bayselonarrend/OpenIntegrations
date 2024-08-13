---
sidebar_position: 3
---

# Получить список опубликованных объектов.
 Получает список опубликованных объектов



`Функция ПолучитьСписокОпубликованныхОбъектов(Знач Токен, Знач Количество = 0, Знач СмещениеОтНачала = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Количество | --amount | Число | Количество возвращаемых объектов |
  | СмещениеОтНачала | --offset | Число | Смещение для получение объектов не из начала списка |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
  
  Токен = "y0_AgAAAABdylaOAA...";
  
  Ответ = OPI_YandexDisk.ПолучитьСписокОпубликованныхОбъектов(Токен, 2, 1);   //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                 //Строка
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьСписокОпубликованныхОбъектов --token "y0_AgAAAABdylaOAA..." --amount %amount% --offset %offset%

```

```json title="Результат"
  
  {
  "limit": 2,
  "offset": 1,
  "items": [
  {
  "md5": "8d7bf7d7ee61113f9044f3a28496e458",
  "sha256": "f7607461b40164d5064d1d5085cbe1e94ecb1326e7ff8db857931b2ccd14b7f8",
  "revision": 1707467847758751,
  "media_type": "image",
  "file": "https://downloader.disk.yandex.ru/disk/ec7c4af09602f08ba661fb602a8e4db7c8ca13285ffbeab9d8506dff136bae19/65c642de/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458",
  "modified": "2024-02-08T16:17:21+00:00",
  "sizes": [
  {
  "name": "ORIGINAL",
  "url": "https://downloader.disk.yandex.ru/disk/57195ff44cc3ad6aae4f76ce041f034cbc8d2b58e39de212d8f1a2c3a699db43/65c642de/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458"
  },
  {
  "name": "DEFAULT",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2"
  },
  {
  "name": "XXXS",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXS&crop=0"
  },
  {
  "name": "XXS",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXS&crop=0"
  },
  {
  "name": "XS",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XS&crop=0"
  },
  {
  "name": "S",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  },
  {
  "name": "M",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=M&crop=0"
  },
  {
  "name": "L",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=L&crop=0"
  },
  {
  "name": "XL",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XL&crop=0"
  },
  {
  "name": "XXL",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXL&crop=0"
  },
  {
  "name": "XXXL",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXL&crop=0"
  },
  {
  "name": "C",
  "url": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  }
  ],
  "resource_id": "1573541518:c19122683683dbd529ee214569132fa1f710392869aec1f0981d474d212c910f",
  "preview": "https://downloader.disk.yandex.ru/preview/23006fe00bfa57b1864ad410e7ddc2c65c3b55824897c2a7ffbe8d78a64159ff/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=305ac06e-8d73-4d58-ae46-0ea29a7406da.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
  "size": 440431,
  "created": "2024-02-08T16:17:21+00:00",
  "type": "file",
  "name": "305ac06e-8d73-4d58-ae46-0ea29a7406da.png",
  "exif": {},
  "public_url": "https://yadi.sk/i/E_la61R-mzUT5A",
  "public_key": "NZQPwaOubeMinNBV4E6vzBEuymih3ZMAHHopRVwcS/Xu163y7YXBNfzquJP61v+5q/J6bpmRyOJonT3VoXnDag==",
  "path": "disk:/305ac06e-8d73-4d58-ae46-0ea29a7406da.png",
  "antivirus_status": "clean",
  "mime_type": "image/png",
  "comment_ids": {
  "public_resource": "1573541518:c19122683683dbd529ee214569132fa1f710392869aec1f0981d474d212c910f",
  "private_resource": "1573541518:c19122683683dbd529ee214569132fa1f710392869aec1f0981d474d212c910f"
  }
  },
  {
  "md5": "8d7bf7d7ee61113f9044f3a28496e458",
  "sha256": "f7607461b40164d5064d1d5085cbe1e94ecb1326e7ff8db857931b2ccd14b7f8",
  "revision": 1707061681378003,
  "media_type": "unknown",
  "file": "https://downloader.disk.yandex.ru/disk/1901f85f01b5fe49b247379130d99dd0241ceb8f29943842febf7b8da6da3f1f/65c642de/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=New&disposition=attachment&hash=&limit=0&content_type=mixed&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=unknown&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458",
  "modified": "2024-02-02T17:08:06+00:00",
  "sizes": [
  {
  "name": "DEFAULT",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2"
  },
  {
  "name": "XXXS",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXXS&crop=0"
  },
  {
  "name": "XXS",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXS&crop=0"
  },
  {
  "name": "XS",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XS&crop=0"
  },
  {
  "name": "S",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  },
  {
  "name": "M",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=M&crop=0"
  },
  {
  "name": "L",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=L&crop=0"
  },
  {
  "name": "XL",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XL&crop=0"
  },
  {
  "name": "XXL",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXL&crop=0"
  },
  {
  "name": "XXXL",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXXL&crop=0"
  },
  {
  "name": "C",
  "url": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  }
  ],
  "resource_id": "1573541518:a02ca75403668d64be8a4fc5ab17864ecd69ef3e3b95f9ec6fe41a64abfc2326",
  "preview": "https://downloader.disk.yandex.ru/preview/8ce27e7a570623f7b06d354f0437cda7387958c1e2ee2cc4e35af235e1bd6cd3/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=New&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0",
  "size": 440431,
  "created": "2024-02-02T17:08:06+00:00",
  "type": "file",
  "name": "New",
  "exif": {},
  "public_url": "https://yadi.sk/i/BpLVpspCDVp0rw",
  "public_key": "jOttD+xa1Q27aw1F5pZ2cFZi6bFYThmnpmJkkbmvD1bLErfIx4L0xd2KMy430kUEq/J6bpmRyOJonT3VoXnDag==",
  "path": "disk:/New",
  "antivirus_status": "clean",
  "mime_type": "mixed",
  "comment_ids": {
  "public_resource": "1573541518:a02ca75403668d64be8a4fc5ab17864ecd69ef3e3b95f9ec6fe41a64abfc2326",
  "private_resource": "1573541518:a02ca75403668d64be8a4fc5ab17864ecd69ef3e3b95f9ec6fe41a64abfc2326"
  }
  }
  ]
  }
  

```

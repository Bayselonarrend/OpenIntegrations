---
sidebar_position: 4
---

# Получить публичный объект
 Получает информацию об опубликованном объекте по его URL



`Функция ПолучитьПубличныйОбъект(Знач Токен, Знач URL, Знач Количество = 0, Знач СмещениеОтНачала = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URL | --url | Строка | Адрес объекта |
  | Количество | --amount | Число | Количество возвращаемых вложенных объектов (для каталога) |
  | СмещениеОтНачала | --offset | Число | Смещение для получение вложенных объектов не из начала списка |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
  
  Токен = "y0_AgAAAABdylaOAA...";
  URL   = "https://disk.yandex.by/i/txwzakUVtxgjoQ"
  
  Ответ = OPI_YandexDisk.ПолучитьПубличныйОбъект(Токен, URL);   //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                   //Строка
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьПубличныйОбъект --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --amount %amount% --offset %offset%

```

```json title="Результат"
  
  {
  "modified": "2024-02-09T10:50:41+00:00",
  "sizes": [
  {
  "name": "ORIGINAL",
  "url": "https://downloader.disk.yandex.ru/disk/6c21ad3881d0b63ff36b4e8dac62f92bcad19123eb5089651351bfe8bf9a1ffc/65c63da1/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458"
  },
  {
  "name": "DEFAULT",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2"
  },
  {
  "name": "XXXS",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=XXXS&crop=0"
  },
  {
  "name": "XXS",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=XXS&crop=0"
  },
  {
  "name": "XS",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=XS&crop=0"
  },
  {
  "name": "S",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=S&crop=0"
  },
  {
  "name": "M",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=M&crop=0"
  },
  {
  "name": "L",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=L&crop=0"
  },
  {
  "name": "XL",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=XL&crop=0"
  },
  {
  "name": "XXL",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=XXL&crop=0"
  },
  {
  "name": "XXXL",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=XXXL&crop=0"
  },
  {
  "name": "C",
  "url": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=S&crop=0"
  }
  ],
  "sha256": "f7607461b40164d5064d1d5085cbe1e94ecb1326e7ff8db857931b2ccd14b7f8",
  "public_key": "O+tgG9OfyuyJgwBRM+BJVaHN3Kg0nH8yi5xbEKU3m+d8vVVsZCwR+LHB8oeN+wcTq/J6bpmRyOJonT3VoXnDag==",
  "name": "Альпака.png",
  "type": "file",
  "media_type": "image",
  "revision": 1707476320145658,
  "public_url": "https://yadi.sk/i/txwzakUVtxgjoQ",
  "exif": {},
  "size": 440431,
  "md5": "8d7bf7d7ee61113f9044f3a28496e458",
  "owner": {
  "uid": "1573541518",
  "display_name": "bayselonarrend",
  "login": "bayselonarrend"
  },
  "file": "https://downloader.disk.yandex.ru/disk/625f72fc8f1f169d498e24b1c3531b81b6e26dc742ecaed842fa527a930965ec/65c63da1/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458",
  "resource_id": "1573541518:bda4781175def7529059950870dd72cd70beef0ff592e7102e731fd2cb631ec3",
  "preview": "https://downloader.disk.yandex.ru/preview/7d6b87fc78363f962283ce76b3244800b75209a63c6665ef6181a9e27b288ce8/65c63da1/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v2&size=S&crop=0",
  "created": "2024-02-09T10:50:41+00:00",
  "views_count": 1,
  "path": "/",
  "comment_ids": {
  "public_resource": "1573541518:bda4781175def7529059950870dd72cd70beef0ff592e7102e731fd2cb631ec3",
  "private_resource": "1573541518:bda4781175def7529059950870dd72cd70beef0ff592e7102e731fd2cb631ec3"
  },
  "antivirus_status": "clean",
  "mime_type": "image/png"
  }
  

```

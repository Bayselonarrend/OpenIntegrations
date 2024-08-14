---
sidebar_position: 4
---

# Get public object
 Gets information about the published object by its URL



`Function GetPublicObject(Val Token, Val URL, Val Count = 0, Val OffsetFromStart = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --url | String | Object address |
  | Count | --amount | Number | Number of returned nested objects (for catalog) |
  | OffsetFromStart | --offset | Number | Offset for getting nested objects not from the beginning of the list |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
  
  Token = "y0_AgAAAABdylaOAA...";
  URL = "https://disk.yandex.by/i/txwzakUVtxgjoQ"
  
  Response = OPI_YandexDisk.GetPublicObject(Token, URL); //Map
  Response = OPI_Tools.JSONString(Response); //String
```



```sh title="CLI command example"
    
  oint yadisk GetPublicObject --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --amount %amount% --offset %offset%

```

```json title="Result"
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
  "name": "Alpaca.png",
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

---
sidebar_position: 2
---

# Unpublish object
 Unpublishes a previously published object



`Function CancelObjectPublication(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the previously published object |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/b91ade1a-0731-4dd9-b453-199debd673c4.png";

    Result = OPI_YandexDisk.CancelObjectPublication(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk CancelObjectPublication --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"
{
  "md5": "8d7bf7d7ee61113f9044f3a28496e458",
  "sha256": "f7607461b40164d5064d1d5085cbe1e94ecb1326e7ff8db857931b2ccd14b7f8",
  "revision": 1707477571749555,
  "media_type": "image",
  "file": "https://downloader.disk.yandex.ru/disk/975f34b37717b6e83f8d3ff4102e45e3425dc27fe0b15f296941f40b9e42fafb/65c64284/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458",
  "modified": "2024-02-09T10:50:41+00:00",
  "sizes": [
  {
  "name": "ORIGINAL",
  "url": "https://downloader.disk.yandex.ru/disk/ab19200794efaae9cda8243cf7531ee1d1345a757e45232ce030ab3a74309dc1/65c64284/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458"
  },
  {
  "name": "DEFAULT",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2"
  },
  {
  "name": "XXXS",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXS&crop=0"
  },
  {
  "name": "XXS",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXS&crop=0"
  },
  {
  "name": "XS",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XS&crop=0"
  },
  {
  "name": "S",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  },
  {
  "name": "M",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=M&crop=0"
  },
  {
  "name": "L",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=L&crop=0"
  },
  {
  "name": "XL",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XL&crop=0"
  },
  {
  "name": "XXL",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXL&crop=0"
  },
  {
  "name": "XXXL",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXL&crop=0"
  },
  {
  "name": "C",
  "url": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  }
  ],
  "resource_id": "1573541518:bda4781175def7529059950870dd72cd70beef0ff592e7102e731fd2cb631ec3",
  "preview": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
  "created": "2024-02-09T10:50:41+00:00",
  "exif": {},
  "name": "Alpaca.png",
  "type": "file",
  "size": 440431,
  "path": "disk:/Alpaca.png",
  "antivirus_status": "clean",
  "comment_ids": {
  "public_resource": "1573541518:bda4781175def7529059950870dd72cd70beef0ff592e7102e731fd2cb631ec3",
  "private_resource": "1573541518:bda4781175def7529059950870dd72cd70beef0ff592e7102e731fd2cb631ec3"
  },
  "mime_type": "image/png"
  }
```

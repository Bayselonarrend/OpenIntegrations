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
    Путь  = "/ef1c7053-d969-4d1d-9101-52190c3b3a39.png";

    Результат = OPI_YandexDisk.ПолучитьОбъект(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьОбъект --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
  "md5": "8d7bf7d7ee61113f9044f3a28496e458",
  "sha256": "f7607461b40164d5064d1d5085cbe1e94ecb1326e7ff8db857931b2ccd14b7f8",
  "revision": 1707464146094880,
  "media_type": "image",
  "file": "https://downloader.disk.yandex.ru/disk/dde91b59521a82943bf471bd567cbfc5d1743e47c070612cb12142b1539dee31/65c60e42/gwThwhLBKYvLhQCNnqAHipkvjZhVNNxGTNig_llGPhLRP5nDBmXsdEg4Fhk78dfjZAaSvO2bMDHgtfB5lLZkXQ%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458",
  "modified": "2024-02-09T07:35:46+00:00",
  "sizes": [
  {
  "name": "ORIGINAL",
  "url": "https://downloader.disk.yandex.ru/disk/30f5ad2a163156a249c62177447abd5e88c7dc54491b67cd378c354abf67d7e5/65c60e42/gwThwhLBKYvLhQCNnqAHipkvjZhVNNxGTNig_llGPhLRP5nDBmXsdEg4Fhk78dfjZAaSvO2bMDHgtfB5lLZkXQ%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458"
  },
  {
  "name": "DEFAULT",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2"
  },
  {
  "name": "XXXS",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXS&crop=0"
  },
  {
  "name": "XXS",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXS&crop=0"
  },
  {
  "name": "XS",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XS&crop=0"
  },
  {
  "name": "S",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  },
  {
  "name": "M",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=M&crop=0"
  },
  {
  "name": "L",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=L&crop=0"
  },
  {
  "name": "XL",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XL&crop=0"
  },
  {
  "name": "XXL",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXL&crop=0"
  },
  {
  "name": "XXXL",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXL&crop=0"
  },
  {
  "name": "C",
  "url": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  }
  ],
  "resource_id": "1573541518:0c7e8321400e442148c5dedba88c043536e0fdafbb005577de3aba090a4b21eb",
  "preview": "https://downloader.disk.yandex.ru/preview/69709cc2cbb959f6e2d0c73114daf31bb0c928fee1ac6fa07ad49d6880a45bb0/inf/C_BTcM66RTR0fZaok1Kn-da5QIF3lhb76OqICnyTAmG6ZHxPEuwL760R39ZLYBuZNUGPqM-Xip6PIzqzAs2hpg%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
  "created": "2024-02-08T10:56:19+00:00",
  "exif": {},
  "name": "Альпака.png",
  "type": "file",
  "size": 440431,
  "path": "disk:/Альпака.png",
  "antivirus_status": "clean",
  "comment_ids": {
  "public_resource": "1573541518:0c7e8321400e442148c5dedba88c043536e0fdafbb005577de3aba090a4b21eb",
  "private_resource": "1573541518:0c7e8321400e442148c5dedba88c043536e0fdafbb005577de3aba090a4b21eb"
  },
  "mime_type": "image/png"
  }
```

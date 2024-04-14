---
sidebar_position: 4
---

# Сохранить публичный объект на Диск
Сохраняет объект в публичном доступе на Диск

*Функция СохранитьПубличныйОбъектНаДиск(Знач Токен, Знач URL, Откуда = "", Куда = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | URL | --url | Строка | URL публичного объекта |
  | Откуда | --from | Строка (необяз.) | Путь к файлу внутри публичной папки (если необходимо) |
  | Куда | --to | Строка (необяз.) | Путь сохранения файла на Диске. Папка "Загрузки" по умолчанию |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Yandex

```bsl title="Пример кода"
			
    Токен = "y0_AgAAAABdylaOAA...";   
    URL   = "https://disk.yandex.by/i/txwzakUVtxgjoQ"

    Ответ = OPI_YandexDisk.СохранитьПубличныйОбъектНаДиск(Токен, URL);   //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                          //Строка

```

```sh title="Пример команд CLI"

    oint yadisk СохранитьПубличныйОбъектНаДиск --token %token% --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --to "/Новая папка"

```

![Результат](img/3.png)

```json title="Результат"

{
 "md5": "8d7bf7d7ee61113f9044f3a28496e458",
 "sha256": "f7607461b40164d5064d1d5085cbe1e94ecb1326e7ff8db857931b2ccd14b7f8",
 "revision": 1707476319349747,
 "media_type": "image",
 "file": "https://downloader.disk.yandex.ru/disk/e0c18f0f93c86c78b56f0927b8a7b2ff688cbe986c5825cb5b705f387e88ccac/65c63da0/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458",
 "modified": "2024-02-09T10:58:39+00:00",
 "sizes": [
  {
   "name": "ORIGINAL",
   "url": "https://downloader.disk.yandex.ru/disk/9ad20ff719c0cc685af46a7043850faee074fd93cfbb610a9e0edbd22ec3e459/65c63da0/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458"
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
 "resource_id": "1573541518:cdd95740529a9a67d1b9aa294b1909c1e891b9b9585e117b4cae8a7ffcbfc6a3",
 "preview": "https://downloader.disk.yandex.ru/preview/8d337cd1c2b4da544bff6d006bed0b0b7c8defb109da3fa71920174d9c757d52/inf/GyInrPTZYscNNkZ1el2hXGYA_rTREbdNcSWvdp6e5r4TWFuEVaJ-PEvHuuMV9iIpDSzaDO4ey5V7KB1TSxCHmA%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
 "created": "2024-02-09T10:58:39+00:00",
 "exif": {},
 "name": "Альпака.png",
 "type": "file",
 "size": 440431,
 "path": "disk:/Загрузки/Альпака.png",
 "antivirus_status": "clean",
 "comment_ids": {
  "public_resource": "1573541518:cdd95740529a9a67d1b9aa294b1909c1e891b9b9585e117b4cae8a7ffcbfc6a3",
  "private_resource": "1573541518:cdd95740529a9a67d1b9aa294b1909c1e891b9b9585e117b4cae8a7ffcbfc6a3"
 },
 "mime_type": "image/png"
}

```

---
sidebar_position: 8
---

# Получить список файлов
Получает список файлов с или без отбора по типу Список доступных типов: audio, backup, book, compressed, data, development, diskimage, document, encoded, executable, flash, font, mage, settings, spreadsheet, text, unknown, video, web



`Функция ПолучитьСписокФайлов(Знач Токен, Знач Количество = 0, Знач СмещениеОтНачала = 0, Знач ОтборПоТипу = "", Знач СортироватьПоДате = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Количество | --amount | Число,Строка | Количество возвращаемых объектов |
  | СмещениеОтНачала | --offset | Число | Смещение для получение объектов не из начала списка |
  | ОтборПоТипу | --type | Строка | Отбор по типу файла |
  | СортироватьПоДате | --datesort | Булево | Истина > сортировать по дате, Ложь > по алфавиту |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
  
  Токен = "y0_AgAAAABdylaOAA...";
  Ответ = OPI_YandexDisk.ПолучитьСписокФайлов(Токен, 2, 1, "image");  //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                         //Строка
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьСписокФайлов --token "y0_AgAAAABdylaOAA..." --amount %amount% --offset %offset% --type %type% --datesort %datesort%

```

```json title="Результат"
{
  "limit": 2,
  "offset": 1,
  "items": [
  {
  "md5": "d27d72a3059ad5ebed7a5470459d2670",
  "sha256": "fe9e2ea0d191ff0eb9d2129464f87da5fd5f02f370a4889492efc18947c70172",
  "revision": 1706789623558058,
  "media_type": "image",
  "file": "https://downloader.disk.yandex.ru/disk/600aa748c7064a155b01d3906b075cd77b14610e224ea20f629220e132a23add/65c62e41/8Ng7aqpQFqID9pDAoIfkzJNiNSME7Q0O0DrXr5-IhMhsc2sfDe4WYN63DQe_2uMcRJgJ9rEomrz3OKR_LVAEqg%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=attachment&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&fsize=1454228&hid=427d5900ad807ada37f94079f0fe7806&media_type=image&tknv=v2&etag=d27d72a3059ad5ebed7a5470459d2670",
  "modified": "2024-02-01T12:13:43+00:00",
  "sizes": [
  {
  "name": "ORIGINAL",
  "url": "https://downloader.disk.yandex.ru/disk/386674328ba45b839defa451b28ce532a3027e32db910efce2a92a3b578fed65/65c62e41/8Ng7aqpQFqID9pDAoIfkzJNiNSME7Q0O0DrXr5-IhMhsc2sfDe4WYN63DQe_2uMcRJgJ9rEomrz3OKR_LVAEqg%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&fsize=1454228&hid=427d5900ad807ada37f94079f0fe7806&media_type=image&tknv=v2&etag=d27d72a3059ad5ebed7a5470459d2670"
  },
  {
  "name": "DEFAULT",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2"
  },
  {
  "name": "XXXS",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXXS&crop=0"
  },
  {
  "name": "XXS",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXS&crop=0"
  },
  {
  "name": "XS",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XS&crop=0"
  },
  {
  "name": "S",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  },
  {
  "name": "M",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=M&crop=0"
  },
  {
  "name": "L",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=L&crop=0"
  },
  {
  "name": "XL",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XL&crop=0"
  },
  {
  "name": "XXL",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXL&crop=0"
  },
  {
  "name": "XXXL",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXXL&crop=0"
  },
  {
  "name": "C",
  "url": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  }
  ],
  "resource_id": "1573541518:aa71f7560c6a3080746acde64bc791aaae70942505fcc987f2c0dc9e95384565",
  "preview": "https://downloader.disk.yandex.ru/preview/a11d0906a8fde188cd289507e178fff87a2a594c292f3a7058f53d6451f4f0ae/inf/PNec8rFbFd0WPJMSAfUc7pNiNSME7Q0O0DrXr5-IhMgAOITNajybxvIo7yfrDcZbCvINiUpbWSnJA594N-sTjQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0",
  "created": "2024-02-01T12:13:43+00:00",
  "exif": {
  "date_time": "2014-12-13T11:59:54+00:00"
  },
  "name": "Москва.jpg",
  "type": "file",
  "size": 1454228,
  "path": "disk:/Москва.jpg",
  "antivirus_status": "clean",
  "comment_ids": {
  "public_resource": "1573541518:aa71f7560c6a3080746acde64bc791aaae70942505fcc987f2c0dc9e95384565",
  "private_resource": "1573541518:aa71f7560c6a3080746acde64bc791aaae70942505fcc987f2c0dc9e95384565"
  },
  "mime_type": "image/jpeg"
  },
  {
  "md5": "ab903d9cab031eca2a8f12f37bbc9d37",
  "sha256": "21f14018436c3dca7a47c5bd83f3b9bbc8b6c113b2a1d23ce7f5a0c80ce0e687",
  "revision": 1706789624992463,
  "media_type": "image",
  "file": "https://downloader.disk.yandex.ru/disk/1c893a2d6e3b1940e5705cb1e6c3dca9f47c9b79f2c2841615b8ae8868353186/65c62e41/WkVZq2fSNyX4Wj1eGp5xvVuQ-biYzXHMfURW4VIc4rnTDhDv_2FACX-6brYvo5Lna_4TuhGY_HuTtgY7RM8VkQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=attachment&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&fsize=1080301&hid=d7c189c9f94c684a2a2e6cfd66ed312d&media_type=image&tknv=v2&etag=ab903d9cab031eca2a8f12f37bbc9d37",
  "modified": "2024-02-01T12:13:44+00:00",
  "sizes": [
  {
  "name": "ORIGINAL",
  "url": "https://downloader.disk.yandex.ru/disk/a7af85df25252eb792b08de6bee2fb681dee549b375589a12574d6db2b97e770/65c62e41/WkVZq2fSNyX4Wj1eGp5xvVuQ-biYzXHMfURW4VIc4rnTDhDv_2FACX-6brYvo5Lna_4TuhGY_HuTtgY7RM8VkQ%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&fsize=1080301&hid=d7c189c9f94c684a2a2e6cfd66ed312d&media_type=image&tknv=v2&etag=ab903d9cab031eca2a8f12f37bbc9d37"
  },
  {
  "name": "DEFAULT",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2"
  },
  {
  "name": "XXXS",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXXS&crop=0"
  },
  {
  "name": "XXS",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXS&crop=0"
  },
  {
  "name": "XS",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XS&crop=0"
  },
  {
  "name": "S",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  },
  {
  "name": "M",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=M&crop=0"
  },
  {
  "name": "L",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=L&crop=0"
  },
  {
  "name": "XL",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XL&crop=0"
  },
  {
  "name": "XXL",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXL&crop=0"
  },
  {
  "name": "XXXL",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=XXXL&crop=0"
  },
  {
  "name": "C",
  "url": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0"
  }
  ],
  "resource_id": "1573541518:d239b48c0b8ec4690eca0dea331d6b5981694233186ee5252b6d63d552319eb3",
  "preview": "https://downloader.disk.yandex.ru/preview/25fe5fde8d0e768d2827a69b600e5ea36c1cd53d0052bb7e3bc0ee072265a6ae/inf/e4WTSuwXNwLjbjwaWi1vXFuQ-biYzXHMfURW4VIc4rmBxZhGf6N5b4MEf_ueh3VwZDJ7I3Qq7cU45yvpQs5vyA%3D%3D?uid=1573541518&filename=%D0%9C%D0%BE%D1%80%D0%B5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=1573541518&tknv=v2&size=S&crop=0",
  "created": "2024-02-01T12:13:44+00:00",
  "exif": {
  "date_time": "2014-12-13T10:31:34+00:00"
  },
  "name": "Море.jpg",
  "type": "file",
  "size": 1080301,
  "path": "disk:/Море.jpg",
  "antivirus_status": "clean",
  "comment_ids": {
  "public_resource": "1573541518:d239b48c0b8ec4690eca0dea331d6b5981694233186ee5252b6d63d552319eb3",
  "private_resource": "1573541518:d239b48c0b8ec4690eca0dea331d6b5981694233186ee5252b6d63d552319eb3"
  },
  "mime_type": "image/jpeg"
  }
  ]
  }
```

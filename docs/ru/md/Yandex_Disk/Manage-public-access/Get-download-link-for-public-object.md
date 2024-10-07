---
sidebar_position: 5
---

# Получить ссылку скачивания публичного объекта
 Получает прямую ссылку для скачивания публичного объекта



`Функция ПолучитьСсылкуСкачиванияПубличногоОбъекта(Знач Токен, Знач URL, Знач Путь = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URL | --url | Строка | Адрес объекта |
  | Путь | --path | Строка | Путь внутри объекта |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен  = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL    = "https://yadi.sk/d/3kAeHCjAHV_7sg";

    Результат  = OPI_YandexDisk.ПолучитьСсылкуСкачиванияПубличногоОбъекта(Токен, URL);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьСсылкуСкачиванияПубличногоОбъекта --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --path %path%

```

```json title="Результат"
{
 "href": "https://downloader.disk.yandex.ru/disk/5e993b1266442462a075b7c4cb421b5b5ed13d68611d1e3aa047abc91cb5de07/670412d1/gwThwhLBKYvLhQCNnqAHis2EWtCdXZRJSLA1zSgtBU9Djrgh-V0mdnGiQnh0H9VCEFrtexEQitKlZKYlrsi-6g%3D%3D?uid=0&filename=11c6368e-227f-4b35-bfef-813c4c40e956.png&disposition=attachment&hash=BIODtMp7NsiCN0rEdJUYS%2BT9v2zV8UrEk9b56/qY67T2Lz%2B6R4ZZFbwC49gmP67qq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2",
 "method": "GET",
 "templated": false
}
```

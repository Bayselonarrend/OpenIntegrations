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
 "href": "https://downloader.disk.yandex.ru/disk/e71ba2885811c7ce6a78ef51df4df7d2ae9d064fcc5de1f6255c826b85ec7e30/6703b530/gwThwhLBKYvLhQCNnqAHim3BuGQ8RObPrs3AaDo7vReBAh7IXV2qdMeuU1Ft0Xe29kKVdyJGyiwpYTXJSyMSBw%3D%3D?uid=0&filename=828ddf48-c40b-4642-b39b-3892c7e6609b.png&disposition=attachment&hash=jCcNsaKiHZ0F7U83UuZCRx3AV3F3P0VK3ULQ8seniieoRnGzPssDMZSpVJvesWa4q/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2",
 "method": "GET",
 "templated": false
}
```

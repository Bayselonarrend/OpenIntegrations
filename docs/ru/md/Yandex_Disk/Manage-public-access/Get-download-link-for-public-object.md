﻿---
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
 "href": "https://downloader.disk.yandex.ru/disk/8e95b3a88dc1790aba8ecfc4c6cc1233a175cbfa796b4c58004664dd966be7bb/6705a6a1/gwThwhLBKYvLhQCNnqAHirWAoEC4dKsPFFzSTeWuFK5ceIUkIDC7fKzI6e0Ic1rFWZAX7ZAMHvmKl9PvgqcSEQ%3D%3D?uid=0&filename=95934d00-67ef-43eb-a306-73a490a0aac0.png&disposition=attachment&hash=fLfKnKmtqPt6TSTumjWC%2BGMkuduPJAnpx5lwlWVVqp8zeDXp5X74XLJ2GbNOAgYIq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2",
 "method": "GET",
 "templated": false
}
```

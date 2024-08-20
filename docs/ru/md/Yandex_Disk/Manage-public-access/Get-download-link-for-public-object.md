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
    URL    = "https://yadi.sk/d/XNPvDXuWUP39gA";

    Результат  = OPI_YandexDisk.ПолучитьСсылкуСкачиванияПубличногоОбъекта(Токен, URL);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьСсылкуСкачиванияПубличногоОбъекта --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --path %path%

```

```json title="Результат"
{
  "templated": false,
  "method": "GET",
  "href": "https://downloader.disk.yandex.ru/disk/e43662271abc4a5afd5b2122004e702e97e20c36932d687bbca183cfee10413d/65c63eba/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=attachment&hash=O%2BtgG9OfyuyJgwBRM%2BBJVaHN3Kg0nH8yi5xbEKU3m%2Bd8vVVsZCwR%2BLHB8oeN%2BwcTq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2"
  }
```

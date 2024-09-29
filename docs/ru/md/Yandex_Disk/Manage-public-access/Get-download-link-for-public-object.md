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
 "href": "https://downloader.disk.yandex.ru/disk/494cee2f21d9440aca37d741d496af862d567146948ea0126776f9771d2e5696/66f97d8d/gwThwhLBKYvLhQCNnqAHivTyW17WRM8SPPMQOvH6-qbQz8d8VWOGlkwZCgoP8dJ0gy2XfMgP1GVEF7gL_kPWBA%3D%3D?uid=0&filename=0e9270bc-6c4a-4a9e-807b-14b9824a2caa.png&disposition=attachment&hash=OC0Ezvwjp3l71J00AhTkPhCOFBVmvM5IKOLmnX%2BxmEPiUvBxLxeHhEajJZDr79elq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2",
 "method": "GET",
 "templated": false
}
```

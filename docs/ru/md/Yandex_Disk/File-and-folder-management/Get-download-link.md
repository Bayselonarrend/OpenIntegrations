---
sidebar_position: 6
---

# Получить ссылку для скачивания
 Получает ссылку для скачивания файла



`Функция ПолучитьСсылкуДляСкачивания(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к файлу для скачивания |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен    = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь     = "/81c378eb-eaf3-446c-9b78-b89c94fd8e50.png";

    Результат = OPI_YandexDisk.ПолучитьСсылкуДляСкачивания(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьСсылкуДляСкачивания --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
 "href": "https://downloader.disk.yandex.ru/disk/0e192e49509f7475d3a9e27699b591780bf9c68f4563c8d34455b99435afb9ed/6704127c/gwThwhLBKYvLhQCNnqAHis2EWtCdXZRJSLA1zSgtBU9Djrgh-V0mdnGiQnh0H9VCEFrtexEQitKlZKYlrsi-6g%3D%3D?uid=1573541518&filename=1381c5c4-5ec7-4afa-ad9d-16fc03a0ed01.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "method": "GET",
 "templated": false
}
```

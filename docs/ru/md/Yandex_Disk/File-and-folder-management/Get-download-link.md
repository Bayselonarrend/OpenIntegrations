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
    Путь     = "/86b5f33b-0ae3-41f8-913d-d0f72c20d85d.png";

    Результат = OPI_YandexDisk.ПолучитьСсылкуДляСкачивания(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьСсылкуДляСкачивания --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
 "href": "https://downloader.disk.yandex.ru/disk/7ea429910047f067a2bd4ae45d24a9678ec289038468ab5b1fd4135827772a09/66f97d3c/gwThwhLBKYvLhQCNnqAHivTyW17WRM8SPPMQOvH6-qbQz8d8VWOGlkwZCgoP8dJ0gy2XfMgP1GVEF7gL_kPWBA%3D%3D?uid=1573541518&filename=e850c656-ee28-49dd-a34e-12e849cc5578.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "method": "GET",
 "templated": false
}
```

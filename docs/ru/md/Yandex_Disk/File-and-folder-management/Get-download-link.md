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
 "href": "https://downloader.disk.yandex.ru/disk/dd238bf4fdd879d13c37dc6b404e14c84ab2186704d640ce6e8213a30318e641/6705a64e/gwThwhLBKYvLhQCNnqAHirWAoEC4dKsPFFzSTeWuFK5ceIUkIDC7fKzI6e0Ic1rFWZAX7ZAMHvmKl9PvgqcSEQ%3D%3D?uid=1573541518&filename=6605347b-a937-40bd-9d48-b1d480048e0d.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "method": "GET",
 "templated": false
}
```

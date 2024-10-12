---
sidebar_position: 11
---

# Загрузить файл по URL
 Загружает файл на диск, забирая его по заданному URL



`Функция ЗагрузитьФайлПоURL(Знач Токен, Знач Путь, Знач Адрес) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь помещения загруженного файла |
  | Адрес | --url | Строка | URL файла |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен   = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Адрес   = "https://api.athenaeum.digital/test_data/picture.jpg";
    Путь    = "/" + Строка(Новый УникальныйИдентификатор) + ".png";

    Результат = OPI_YandexDisk.ЗагрузитьФайлПоURL(Токен, Путь, Адрес);
```



```sh title="Пример команды CLI"
    
  oint yadisk ЗагрузитьФайлПоURL --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png" --url "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png"

```

```json title="Результат"
{
 "href": "https://cloud-api.yandex.net/v1/disk/operations/520264c4fc3c8e9ae87085c0d12fc77767c13fc7f11582ea5aac37756d3f823f",
 "method": "GET",
 "templated": false
}
```

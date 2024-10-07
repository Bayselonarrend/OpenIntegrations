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
    Адрес   = "https://openyellow.neocities.org/test_data/picture.jpg";
    Путь    = "/" + Строка(Новый УникальныйИдентификатор) + ".png";

    Результат = OPI_YandexDisk.ЗагрузитьФайлПоURL(Токен, Путь, Адрес);
```



```sh title="Пример команды CLI"
    
  oint yadisk ЗагрузитьФайлПоURL --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png" --url "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png"

```

```json title="Результат"
{
 "href": "https://cloud-api.yandex.net/v1/disk/operations/cdb401c1514a562caa34e3f79136dfc2bc926f893938fb39bdd64057b2e621c5",
 "method": "GET",
 "templated": false
}
```

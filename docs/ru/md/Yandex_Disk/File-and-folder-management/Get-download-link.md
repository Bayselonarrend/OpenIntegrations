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
  
  Токен = "y0_AgAAAABdylaOAA...";
  Путь  = "/Альпака.png"
  Ответ = OPI_YandexDisk.ПолучитьСсылкуДляСкачивания(Токен, Путь); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                      //Строка
```



```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьСсылкуДляСкачивания --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png"

```

```json title="Результат"
{
  "templated": false,
  "method": "GET",
  "href": "https://downloader.disk.yandex.ru/disk/5e035e14f3580573be69477a0a5a41a598227875d7c471604e386ee2dcfc7067/65c62a93/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458"
  }
```

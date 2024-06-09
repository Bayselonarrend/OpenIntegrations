---
sidebar_position: 11
---

# Загрузить файл по URL
 Загружает файл на диск, забирая его по заданному URL


*Функция ЗагрузитьФайлПоURL(Знач Токен, Знач Путь, Знач Адрес) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь помещения загруженного файла |
  | Адрес | --url | Строка | URL файла |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

```bsl title="Пример кода"
	
  
  Токен = "y0_AgAAAABdylaOAA...";
  Путь  = "/Альпака.png";
  Адрес = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";
  
  Ответ = OPI_YandexDisk.ЗагрузитьФайлПоURL(Токен, Путь, Адрес); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                    //Строка
  
	
```

```sh title="Пример команды CLI"
    
  oint yadisk ЗагрузитьФайлПоURL --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png" --url "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png"

```


```json title="Результат"

{
  "templated": false,
  "method": "GET",
  "href": "https://cloud-api.yandex.net/v1/disk/operations/b78a7ef2dd49971aa22e5e72f2e615db885da9947d7c61b2822de23a99e855a1"
  }

```

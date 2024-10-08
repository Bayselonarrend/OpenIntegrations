﻿---
sidebar_position: 1
---

# Загрузить файл
 Загружает одиночный файл на сервер Neocities



`Функция ЗагрузитьФайл(Знач Токен, Знач Путь, Знач Данные) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен авторизации |
  | Путь | --path | Строка | Целевой путь файла на Neocities |
  | Данные | --file | Строка, ДвоичныеДанные | URL, путь или данные файла для загрузки |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities

<br/>

:::tip
Документация Neocities API: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Пример кода"
    Токен  = "7419cd51de4037f7...";
    Данные = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Путь или Двоичные данные
    Путь   = "testfolder/test_pic.png";

    Результат = OPI_Neocities.ЗагрузитьФайл(Токен, Путь, Данные);
```



```sh title="Пример команды CLI"
    
  oint neocities ЗагрузитьФайл --token "7419cd51de4037f7..." --path %path% --file "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"

```

```json title="Результат"
{
 "result": "success",
 "message": "your file(s) have been successfully uploaded"
}
```

﻿---
sidebar_position: 7
---

# Скачать файл
 Скачивает файл по указанному пути



`Функция СкачатьФайл(Знач Токен, Знач Путь, Знач ПутьСохранения = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к файлу для скачивания |
  | ПутьСохранения | --out | Строка | Путь сохранения файла |

  
  Возвращаемое значение:   ДвоичныеДанные,Строка - Двоичные данные или путь к файлу при указании параметра ПутьСохранения

<br/>




```bsl title="Пример кода"
    Токен = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь  = "/81c378eb-eaf3-446c-9b78-b89c94fd8e50.png";

    Результат = OPI_YandexDisk.СкачатьФайл(Токен, Путь);
```



```sh title="Пример команды CLI"
    
  oint yadisk СкачатьФайл --token %token% --path %path% --out %out%

```

```json title="Результат"
НЕ JSON: FF D8 FF E1 54 C1 45 78 69 66 00 00 49 49 2A 00 08 00 00 00 0B 00 0E 01 02 00 20 00 00 00 92 00 00 00 0F 01 02 00 05 00 00 00 B2 00 00 00 10 01 02 00 07 00 00 00 B8 00 00 00 12 01 03 00 01 00…
```

---
sidebar_position: 3
---

# Получить список файлов
 Получает список файлов



`Функция ПолучитьСписокФайлов(Знач Токен, Знач ИмяСодержит = "", Знач Каталог = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИмяСодержит | --querry | Строка | Отбор по имени |
  | Каталог | --catalog | Строка | Отбор по ID каталога родителя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - Массив соответствий файлов

<br/>




```bsl title="Пример кода"
    Токен       = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Каталог     = "root";
    ИмяСодержит = "data";

    Результат   = OPI_GoogleDrive.ПолучитьСписокФайлов(Токен, ИмяСодержит, Каталог);
```



```sh title="Пример команды CLI"
    
  oint gdrive ПолучитьСписокФайлов --token %token% --querry %querry% --catalog "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4"

```

```json title="Результат"

```

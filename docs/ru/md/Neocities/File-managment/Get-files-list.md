﻿---
sidebar_position: 4
---

# Получить список файлов
 Получает список файлов с отбором каталога или без



`Функция ПолучитьСписокФайлов(Знач Токен, Знач Путь = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен авторизации |
  | Путь | --path | Строка | Отбор файлов по каталогу. Все, если не заполнено |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities

<br/>

:::tip
Документация Neocities API: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Пример кода"
    Токен = "7419cd51de4037f7...";
    Путь  = "test";

    Результат = OPI_Neocities.ПолучитьСписокФайлов(Токен, Путь);

    Результат = OPI_Neocities.ПолучитьСписокФайлов(Токен);
```



```sh title="Пример команды CLI"
    
  oint neocities ПолучитьСписокФайлов --token "7419cd51de4037f7..." --path %path%

```

```json title="Результат"
{
 "result": "success",
 "files": [
  {
   "path": "test/gif.gif",
   "is_directory": false,
   "size": 805189,
   "created_at": "Tue, 08 Oct 2024 17:56:42 -0000",
   "updated_at": "Tue, 08 Oct 2024 17:56:42 -0000",
   "sha1_hash": null
  },
  {
   "path": "test/pic1.png",
   "is_directory": false,
   "size": 2114023,
   "created_at": "Tue, 08 Oct 2024 17:56:42 -0000",
   "updated_at": "Tue, 08 Oct 2024 17:56:42 -0000",
   "sha1_hash": null
  }
 ]
}
```

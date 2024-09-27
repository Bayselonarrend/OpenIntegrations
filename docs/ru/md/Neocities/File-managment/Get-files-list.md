---
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
   "path": ".nojekyll",
   "is_directory": false,
   "size": 0,
   "created_at": "Mon, 23 Sep 2024 19:58:04 -0000",
   "updated_at": "Mon, 23 Sep 2024 19:58:04 -0000",
   "sha1_hash": "da39a3ee5e6b4b0d3255bfef95601890afd80709"
  },
  {
   "path": "404.html",
   "is_directory": false,
   "size": 7053,
   "created_at": "Mon, 23 Sep 2024 19:57:59 -0000",
   "updated_at": "Tue, 24 Sep 2024 13:47:32 -0000",
   "sha1_hash": "663ec102ebbf671c2b81eba688ee2ad09cf5e6c2"
  },
 ...
```

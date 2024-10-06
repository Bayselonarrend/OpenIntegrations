---
sidebar_position: 1
---

# Создать комментарий
 Создает комментарий к файлу или каталогу



`Функция СоздатьКомментарий(Знач Токен, Знач Идентификатор, Знач Комментарий) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор объекта, для которого необходим комментарий |
  | Комментарий | --text | Строка | Текст комментария |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Идентификатор = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";
    Комментарий   = "Текст комментария";

    Результат   = OPI_GoogleDrive.СоздатьКомментарий(Токен, Идентификатор, Комментарий);
```



```sh title="Пример команды CLI"
    
  oint gdrive СоздатьКомментарий --token %token% --object "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW" --text %text%

```

```json title="Результат"
{
 "id": "AAABWt9DKMo",
 "kind": "drive#comment",
 "createdTime": "2024-10-06T14:26:57.929Z",
 "modifiedTime": "2024-10-06T14:26:57.929Z",
 "replies": [],
 "author": {
  "displayName": "Антон Титовец",
  "kind": "drive#user",
  "me": true,
  "photoLink": "//lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s50-c-k-no"
 },
 "deleted": false,
 "htmlContent": "Текст комментария",
 "content": "Текст комментария"
}
```

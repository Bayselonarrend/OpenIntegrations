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
    Токен         = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Идентификатор = "1RijXw14hyQN_59ZOzJ9f35ezzU_qd114";
    Комментарий   = "Текст комментария";

    Результат   = OPI_GoogleDrive.СоздатьКомментарий(Токен, Идентификатор, Комментарий);
```



```sh title="Пример команды CLI"
    
  oint gdrive СоздатьКомментарий --token %token% --object "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW" --text %text%

```

```json title="Результат"
{
 "id": "AAABVtEUqC4",
 "kind": "drive#comment",
 "createdTime": "2024-09-29T12:20:05.167Z",
 "modifiedTime": "2024-09-29T12:20:05.167Z",
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

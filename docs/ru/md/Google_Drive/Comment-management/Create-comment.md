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
    Токен         = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Идентификатор = "1U8hhtaSXcxZuojGLumLYODMBspUV501s";
    Комментарий   = "Текст комментария";

    Результат   = OPI_GoogleDrive.СоздатьКомментарий(Токен, Идентификатор, Комментарий);
```



```sh title="Пример команды CLI"
    
  oint gdrive СоздатьКомментарий --token %token% --object "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW" --text %text%

```

```json title="Результат"
{
 "id": "AAABW19Pq0I",
 "kind": "drive#comment",
 "createdTime": "2024-10-08T17:42:33.807Z",
 "modifiedTime": "2024-10-08T17:42:33.807Z",
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

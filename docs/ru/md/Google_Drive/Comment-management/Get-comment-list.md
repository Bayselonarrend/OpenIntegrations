---
sidebar_position: 3
---

# Получить список комментариев
 Получает список всех комментариев объекта



`Функция ПолучитьСписокКомментариев(Знач Токен, Знач ИДОбъекта) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДОбъекта | --object | Строка | Идентификатор объекта |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Идентификатор = "1rjQ1PytDjJVgTIkNK600sQEPGqHDIeWW";

    Результат = OPI_GoogleDrive.ПолучитьСписокКомментариев(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gdrive ПолучитьСписокКомментариев --token %token% --object %object%

```

```json title="Результат"
{
 "kind": "drive#commentList",
 "comments": [
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
 ]
}
```

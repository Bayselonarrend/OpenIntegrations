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
    Токен         = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Идентификатор = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";

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
 ]
}
```

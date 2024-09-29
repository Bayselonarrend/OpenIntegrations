---
sidebar_position: 2
---

# Получить комментарий
 Получает комментарий по ID



`Функция ПолучитьКомментарий(Знач Токен, Знач ИДОбъекта, Знач ИДКомментария) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДОбъекта | --object | Строка | Идентификатор файла или каталога размещения комментария |
  | ИДКомментария | --comment | Строка | Идентификатор комментария |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Идентификатор = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";
    ИДКомментария = "AAABVqw_79g";

    Результат = OPI_GoogleDrive.ПолучитьКомментарий(Токен, Идентификатор, ИДКомментария);
```



```sh title="Пример команды CLI"
    
  oint gdrive ПолучитьКомментарий --token %token% --object %object% --comment "AAABI3NNNAY"

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

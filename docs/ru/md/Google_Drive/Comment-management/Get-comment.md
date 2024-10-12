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
    Токен         = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Идентификатор = "1jUonZ73Ck_Wyv5FDpsBr7UVSwx1mt0dp";
    ИДКомментария = "AAABXOfZ65M";

    Результат = OPI_GoogleDrive.ПолучитьКомментарий(Токен, Идентификатор, ИДКомментария);
```



```sh title="Пример команды CLI"
    
  oint gdrive ПолучитьКомментарий --token %token% --object %object% --comment "AAABI3NNNAY"

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

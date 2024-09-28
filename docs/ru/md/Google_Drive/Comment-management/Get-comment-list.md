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
    Токен         = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Идентификатор = "1RijXw14hyQN_59ZOzJ9f35ezzU_qd114";

    Результат = OPI_GoogleDrive.ПолучитьСписокКомментариев(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gdrive ПолучитьСписокКомментариев --token %token% --object %object%

```

```json title="Результат"
{
  "comments": [
  {
  "content": "Новый комментарий",
  "htmlContent": "Новый комментарий",
  "author": {
  "photoLink": "//lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s50-c-k-no",
  "me": true,
  "kind": "drive#user",
  "displayName": "Антон Титовец"
  },
  "replies": [],
  "modifiedTime": "2024-03-17T12:53:45.469Z",
  "createdTime": "2024-03-17T12:53:45.469Z",
  "kind": "drive#comment",
  "deleted": false,
  "id": "AAABI3NNNAY"
  }
  ],
  "kind": "drive#commentList"
  }
```

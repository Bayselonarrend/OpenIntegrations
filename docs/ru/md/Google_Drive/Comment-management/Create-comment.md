---
sidebar_position: 1
---

# Создать комментарий
 Создает комментарий к файлу или каталогу


*Функция СоздатьКомментарий(Знач Токен, Знач Идентификатор, Знач Комментарий) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор объекта, для которого необходим комментарий |
  | Комментарий | --text | Строка | Текст комментария |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	
  
  Идентификатор = "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW";
  Комментарий   = "Новый комментарий";
  
  Ответ = OPI_GoogleDrive.СоздатьКомментарий(Токен, Идентификатор, Комментарий);  //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                     //Строка
  
	
```

```sh title="Пример команды CLI"
    
  oint gdrive СоздатьКомментарий --token %token% --object "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW" --text %text%

```


```json title="Результат"

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

```

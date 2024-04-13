---
sidebar_position: 2
---

# Получить список комментариев
Получает список комментариев объекта по его ID

*Функция ПолучитьСписокКомментариев(Знач Токен, Знач ИДОбъекта) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | ИДОбъекта | --object | Строка | Идентификатор объекта комментариев |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Google

```bsl title="Пример кода"
			
    ИДФайла = "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW";

    Ответ = OPI_GoogleDrive.ПолучитьСписокКомментариев(Токен, ИДФайла); //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                         //Строка

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gdrive ПолучитьСписокКомментариев --token "%token%" --object "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW"

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

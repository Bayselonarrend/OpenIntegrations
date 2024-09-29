﻿---
sidebar_position: 13
---

# Получить список сообщений чата
 Получает список из 20 сообщений чата или диалога, в зависимости от указания IDПервого и IDПоследнего



`Функция ПолучитьСписокСообщенийЧата(Знач URL, Знач IDЧата, Знач IDПоследнего = "", Знач IDПервого = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата (chatXXX) или пользователя (XXX) для диалога |
  | IDПоследнего | --last | Строка, Число | ID последнего загруженного сообщения |
  | IDПервого | --first | Строка, Число | ID первого загруженного сообщения |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.dialog.messages.get](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=11479)
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЧата  = "chat4";

    Результат = OPI_Bitrix24.ПолучитьСписокСообщенийЧата(URL, IDЧата);

    URL            = "b24-ar17wx.bitrix24.by";
    Токен          = "c3abf666006e9f06006b12e400000001000...";
    IDПользователя = 10;

    Результат = OPI_Bitrix24.ПолучитьСписокСообщенийЧата(URL, IDПользователя, , 0, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСписокСообщенийЧата --url %url% --chat %chat% --last %last% --first %first% --token %token%

```

```json title="Результат"
{
 "result": {
  "chat_id": 10,
  "messages": [
   {
    "id": 3854,
    "chat_id": 10,
    "author_id": 10,
    "date": "2024-07-13T14:54:43+00:00",
    "text": "Записал",
    "unread": false,
    "uuid": "700d361d-8324-47fb-b989-647949c1c899",
    "replaces": [],
    "params": [],
    "disappearing_date": null
   },
   {
    "id": 4286,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-13T16:06:51+00:00",
    "text": "Текст сообщения",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": [],
    "disappearing_date": null
   },
   {
    "id": 4366,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-13T16:40:58+00:00",
    "text": "Message text",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": [],
    "disappearing_date": null
   },
   {
    "id": 4406,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-13T19:57:33+00:00",
    "text": "Это сообщение было удалено",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": {
     "IS_DELETED": "Y"
    },
    "disappearing_date": null
   },
   {
    "id": 4446,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-13T20:21:27+00:00",
    "text": "Текст сообщения",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": [],
    "disappearing_date": null
   },
   {
    "id": 4486,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-13T20:22:30+00:00",
    "text": "Это сообщение было удалено",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": {
     "IS_DELETED": "Y"
    },
    "disappearing_date": null
   },
   {
    "id": 4526,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-13T20:41:21+00:00",
    "text": "Это сообщение было удалено",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": {
     "IS_DELETED": "Y"
    },
    "disappearing_date": null
   },
   {
    "id": 4668,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:10:33+00:00",
    "text": "Это сообщение было удалено",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": {
     "IS_DELETED": "Y"
    },
    "disappearing_date": null
   },
   {
    "id": 4708,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:22:56+00:00",
    "text": "Это сообщение было удалено",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": {
     "IS_DELETED": "Y"
    },
    "disappearing_date": null
   },
   {
    "id": 4748,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:26:01+00:00",
    "text": "Это сообщение было удалено",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": {
     "IS_DELETED": "Y"
    },
    "disappearing_date": null
   },
   {
    "id": 4788,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:28:01+00:00",
    "text": "Это сообщение было удалено",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": {
     "IS_DELETED": "Y"
    },
    "disappearing_date": null
   },
...
```

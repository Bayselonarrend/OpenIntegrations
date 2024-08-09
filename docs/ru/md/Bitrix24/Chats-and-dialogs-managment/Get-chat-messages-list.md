---
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
  URL     = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
  IDЧата  = "chat4";
  
  Результат = OPI_Bitrix24.ПолучитьСписокСообщенийЧата(URL, IDЧата);
  
  URL            = "b24-ar17wx.bitrix24.by";
  Токен          = "fe3fa966006e9f06006b12e400000001000...";
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
   {
    "id": 4828,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:28:36+00:00",
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
    "id": 4868,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:30:18+00:00",
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
    "id": 4908,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:52:24+00:00",
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
    "id": 4948,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:53:31+00:00",
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
    "id": 4990,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:57:06+00:00",
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
    "id": 5060,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T08:59:43+00:00",
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
    "id": 5140,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T09:29:40+00:00",
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
    "id": 5182,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T09:35:56+00:00",
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
    "id": 5262,
    "chat_id": 10,
    "author_id": 1,
    "date": "2024-07-14T11:27:54+00:00",
    "text": "Это сообщение было удалено",
    "unread": false,
    "uuid": null,
    "replaces": [],
    "params": {
     "IS_DELETED": "Y"
    },
    "disappearing_date": null
   }
  ],
  "users": [
   {
    "id": 10,
    "active": true,
    "name": "Techno Pizza",
    "first_name": "Techno",
    "last_name": "Pizza",
    "work_position": null,
    "color": "#ab7761",
    "avatar": "",
    "gender": "M",
    "birthday": "",
    "extranet": false,
    "network": false,
    "bot": false,
    "connector": false,
    "external_auth_id": "socservices",
    "status": "online",
    "idle": false,
    "last_activity_date": "2024-07-13T18:36:23+00:00",
    "mobile_last_date": false,
    "absent": false,
    "departments": [
     1
    ],
    "phones": false,
    "desktop_last_date": false
   },
   {
    "id": 1,
    "active": true,
    "name": "Антон Титовец",
    "first_name": "Антон",
    "last_name": "Титовец",
    "work_position": null,
    "color": "#df532d",
    "avatar": "https://cdn-ru.bitrix24.by/b28528874/resize_cache/30/ff58db95aecdfa09ae61b51b5fd8f63f/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
    "gender": "M",
    "birthday": "",
    "extranet": false,
    "network": false,
    "bot": false,
    "connector": false,
    "external_auth_id": "socservices",
    "status": "online",
    "idle": false,
    "last_activity_date": "2024-07-14T09:00:58+00:00",
    "mobile_last_date": false,
    "absent": false,
    "departments": [
     1
    ],
    "phones": false,
    "desktop_last_date": false
   }
  ],
  "files": []
 },
 "time": {
  "start": 1720969156.38474,
  "finish": 1720969156.42064,
  "duration": 0.0358970165252686,
  "processing": 0.0108029842376709,
  "date_start": "2024-07-14T14:59:16+00:00",
  "date_finish": "2024-07-14T14:59:16+00:00",
  "operating_reset_at": 1720969756,
  "operating": 0
 }
}
```

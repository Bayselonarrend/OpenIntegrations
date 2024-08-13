---
sidebar_position: 15
---

# Получить список пользователей диалога
 Получает список участников далога



`Функция ПолучитьСписокПользователейДиалога(Знач URL, Знач IDЧата, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата (chatXXX) или пользователя (XXX) для диалога |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.dialog.users.list](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23800)
:::
<br/>


```bsl title="Пример кода"
  URL         = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
  IDЧата      = "chat" + "450";
  
  Результат = OPI_Bitrix24.ПолучитьСписокПользователейДиалога(URL, IDЧата);
  
  URL            = "b24-ar17wx.bitrix24.by";
  Токен          = "fe3fa966006e9f06006b12e400000001000...";
  IDПользователя = 10;
  
  Результат = OPI_Bitrix24.ПолучитьСписокПользователейДиалога(URL, IDПользователя, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСписокПользователейДиалога --url %url% --chat %chat% --token %token%

```

```json title="Результат"
{
 "result": [
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
   "bot_data": null
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
   "bot_data": null
  }
 ],
 "total": 2,
 "time": {
  "start": 1720969161.4388,
  "finish": 1720969161.46946,
  "duration": 0.0306570529937744,
  "processing": 0.00571608543395996,
  "date_start": "2024-07-14T14:59:21+00:00",
  "date_finish": "2024-07-14T14:59:21+00:00",
  "operating_reset_at": 1720969761,
  "operating": 0
 }
}
```

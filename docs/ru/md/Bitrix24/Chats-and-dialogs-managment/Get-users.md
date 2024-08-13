---
sidebar_position: 4
---

# Получить пользователей
 Получает информацию о пользователях для диалога



`Функция ПолучитьПользователей(Знач URL, Знач IDПользователей, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDПользователей | --users | Массив Из Строка, Число | ID пользователя или нескольких пользователей |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.user.list.get ](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11493)
:::
<br/>


```bsl title="Пример кода"
    URL                 = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    МассивПользователей = Новый Массив;

    МассивПользователей.Добавить(1);
    МассивПользователей.Добавить(10);

    Результат = OPI_Bitrix24.ПолучитьПользователей(URL, МассивПользователей);

    URL             = "b24-ar17wx.bitrix24.by";
    Токен           = "fe3fa966006e9f06006b12e400000001000...";
    IDПользователей = 10;

    Результат = OPI_Bitrix24.ПолучитьПользователей(URL, IDПользователей, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьПользователей --url %url% --users %users% --token %token%

```

```json title="Результат"
{
 "result": {
  "10": {
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
   "phones": false
  }
 },
 "time": {
  "start": 1722083796.56495,
  "finish": 1722083796.59641,
  "duration": 0.031451940536499,
  "processing": 0.00229191780090332,
  "date_start": "2024-07-27T12:36:36+00:00",
  "date_finish": "2024-07-27T12:36:36+00:00",
  "operating_reset_at": 1722084396,
  "operating": 0
 }
}
```

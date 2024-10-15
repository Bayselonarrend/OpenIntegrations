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
    URL                 = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    МассивПользователей = Новый Массив;

    МассивПользователей.Добавить(1);
    МассивПользователей.Добавить(10);

    Результат = OPI_Bitrix24.ПолучитьПользователей(URL, МассивПользователей);

    URL             = "b24-ar17wx.bitrix24.by";
    Токен           = "21750a67006e9f06006b12e400000001000...";
    IDПользователей = 10;

    Результат = OPI_Bitrix24.ПолучитьПользователей(URL, IDПользователей, Токен);
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
   "last_activity_date": "2024-07-13T21:36:23+03:00",
   "mobile_last_date": false,
   "absent": false,
   "departments": [
    1,
    264
   ],
   "phones": false
  }
 },
 "time": {
  "start": 1728409785.74518,
  "finish": 1728409785.77345,
  "duration": 0.0282700061798096,
  "processing": 0.0025789737701416,
  "date_start": "2024-10-08T20:49:45+03:00",
  "date_finish": "2024-10-08T20:49:45+03:00",
  "operating_reset_at": 1728410385,
  "operating": 0
 }
}
```

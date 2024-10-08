﻿---
sidebar_position: 6
---

# Отметить сообщение как прочитанное
 Отмечает выбранное сообщение и все сообщения до него как прочитанные



`Функция ОтметитьСообщениеКакПрочитанное(Знач URL, Знач IDЧата, Знач IDСообщения, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата (chatXXX) или пользователя (XXX) для диалога |
  | IDСообщения | --message | Строка, Число | ID последнего прочитанного сообщения |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.dialog.read](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12053)
:::
<br/>


```bsl title="Пример кода"
    URL         = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЧата      = "chat" + "872";
    IDСообщения = "15660";

    Результат = OPI_Bitrix24.ОтметитьСообщениеКакПрочитанное(URL, IDЧата, IDСообщения);

    URL            = "b24-ar17wx.bitrix24.by";
    Токен          = "37d1fe66006e9f06006b12e400000001000...";
    IDПользователя = 10;
    IDСообщения    = "15662";

    Результат = OPI_Bitrix24.ОтметитьСообщениеКакПрочитанное(URL, IDПользователя, IDСообщения, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ОтметитьСообщениеКакПрочитанное --url %url% --chat %chat% --message %message% --token %token%

```

```json title="Результат"
{
 "result": {
  "dialogId": 10,
  "chatId": 10,
  "lastId": 17538,
  "counter": 0
 },
 "time": {
  "start": 1728409841.01595,
  "finish": 1728409841.06124,
  "duration": 0.0452930927276611,
  "processing": 0.0184299945831299,
  "date_start": "2024-10-08T20:50:41+03:00",
  "date_finish": "2024-10-08T20:50:41+03:00",
  "operating_reset_at": 1728410441,
  "operating": 0
 }
}
```

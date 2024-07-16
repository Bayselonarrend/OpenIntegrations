﻿---
sidebar_position: 15
---

# Отправить уведомление о вводе
 Отправляет в чат статус Вам пишут...



`Функция ОтправитьУведомлениеОВводе(Знач URL, Знач IDЧата, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата (chatXXX) или пользователя (XXX) для диалога |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.dialog.writing](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23802)
:::
<br/>


```bsl title="Пример кода"
  URL         = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDЧата      = "chat" + "264";
  
  Результат = OPI_Bitrix24.ОтправитьУведомлениеОВводе(URL, IDЧата);
  
  
  URL            = "b24-ar17wx.bitrix24.by";
  Токен          = "adf89366006e9f06006b12e400000001000...";
  IDПользователя = 10;
  
  Результат = OPI_Bitrix24.ОтправитьУведомлениеОВводе(URL, IDПользователя, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ОтправитьУведомлениеОВводе --url %url% --chat %chat% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1720969162.6704,
  "finish": 1720969162.69719,
  "duration": 0.0267889499664307,
  "processing": 0.000684022903442383,
  "date_start": "2024-07-14T14:59:22+00:00",
  "date_finish": "2024-07-14T14:59:22+00:00",
  "operating_reset_at": 1720969762,
  "operating": 0
 }
}
```
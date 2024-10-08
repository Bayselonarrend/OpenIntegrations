﻿---
sidebar_position: 11
---

# Отключить уведомления чата
 Отключает уведомлений чата



`Функция ОтключитьУведомленияЧата(Знач URL, Знач IDЧата, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.chat.mute](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=11473)
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЧата  = "872";

    Результат = OPI_Bitrix24.ОтключитьУведомленияЧата(URL, IDЧата);

    URL            = "b24-ar17wx.bitrix24.by";
    Токен          = "37d1fe66006e9f06006b12e400000001000...";
    IDЧата         = "874";

    Результат = OPI_Bitrix24.ОтключитьУведомленияЧата(URL, IDЧата, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ОтключитьУведомленияЧата --url %url% --chat %chat% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1728409835.44261,
  "finish": 1728409835.48699,
  "duration": 0.0443859100341797,
  "processing": 0.0175070762634277,
  "date_start": "2024-10-08T20:50:35+03:00",
  "date_finish": "2024-10-08T20:50:35+03:00",
  "operating_reset_at": 1728410435,
  "operating": 0
 }
}
```

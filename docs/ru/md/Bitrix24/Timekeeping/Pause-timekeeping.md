﻿---
sidebar_position: 8
---

# Приостановить учет времени
 Приостанавливает учет времени пользователя



`Функция ПриостановитьУчетВремени(Знач URL, Знач IDПользователя = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDПользователя | --userid | Строка, Число | ID пользователя для учета. Текущий по умолчанию |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [timeman.pause](https://dev.1c-bitrix.ru/rest_help/timeman/base/timeman_pause.php)
:::
<br/>


```bsl title="Пример кода"
  URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.ПриостановитьУчетВремени(URL);
  
  Час = 3600;
  
  URL            = "b24-ar17wx.bitrix24.by";
  Токен          = "adf89366006e9f06006b12e400000001000...";
  IDПользователя = 1;
  
  Результат = OPI_Bitrix24.ПриостановитьУчетВремени(URL, IDПользователя);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПриостановитьУчетВремени --url %url% --userid %userid% --token %token%

```

```json title="Результат"
{
 "result": {
  "STATUS": "PAUSED",
  "TIME_START": "2024-07-30T07:10:51+00:00",
  "TIME_FINISH": "2024-07-30T08:32:00+00:00",
  "DURATION": "00:00:00",
  "TIME_LEAKS": "00:09:59",
  "ACTIVE": false,
  "IP_OPEN": "",
  "IP_CLOSE": "",
  "LAT_OPEN": 0,
  "LON_OPEN": 0,
  "LAT_CLOSE": 0,
  "LON_CLOSE": 0,
  "TZ_OFFSET": 10800
 },
 "time": {
  "start": 1722328320.91942,
  "finish": 1722328320.98461,
  "duration": 0.0651938915252686,
  "processing": 0.0352118015289307,
  "date_start": "2024-07-30T08:32:00+00:00",
  "date_finish": "2024-07-30T08:32:00+00:00",
  "operating_reset_at": 1722328920,
  "operating": 0
 }
}
```
﻿---
sidebar_position: 6
---

# Начать учет времени
 Начинает учет времени пользователя



`Функция НачатьУчетВремени(Знач URL, Знач IDПользователя = "", Знач Время = "", Знач Отчет = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDПользователя | --userid | Строка, Число | ID пользователя для учета. Текущий по умолчанию |
  | Время | --time | Дата | Время начала учета. Дата должна совпадать с текущей. Текущее время по ум. |
  | Отчет | --report | Строка | Причина изменения. Обязателен при указании Время и отключенном свободном графике |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [timeman.open](https://dev.1c-bitrix.ru/rest_help/timeman/base/timeman_open.php)
:::
<br/>


```bsl title="Пример кода"
  URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.НачатьУчетВремени(URL);
  
  Час = 3600;
  
  URL            = "b24-ar17wx.bitrix24.by";
  Токен          = "adf89366006e9f06006b12e400000001000...";
  IDПользователя = 1;
  Время          = OPI_Инструменты.ПолучитьТекущуюДату() - Час;
  Отчет          = "Опоздание";
  
  Результат = OPI_Bitrix24.НачатьУчетВремени(URL, IDПользователя, Время, Отчет, );
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 НачатьУчетВремени --url %url% --userid %userid% --time %time% --report %report% --token %token%

```

```json title="Результат"
{
 "result": {
  "STATUS": "OPENED",
  "TIME_START": "2024-07-30T07:10:51+00:00",
  "TIME_FINISH": null,
  "DURATION": "00:00:00",
  "TIME_LEAKS": "00:09:59",
  "ACTIVE": false,
  "IP_OPEN": "",
  "IP_CLOSE": "93.125.42.204",
  "LAT_OPEN": 0,
  "LON_OPEN": 0,
  "LAT_CLOSE": 0,
  "LON_CLOSE": 0,
  "TZ_OFFSET": 10800
 },
 "time": {
  "start": 1722328319.21856,
  "finish": 1722328319.25781,
  "duration": 0.0392520427703857,
  "processing": 0.014214038848877,
  "date_start": "2024-07-30T08:31:59+00:00",
  "date_finish": "2024-07-30T08:31:59+00:00",
  "operating_reset_at": 1722328919,
  "operating": 0.181692123413086
 }
}
```
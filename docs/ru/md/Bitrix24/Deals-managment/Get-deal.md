﻿---
sidebar_position: 3
---

# Получить сделку
 Получает сделку по ID



`Функция ПолучитьСделку(Знач URL, Знач IDСделки, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDСделки | --deal | Число,Строка | ID сделки |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrix24

<br/>

:::tip
Метод в документации API: [crm.deal.get](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_get.php)
:::
<br/>


```bsl title="Пример кода"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDСделки = "542";

    Результат = OPI_Bitrix24.ПолучитьСделку(URL, IDСделки);

    URL      = "b24-ar17wx.bitrix24.by";
    Токен    = "37d1fe66006e9f06006b12e400000001000...";
    IDСделки = "542";

    Результат = OPI_Bitrix24.ПолучитьСделку(URL, IDСделки, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСделку --url "b24-ar17wx.bitrix24.by" --deal %deal% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "64",
  "TITLE": "Плановая продажа",
  "TYPE_ID": "GOODS",
  "STAGE_ID": "NEW",
  "PROBABILITY": "30",
  "CURRENCY_ID": "USD",
  "OPPORTUNITY": "5000.00",
  "IS_MANUAL_OPPORTUNITY": "N",
  "TAX_VALUE": null,
  "LEAD_ID": null,
  "COMPANY_ID": "1",
  "CONTACT_ID": "3",
  "QUOTE_ID": null,
  "BEGINDATE": "2024-01-01T00:00:00+00:00",
  "CLOSEDATE": "2030-01-01T00:00:00+00:00",
  "ASSIGNED_BY_ID": "1",
  "CREATED_BY_ID": "1",
  "MODIFY_BY_ID": "1",
  "DATE_CREATE": "2024-08-25T10:01:53+00:00",
  "DATE_MODIFY": "2024-08-25T10:01:53+00:00",
  "OPENED": "Y",
  "CLOSED": "N",
  "COMMENTS": null,
  "ADDITIONAL_INFO": null,
  "LOCATION_ID": null,
  "CATEGORY_ID": "0",
  "STAGE_SEMANTIC_ID": "P",
  "IS_NEW": "Y",
  "IS_RECURRING": "N",
  "IS_RETURN_CUSTOMER": "N",
  "IS_REPEATED_APPROACH": "N",
  "SOURCE_ID": null,
  "SOURCE_DESCRIPTION": null,
  "ORIGINATOR_ID": null,
  "ORIGIN_ID": null,
  "MOVED_BY_ID": "1",
  "MOVED_TIME": "2024-08-25T10:01:53+00:00",
  "LAST_ACTIVITY_TIME": "2024-08-25T10:01:53+00:00",
  "UTM_SOURCE": null,
  "UTM_MEDIUM": null,
  "UTM_CAMPAIGN": null,
  "UTM_CONTENT": null,
  "UTM_TERM": null,
  "LAST_ACTIVITY_BY": "1"
 },
 "time": {
  "start": 1724580115.60249,
  "finish": 1724580115.6575,
  "duration": 0.0550057888031006,
  "processing": 0.0215010643005371,
  "date_start": "2024-08-25T10:01:55+00:00",
  "date_finish": "2024-08-25T10:01:55+00:00",
  "operating_reset_at": 1724580715,
  "operating": 0
 }
}
```

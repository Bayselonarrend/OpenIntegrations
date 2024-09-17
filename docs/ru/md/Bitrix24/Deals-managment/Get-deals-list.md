﻿---
sidebar_position: 4
---

# Получить список сделок
 Получает список сделок (50 шт. за запрос максимум) с фильтром или без (см. ПолучитьСтруктуруФильтраСделок)



`Функция ПолучитьСписокСделок(Знач URL, Знач Фильтр = "", Знач Отступ = 0, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Фильтр | --filter | Структура из КлючИЗначение | Структура отбора сделок (см. ПолучитьСтруктуруФильтраСделок) |
  | Отступ | --offset | Число, Строка | Отступ от начала списка для получения сделок > 50 шт. рекурсивно |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrix24

<br/>

:::tip
Метод в документации API: [crm.deal.list](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_list.php)
:::
<br/>


```bsl title="Пример кода"
    URL = ПараметрыФункции["Bitrix24_URL"];

    Результат = OPI_Bitrix24.ПолучитьСписокСделок(URL);

    URL    = ПараметрыФункции["Bitrix24_Domain"];
    Токен  = ПараметрыФункции["Bitrix24_Token"];

    Фильтр = Новый Структура;
    Фильтр.Вставить("TITLE"      , "Продажа в RUB");
    Фильтр.Вставить("CURRENCY_ID", "RUB");

    Результат = OPI_Bitrix24.ПолучитьСписокСделок(URL, Фильтр, , Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСписокСделок --url "b24-ar17wx.bitrix24.by" --filter %filter% --offset %offset% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": [
  {
   "ID": "52",
   "TITLE": "Продажа в RUB",
   "TYPE_ID": "GOODS",
   "STAGE_ID": "NEW",
   "PROBABILITY": "30",
   "CURRENCY_ID": "RUB",
   "OPPORTUNITY": "50000.00",
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
   "DATE_CREATE": "2024-08-25T08:26:58+00:00",
   "DATE_MODIFY": "2024-08-25T08:26:59+00:00",
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
   "MOVED_TIME": "2024-08-25T08:26:58+00:00",
   "LAST_ACTIVITY_TIME": "2024-08-25T08:26:58+00:00",
   "UTM_SOURCE": null,
   "UTM_MEDIUM": null,
   "UTM_CAMPAIGN": null,
   "UTM_CONTENT": null,
   "UTM_TERM": null,
   "LAST_ACTIVITY_BY": "1"
  }
 ],
 "total": 1,
 "time": {
  "start": 1724580119.407,
  "finish": 1724580119.45164,
  "duration": 0.0446369647979736,
  "processing": 0.0162379741668701,
  "date_start": "2024-08-25T10:01:59+00:00",
  "date_finish": "2024-08-25T10:01:59+00:00",
  "operating_reset_at": 1724580719,
  "operating": 0
 }
}
```

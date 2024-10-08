﻿---
sidebar_position: 2
---

# Получить цены товаров
 Получает цены товаров с фильтром или без



`Функция ПолучитьЦеныТоваров(Знач IDКлиента, Знач КлючAPI, Знач Фильтр = "", Знач IDПоследнего = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | Фильтр | --filter | Структура Из КлючИЗначение | Фильтр выборки товаров. См. ПолучитьСтруктуруФильтраТоваров |
  | IDПоследнего | --last | Строка, Число | ID последнего значения (last_id) из предыдущего запроса |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v4/product/info/prices](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoPricesV4)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента  = "2128753";
    КлючAPI    = "7cc90d26-33e4-499b...";

    Результат = OPI_Ozon.ПолучитьЦеныТоваров(IDКлиента, КлючAPI, Новый Структура);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьЦеныТоваров --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --filter %filter% --last %last%

```

```json title="Результат"
{
 "result": {
  "items": [
   {
    "product_id": 1156646653,
    "offer_id": "91132",
    "price": {
     "price": "1100.0000",
     "old_price": "1100.0000",
     "premium_price": "",
     "recommended_price": "",
     "retail_price": "0.0000",
     "vat": "0.100000",
     "min_ozon_price": "",
     "marketing_price": "",
     "marketing_seller_price": "",
     "min_price": "0.0000",
     "currency_code": "RUB",
     "auto_action_enabled": false
    },
    "price_index": "0.00",
    "commissions": {
     "sales_percent": 0,
     "fbo_fulfillment_amount": 0,
     "fbo_direct_flow_trans_min_amount": 0,
     "fbo_direct_flow_trans_max_amount": 0,
     "fbo_deliv_to_customer_amount": 0,
     "fbo_return_flow_amount": 0,
     "fbo_return_flow_trans_min_amount": 0,
     "fbo_return_flow_trans_max_amount": 0,
     "fbs_first_mile_min_amount": 0,
     "fbs_first_mile_max_amount": 25,
     "fbs_direct_flow_trans_min_amount": 0,
     "fbs_direct_flow_trans_max_amount": 0,
     "fbs_deliv_to_customer_amount": 0,
     "fbs_return_flow_amount": 0,
     "fbs_return_flow_trans_min_amount": 0,
     "fbs_return_flow_trans_max_amount": 0,
     "sales_percent_fbo": 0,
     "sales_percent_fbs": 0
    },
    "marketing_actions": null,
    "volume_weight": 1.2,
    "price_indexes": {
     "price_index": "WITHOUT_INDEX",
     "external_index_data": {
      "minimal_price": "",
      "minimal_price_currency": "",
      "price_index_value": 0
     },
     "ozon_index_data": {
      "minimal_price": "",
      "minimal_price_currency": "",
      "price_index_value": 0
     },
     "self_marketplaces_index_data": {
      "minimal_price": "",
      "minimal_price_currency": "",
      "price_index_value": 0
     }
    },
    "acquiring": 0
   },
   {
    "product_id": 1179304145,
    "offer_id": "143210610",
    "price": {
     "price": "1300.0000",
     "old_price": "1400.0000",
     "premium_price": "",
     "recommended_price": "",
     "retail_price": "0.0000",
     "vat": "0.100000",
     "min_ozon_price": "",
     "marketing_price": "",
     "marketing_seller_price": "",
     "min_price": "1300.0000",
     "currency_code": "RUB",
     "auto_action_enabled": false
    },
    "price_index": "0.00",
    "commissions": {
     "sales_percent": 0,
     "fbo_fulfillment_amount": 0,
     "fbo_direct_flow_trans_min_amount": 0,
     "fbo_direct_flow_trans_max_amount": 0,
     "fbo_deliv_to_customer_amount": 0,
     "fbo_return_flow_amount": 0,
     "fbo_return_flow_trans_min_amount": 0,
     "fbo_return_flow_trans_max_amount": 0,
     "fbs_first_mile_min_amount": 0,
     "fbs_first_mile_max_amount": 25,
     "fbs_direct_flow_trans_min_amount": 0,
     "fbs_direct_flow_trans_max_amount": 0,
     "fbs_deliv_to_customer_amount": 0,
     "fbs_return_flow_amount": 0,
     "fbs_return_flow_trans_min_amount": 0,
     "fbs_return_flow_trans_max_amount": 0,
     "sales_percent_fbo": 0,
     "sales_percent_fbs": 0
    },
    "marketing_actions": null,
    "volume_weight": 0.1,
    "price_indexes": {
     "price_index": "WITHOUT_INDEX",
     "external_index_data": {
      "minimal_price": "",
      "minimal_price_currency": "",
      "price_index_value": 0
     },
     "ozon_index_data": {
      "minimal_price": "",
      "minimal_price_currency": "",
      "price_index_value": 0
     },
     "self_marketplaces_index_data": {
      "minimal_price": "",
      "minimal_price_currency": "",
      "price_index_value": 0
     }
    },
    "acquiring": 0
   },
   {
    "product_id": 1179307106,
    "offer_id": "143210611",
    "price": {
     "price": "1300.0000",
     "old_price": "1300.0000",
     "premium_price": "",
     "recommended_price": "",
     "retail_price": "0.0000",
     "vat": "0.100000",
     "min_ozon_price": "",
     "marketing_price": "",
     "marketing_seller_price": "",
     "min_price": "0.0000",
     "currency_code": "RUB",
     "auto_action_enabled": false
    },
    "price_index": "0.00",
    "commissions": {
     "sales_percent": 0,
     "fbo_fulfillment_amount": 0,
     "fbo_direct_flow_trans_min_amount": 0,
     "fbo_direct_flow_trans_max_amount": 0,
     "fbo_deliv_to_customer_amount": 0,
     "fbo_return_flow_amount": 0,
     "fbo_return_flow_trans_min_amount": 0,
     "fbo_return_flow_trans_max_amount": 0,
...
```

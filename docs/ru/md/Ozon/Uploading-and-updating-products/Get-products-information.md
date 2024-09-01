---
sidebar_position: 3
---

# Получить информацию о товарах
 Получает информацию о товарах по массиву идентификаторов



`Функция ПолучитьИнформациюОТоварах(Знач IDКлиента, Знач КлючAPI, Знач IDТоваров = 0, Знач SKU = 0, Знач Артикулы = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDТоваров | --productid | Число, Массив Из Число | Идентификаторы товаров |
  | SKU | --sku | Число, Массив Из Число | Идентификаторы товаров в системе Ozon (SKU) |
  | Артикулы | --offerid | Строка, Массив Из Строка | Идентификаторы товаров в системе продавца (Артикул) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Уточняйте минимальную цену товара после применения всех акций в личном кабинете. Параметр min_price из ответа метода на доработке и возвращает 0

 Параметр active_product устарел, используйте значения параметра visible

 Параметры fbs_sku и fbo_sku из ответа метода были отключены 15 августа 2023 года

 В теле запроса должен быть один идентификатор или массив однотипных идентификаторов, в ответе будет массив items

 Метод в документации API: [post /v2/product/info/list](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoListV2)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента  = "2128753";
    КлючAPI    = "7cc90d26-33e4-499b...";
    Артикул    = "143210608";

    Результат = OPI_Ozon.ПолучитьИнформациюОТоварах(IDКлиента, КлючAPI, , , Артикул);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьИнформациюОТоварах --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid %productid% --sku %sku% --offerid %offerid%

```

```json title="Результат"
{
 "result": {
  "items": [
   {
    "id": 1111588191,
    "name": "Комплект защитных плёнок для X3 NFC. Темный хлопок",
    "offer_id": "143210608",
    "barcode": "",
    "buybox_price": "",
    "category_id": 0,
    "created_at": "2024-07-15T06:19:47.810185Z",
    "images": [
     "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"
    ],
    "marketing_price": "",
    "min_ozon_price": "",
    "old_price": "1100.0000",
    "premium_price": "",
    "price": "1000.0000",
    "recommended_price": "",
    "min_price": "",
    "sources": [],
    "stocks": {
     "coming": 0,
     "present": 0,
     "reserved": 0
    },
    "errors": [],
    "vat": "0.100000",
    "visible": false,
    "visibility_details": {
     "has_price": false,
     "has_stock": false,
     "active_product": false,
     "reasons": {}
    },
    "price_index": "0.00",
    "images360": [],
    "color_image": "",
    "primary_image": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
    "status": {
     "state": "unmatched",
     "state_failed": "",
     "moderate_status": "",
     "decline_reasons": [],
     "validation_state": "pending",
     "state_name": "Не продается",
     "state_description": "Создается",
     "is_failed": false,
     "is_created": false,
     "state_tooltip": "",
     "item_errors": [],
     "state_updated_at": "2024-08-27T18:37:29.341354Z"
    },
    "state": "",
    "service_type": "IS_CODE_SERVICE",
    "fbo_sku": 0,
    "fbs_sku": 0,
    "currency_code": "RUB",
    "is_kgt": false,
    "rating": "",
    "discounted_stocks": {
     "coming": 0,
     "present": 0,
     "reserved": 0
    },
    "is_discounted": false,
    "has_discounted_item": false,
    "barcodes": [],
    "updated_at": "2024-08-27T18:37:19.432674Z",
    "price_indexes": {
     "price_index": "WITHOUT_INDEX",
     "external_index_data": null,
     "ozon_index_data": null,
     "self_marketplaces_index_data": null
    },
    "sku": 0,
    "description_category_id": 17028922,
    "type_id": 95911,
    "is_archived": false,
    "is_autoarchived": false
   }
  ]
 }
}
```

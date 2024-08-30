---
sidebar_position: 2
---

# Get products informations
 Gets information about products by an array of identifiers



`Function GetProductsInformation(Val ClientID, Val APIKey, Val ProductsID = 0, Val SKU = 0, Val Articles = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductsID | --productid | Number, Array Of Number | Products identifier |
  | SKU | --sku | Number, Array Of Number | Products identifiers in the Ozon system (SKU) |
  | Articles | --offerid | String, Array of String | Item identifiers in the vendor's system (Article) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Specify the minimum price of the product after all promotions have been applied in your personal cabinet. The min_price parameter from the method response is being reworked and returns 0

 The active_product parameter is deprecated, use the values of the visible parameter

 The fbs_sku and fbo_sku parameters from the method response were disabled on August 15, 2023

 The body of the request must contain a single identifier or an array of identical identifiers, the response will be an array of items

 Method at API documentation: [post /v2/product/info/list](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoListV2)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    Article  = "143210608";

    Result = OPI_Ozon.GetProductsInformation(ClientID, APIKey, , , Article);
```



```sh title="CLI command example"
    
oint ozon GetProductsInformation --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid %productid% --sku %sku% --offerid %offerid%

```

```json title="Result"
{
 "result": {
  "items": [
   {
    "id": 1111588191,
    "name": "Protective film set for X3 NFC. Dark cotton",
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
     "state": "imported",
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
     "state_updated_at": "2024-08-27T19:20:08.365033Z"
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
    "updated_at": "2024-08-27T19:20:08.365033Z",
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

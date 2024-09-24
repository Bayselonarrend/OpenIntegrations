---
sidebar_position: 2
---

# Get products prices
 Gets products prices with or without filter



`Function GetProductsPrices(Val ClientID, Val APIKey, Val Filter = "", Val LastID = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | Filter | --filter | Structure of KeyAndValue | Product selection filter. See GetProductsFilterStructure |
  | LastID | --last | String, Number | ID of the last value (last_id) from the previous response |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v4/product/info/prices](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoPricesV4)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    Result = OPI_Ozon.GetProductsPrices(ClientID, APIKey, New Structure);
```



```sh title="CLI command example"
    
  oint ozon GetProductsPrices --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --filter %filter% --last %last%

```

```json title="Result"
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
   }
  ],
  "total": 1,
  "last_id": "WzExNTY2NDY2NTMsMTE1NjY0NjY1M10="
 }
}
```

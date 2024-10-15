---
sidebar_position: 5
---

# Update products prices
 Changes the price of one or more items



`Function UpdateProductsPrices(Val ClientID, Val APIKey, Val Prices) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | Prices | --prices | Array of Structure | Products prices. See GetProductPriceStructure |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/import/prices](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsPrices)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1218931806";

    Prices = New Structure;
    Prices.Insert("auto_action_enabled"   , "DISABLED");
    Prices.Insert("currency_code"         , "RUB");
    Prices.Insert("min_price"             , "1300");
    Prices.Insert("offer_id"              , "143210610");
    Prices.Insert("old_price"             , "1400");
    Prices.Insert("price"                 , "1300");
    Prices.Insert("price_strategy_enabled", "DISABLED");
    Prices.Insert("product_id"            , ProductID);

    Result = OPI_Ozon.UpdateProductsPrices(ClientID, APIKey, Prices);
```
 



```json title="Result"
{
 "result": [
  {
   "product_id": 1179304145,
   "offer_id": "143210610",
   "updated": true,
   "errors": []
  }
 ]
}
```

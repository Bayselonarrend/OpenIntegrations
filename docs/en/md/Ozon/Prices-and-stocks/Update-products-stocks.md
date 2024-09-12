﻿---
sidebar_position: 4
---

# Update products stocks
 Changes the information about the stock amount of a product



`Function UpdateProductsStocks(Val ClientID, Val APIKey, Val Stocks) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | Stocks | --stocks | Array of Structure | Array of stocks data. See GetProductStocksStructure |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
You can change availability for 100 products per request. You can send up to 80 requests per minute from one merchant account.

 You can only update the stock of an item in one warehouse once every 2 minutes. You can set the availability of a product only after its status changes to price_sent

 Stocks of bulky goods can only be renewed in the warehouses designated for them

 Method at API documentation: [post /v2/products/stocks](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductsStocksV2)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1111588191";

    Stocks = New Structure;
    Stocks.Insert("offer_id"    , "143210610");
    Stocks.Insert("product_id"  , ProductID);
    Stocks.Insert("stock"       , 20);
    Stocks.Insert("warehouse_id", 1);

    Result = OPI_Ozon.UpdateProductsStocks(ClientID, APIKey, Stocks);
```



```sh title="CLI command example"
    
  oint ozon UpdateProductsStocks --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --stocks %stocks%

```

```json title="Result"
{
 "result": [
  {
   "warehouse_id": 1,
   "product_id": 0,
   "offer_id": "143210610",
   "updated": false,
   "errors": [
    {
     "code": "WAREHOUSE_NOT_FOUND",
     "message": "warehouse has wrong id: 1"
    }
   ]
  }
 ]
}
```
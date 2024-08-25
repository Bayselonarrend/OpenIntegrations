---
sidebar_position: 2
---

# Get product information
 Gets product information by identifiers



`Function GetProductInformation(Val ClientID, Val APIKey, Val ProductID = 0, Val SKU = 0, Val Article = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductID | --productid | String, Number | Product identifier |
  | SKU | --sku | String, Number | Product identifier in the Ozon system (SKU) |
  | Article | --offerid | String, Number | Item identifier in the vendor's system (Article) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Specify the minimum price of the product after all promotions have been applied in your personal cabinet. The min_price parameter from the method response is being reworked and returns 0

 The active_product parameter is deprecated, use the values of the visible parameter

 The fbs_sku and fbo_sku parameters from the method response were disabled on August 15, 2023

 Method at API documentation: [post /v2/product/info](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoV2)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    Article  = "143210608";

    Result = OPI_Ozon.GetProductInformation(ClientID, APIKey, , , Article);
```



```sh title="CLI command example"
    
  oint ozon GetProductInformation --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid %productid% --sku %sku% --offerid %offerid%

```

```json title="Result"

```

﻿---
sidebar_position: 6
---

# Set product discount
 Sets the amount of discount on discounted products sold under the FBS scheme



`Function SetProductDiscount(Val ClientID, Val APIKey, Val ProductID, Val Discount) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductID | --productid | String, Number | Product identifier |
  | Discount | --discount | String, Number | Discount amount |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/update/discount](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUpdateDiscount)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = 1156646653;

    Discount = 10;

    Result = OPI_Ozon.SetProductDiscount(ClientID, APIKey, ProductID, Discount);
```



```sh title="CLI command example"
    
  oint ozon SetProductDiscount --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid %productid% --discount %discount%

```

```json title="Result"
{
 "code": 5,
 "message": "item discount not found",
 "details": []
}
```

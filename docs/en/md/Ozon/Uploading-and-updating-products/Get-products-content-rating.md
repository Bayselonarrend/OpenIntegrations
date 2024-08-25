---
sidebar_position: 4
---

# Get products content rating
 Gets products content rating by SKU



`Function GetProductsContentRating(Val ClientID, Val APIKey, Val SKU) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | SKU | --sku | String, Number, Array of String, Number | One or array of SKUs |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/rating-by-sku](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductRatingBySku)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    SKU      = 1626044001;

    Result = OPI_Ozon.GetProductsContentRating(ClientID, APIKey, SKU);
```



```sh title="CLI command example"
    
oint ozon GetProductsContentRating --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --sku %sku%

```

```json title="Result"

```

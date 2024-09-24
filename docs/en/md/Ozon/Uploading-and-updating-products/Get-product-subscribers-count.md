---
sidebar_position: 16
---

# Get product subscribers count
 Gets the number of users who clicked Know about arrival button on the product page



`Function GetProductSubscribersCount(Val ClientID, Val APIKey, Val SKU) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | SKU | --sku | Number, Array Of Number | Products identifiers in the Ozon system (SKU) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/info/subscription](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoSubscription)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    SKU      = 1626044001;

    Result = OPI_Ozon.GetProductSubscribersCount(ClientID, APIKey, SKU);
```



```sh title="CLI command example"
    
  oint ozon GetProductSubscribersCount --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --sku %sku%

```

```json title="Result"
{
 "result": [
  {
   "sku": 1626044001,
   "count": 0
  }
 ]
}
```

---
sidebar_position: 3
---

# Get discount information
 Retrieves discount and main product information by SKU of the discounted items



`Function GetDiscountInformation(Val ClientID, Val APIKey, Val SKU) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | SKU | --sku | Number, Array Of Number | SKU of discounted products |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/info/discounted](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoDiscounted)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    SKU      = 1626044001;

    Result = OPI_Ozon.GetDiscountInformation(ClientID, APIKey, SKU);
```



```sh title="CLI command example"
    
  oint ozon GetDiscountInformation --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --sku %sku%

```

```json title="Result"
{
 "items": []
}
```

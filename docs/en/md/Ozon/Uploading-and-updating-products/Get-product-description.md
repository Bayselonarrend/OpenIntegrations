---
sidebar_position: 3
---

# Get product description
 Get product description by IDs



`Function GetProductDescription(Val ClientID, Val APIKey, Val ProductID = 0, Val SKU = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductID | --productid | String, Number | Product identifier |
  | SKU | --offerid | String, Number | Item identifier in the vendor's system (Article) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/info/description](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoDescription)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    SKU      = "143210608";

    Result = OPI_Ozon.GetProductDescription(ClientID, APIKey, , SKU);
```



```sh title="CLI command example"
    
oint ozon GetProductDescription --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid %productid% --offerid %offerid%

```

```json title="Result"

```

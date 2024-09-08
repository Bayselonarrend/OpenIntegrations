---
sidebar_position: 17
---

# Get related SKUs
 Gets a single SKU from the old SKU FBS and SKU FBO identifiers



`Function GetRelatedSKUs(Val ClientID, Val APIKey, Val SKU) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | SKU | --sku | Number, Array Of Number | Products identifiers in the Ozon system (SKU) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
The response will contain all SKUs associated with the passed SKUs. The method can process any SKU, even hidden or deleted.

 Send up to 200 SKUs in a single request.

 Method at API documentation: [post /v1/product/related-sku/get](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductGetRelatedSKU)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    SKU      = 1626044001;

    Result = OPI_Ozon.GetRelatedSKUs(ClientID, APIKey, SKU);
```



```sh title="CLI command example"
    
oint ozon GetRelatedSKUs --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --sku %sku%

```

```json title="Result"

```

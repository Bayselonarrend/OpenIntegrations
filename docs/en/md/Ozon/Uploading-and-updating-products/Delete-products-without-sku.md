---
sidebar_position: 14
---

# Delete products without SKU
 Deletes products without SKU from archive



`Function DeleteProductsWithoutSKU(Val ClientID, Val APIKey, Val Articles) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | Articles | --articles | String, Number, Array of String, Number | Products articles |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
The product must be pre-archived (see ArchiveProducts)

 Up to 500 identifiers can be passed in one request

 Method at API documentation: [post /v2/products/delete](https://docs.ozon.ru/api/seller/#operation/ProductAPI_DeleteProducts)
:::
<br/>


```bsl title="Code example"
    OPI_Tools.Pause(30);

    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1111588191";

    Result = OPI_Ozon.ArchiveProducts(ClientID, APIKey, ProductID);

    Article = "143210608";

    Result = OPI_Ozon.DeleteProductsWithoutSKU(ClientID, APIKey, Article);
```



```sh title="CLI command example"
    
  oint ozon DeleteProductsWithoutSKU --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --articles %articles%

```

```json title="Result"
{
 "status": [
  {
   "offer_id": "143210608",
   "is_deleted": true,
   "error": ""
  }
 ]
}
```

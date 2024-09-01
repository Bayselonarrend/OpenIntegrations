---
sidebar_position: 11
---

# Check products images upload
 Check images upload by products IDs



`Function CheckProductsImagesUpload(Val ClientID, Val APIKey, Val ProductsID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductsID | --products | String, Number, Array of String, Number | Product IDs to be inspected |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/pictures/info](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductInfoPictures)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1111588191";

    Result = OPI_Ozon.CheckProductsImagesUpload(ClientID, APIKey, ProductID);
```



```sh title="CLI command example"
    
  oint ozon CheckProductsImagesUpload --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --products %products%

```

```json title="Result"
{
 "result": {
  "pictures": [
   {
    "product_id": 1111588191,
    "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
    "state": "imported",
    "is_primary": true,
    "is_360": false,
    "is_color": false
   },
   {
    "product_id": 1111588191,
    "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
    "state": "imported",
    "is_primary": false,
    "is_360": false,
    "is_color": false
   },
   {
    "product_id": 1111588191,
    "url": "GREEN",
    "state": "imported",
    "is_primary": false,
    "is_360": false,
    "is_color": true
   }
  ]
 }
}
```

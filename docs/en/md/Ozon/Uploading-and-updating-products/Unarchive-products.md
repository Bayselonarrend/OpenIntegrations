---
sidebar_position: 13
---

# Unarchive products
 Returns selected items from the archive



`Function UnarchiveProducts(Val ClientID, Val APIKey, Val ProductsID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductsID | --products | String, Number, Array of String, Number | Product IDs for recovery |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
You can restore from the archive no more than 10 products that were automatically archived per day. There are no restrictions on unarchiving products that were manually moved to the archive.

 Method at API documentation: [post /v1/product/unarchive](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUnarchive)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1218931806";

    Result = OPI_Ozon.UnarchiveProducts(ClientID, APIKey, ProductID);
```
 



```json title="Result"
{
 "result": true
}
```

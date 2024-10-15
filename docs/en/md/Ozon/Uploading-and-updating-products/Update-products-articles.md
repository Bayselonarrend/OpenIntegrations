---
sidebar_position: 11
---

# Update products articles
 Modifies articles of existing products



`Function UpdateProductsArticles(Val ClientID, Val APIKey, Val ArticlesMap) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ArticlesMap | --offers | Map Of KeyAndValue | Articles: Key > current, Value > new |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/update/offer-id](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUpdateOfferID)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210609", "143210612");

    Result = OPI_Ozon.UpdateProductsArticles(ClientID, APIKey, ArticlesMap);
```
 



```json title="Result"
{
 "errors": []
}
```

---
sidebar_position: 12
---

# Archive products
 Moves selected items to the archive



`Function ArchiveProducts(Val ClientID, Val APIKey, Val ProductsID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductsID | --products | String, Number, Array of String, Number | Product IDs for archiving |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
You can pass up to 100 identifiers at a time

 Method at API documentation: [post /v1/product/archive](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductArchive)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1111588191";

    Result = OPI_Ozon.ArchiveProducts(ClientID, APIKey, ProductID);
```



```sh title="CLI command example"
    
  oint ozon ArchiveProducts --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --products %products%

```

```json title="Result"
{
 "result": true
}
```

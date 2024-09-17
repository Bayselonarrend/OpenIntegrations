---
sidebar_position: 2
---

# Get available promo products
 Gets the products available in the selected promotion



`Function GetAvailablePromoProducts(Val ClientID, Val APIKey, Val PromoID, Val Indent = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | PromoID | --actionid | Number | Promo ID |
  | Indent | --offset | Number | Offst of items list |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/actions/candidates](https://docs.ozon.ru/api/seller/#operation/PromosCandidates)
:::
<br/>


```bsl title="Code example"
    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    PromoID  = 111111111;

    Result = OPI_Ozon.GetAvailablePromoProducts(ClientID, APIKey, PromoID);
```



```sh title="CLI command example"
    
  oint ozon GetAvailablePromoProducts --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --actionid %actionid% --offset %offset%

```

```json title="Result"
{
 "code": 5,
 "message": "Resource not found",
 "details": []
}
```

---
sidebar_position: 1
---

# Get promotions list
 Gets a list of available promotions



`Function GetPromotionsList(Val ClientID, Val APIKey) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/actions](https://docs.ozon.ru/api/seller/#operation/Promos)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    Result = OPI_Ozon.GetPromotionsList(ClientID, APIKey);
```
 



```json title="Result"
{
 "result": []
}
```

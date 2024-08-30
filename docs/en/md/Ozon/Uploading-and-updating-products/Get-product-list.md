---
sidebar_position: 1
---

# Get product list
 Gets a list of products with or without filter



`Function GetProductList(Val ClientID, Val APIKey, Val Filter = "", Val LastID = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | Filter | --filter | Structure of KeyAndValue | Product selection filter. See GetProductsFilterStructure |
  | LastID | --last | String, Number | ID of the last value (last_id) from the previous response |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v2/product/list](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductList)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    IDArray = New Array;
    IDArray.Add("143210608");

    Filter = New Structure;
    Filter.Insert("visibility" , "ALL");
    Filter.Insert("offer_id"   , IDArray);

    Result = OPI_Ozon.GetProductList(ClientID, APIKey, Filter);
```



```sh title="CLI command example"
    
  oint ozon GetProductList --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --filter %filter% --last %last%

```

```json title="Result"
{
 "result": {
  "items": [
   {
    "product_id": 1111588191,
    "offer_id": "143210608",
    "is_fbo_visible": false,
    "is_fbs_visible": false,
    "archived": false,
    "is_discounted": false
   }
  ],
  "total": 1,
  "last_id": "WzExMTE1ODgxOTEsMTExMTU4ODE5MV0="
 }
}
```

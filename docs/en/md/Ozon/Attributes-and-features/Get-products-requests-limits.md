﻿---
sidebar_position: 5
---

# Get products requests limits
 Get requests limits for products managment methods



`Function GetProductsRequestsLimits(Val ClientID, Val APIKey) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v4/product/info/limit](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetUploadQuota)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    Result = OPI_Ozon.GetProductsRequestsLimits(ClientID, APIKey);
```



```sh title="CLI command example"
    
  oint ozon GetProductsRequestsLimits --clientid "2128753" --apikey "7cc90d26-33e4-499b..."

```

```json title="Result"
{
 "daily_create": {
  "usage": 3,
  "limit": 1500,
  "reset_at": "2024-10-08T00:00:00Z"
 },
 "daily_update": {
  "usage": 9,
  "limit": 5000,
  "reset_at": "2024-10-08T00:00:00Z"
 },
 "total": {
  "usage": 4,
  "limit": 20000
 }
}
```

---
sidebar_position: 1
---

# Get warehouses list
 Gets compnay warehouses list



`Function GetWarehousesList(Val ClientID, Val APIKey) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/warehouse/list](https://docs.ozon.ru/api/seller/#operation/WarehouseAPI_WarehouseList)
:::
<br/>


```bsl title="Code example"
    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Result = OPI_Ozon.GetWarehousesList(ClientID, APIKey);
```



```sh title="CLI command example"
    
  oint ozon GetWarehousesList --clientid "2128753" --apikey "7cc90d26-33e4-499b..."

```

```json title="Result"
{
 "result": []
}
```

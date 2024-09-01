---
sidebar_position: 2
---

# Get products attributes data
 Retrieves product attributes descriptions with or without filtering



`Function GetProductsAttributesData(Val ClientID, Val APIKey, Val Filter = "", Val LastID = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | Filter | --filter | Structure of KeyAndValue | Product selection filter. See GetProductsFilterStructure |
  | LastID | --last | String, Number | ID of the last value (last_id) from the previous response |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v3/products/info/attributes](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductAttributesV3)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    IDArray = New Array;
    IDArray.Add("143210608");

    Filter = New Structure;
    Filter.Insert("visibility", "ALL");
    Filter.Insert("offer_id"  , IDArray);

    Result = OPI_Ozon.GetProductsAttributesData(ClientID, APIKey, Filter);
```



```sh title="CLI command example"
    
oint ozon GetProductsAttributesData --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --filter %filter% --last %last%

```

```json title="Result"

```

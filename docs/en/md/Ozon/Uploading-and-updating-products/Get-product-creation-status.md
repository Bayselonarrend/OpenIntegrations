﻿---
sidebar_position: 18
---

# Get product creation status
 Gets the status of adding a new product by task ID



`Function GetProductCreationStatus(Val ClientID, Val APIKey, Val TaskID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | TaskID | --taskid | String, Number | Add product task ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/import/info](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetImportProductsInfo)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    TaskID   = "1331622743";

    Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);
```



```sh title="CLI command example"
    
  oint ozon GetProductCreationStatus --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --taskid %taskid%

```

```json title="Result"
{
 "result": {
  "items": [
   {
    "offer_id": "143210609",
    "product_id": 1215763512,
    "status": "imported",
    "errors": [
     {
      "code": "SELLER_NO_CONTRACT_FAILED",
      "field": "",
      "attribute_id": 0,
      "state": "unmatched",
      "level": "error",
      "description": "Истек срок договора. Чтобы загрузить товар, возобновите договор в личном кабинете.",
      "optional_description_elements": {},
      "attribute_name": "",
      "message": "Истек срок договора. Чтобы загрузить товар, возобновите договор в личном кабинете."
     }
    ]
   }
  ],
  "total": 1
 }
}
```

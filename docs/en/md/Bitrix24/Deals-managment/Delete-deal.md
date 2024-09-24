﻿---
sidebar_position: 2
---

# Delete deal
 Deletes deal by ID



`Function DeleteDeal(Val URL, Val DealID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | DealID | --deal | Number, String | Deal ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.deal.delete](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_delete.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    DealID = "80";

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "b529cb66006e9f06006b12e400000001000...";
    DealID = "82";

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteDeal --url "b24-ar17wx.bitrix24.by" --deal %deal% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1724584048.03319,
  "finish": 1724584048.14273,
  "duration": 0.109539985656738,
  "processing": 0.0796740055084228,
  "date_start": "2024-08-25T11:07:28+00:00",
  "date_finish": "2024-08-25T11:07:28+00:00",
  "operating_reset_at": 1724584648,
  "operating": 0
 }
}
```

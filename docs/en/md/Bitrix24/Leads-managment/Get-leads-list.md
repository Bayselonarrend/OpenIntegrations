﻿---
sidebar_position: 4
---

# Get leads list
 Gets a list of leads (50 per request max) with or without filtering (see GetLeadFilterStructure)



`Function GetLeadsList(Val URL, Val Filter = "", Val Indent = 0, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Filter | --filter | Structure of KeyAndValue | Lead filter structure (see GetLeadFilterStructure) |
  | Indent | --offset | Number, String | Offset from the beginning of the list to get leads > 50 recursively |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.lead.list](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_list.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetLeadsList(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ae42e966006e9f06006b12e400000001000...";

    Filter = New Structure;
    Filter.Insert("TITLE"    , "MegaClient");
    Filter.Insert("HAS_EMAIL", "Y");

    Result = OPI_Bitrix24.GetLeadsList(URL, Filter, , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetLeadsList --url "b24-ar17wx.bitrix24.by" --filter %filter% --offset %offset% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [],
 "total": 0,
 "time": {
  "start": 1724490192.37401,
  "finish": 1724490192.41267,
  "duration": 0.0386598110198975,
  "processing": 0.0151891708374023,
  "date_start": "2024-08-24T09:03:12+00:00",
  "date_finish": "2024-08-24T09:03:12+00:00",
  "operating_reset_at": 1724490792,
  "operating": 0
 }
}
```

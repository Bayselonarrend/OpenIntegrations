﻿---
sidebar_position: 2
---

# Delete lead
 Deletes a lead by ID



`Function DeleteLead(Val URL, Val LeadID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | LeadID | --lead | Number, String | Lead ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.lead.delete](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_delete.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    LeadID = "278";

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    LeadID = "280";

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteLead --url "b24-ar17wx.bitrix24.by" --lead %lead% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454943.26955,
  "finish": 1728454943.58409,
  "duration": 0.314532041549683,
  "processing": 0.281855821609497,
  "date_start": "2024-10-09T09:22:23+03:00",
  "date_finish": "2024-10-09T09:22:23+03:00",
  "operating_reset_at": 1728455543,
  "operating": 0.281836032867432
 }
}
```

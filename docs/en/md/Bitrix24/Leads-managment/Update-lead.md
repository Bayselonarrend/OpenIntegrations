---
sidebar_position: 5
---

# Update lead
 Modifies an existing lead



`Function UpdateLead(Val URL, Val LeadID, Val FieldsStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | LeadID | --lead | Number, String | Lead ID |
  | FieldsStructure | --fields | Structure of KeyAndValue | Structure of lead fields |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.lead.update](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_update.php)
:::
<br/>


```bsl title="Code example"
    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Lermontov st., b. 20");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Belarus");
    FieldsStructure.Insert("TITLE"          , "SuperClient");

    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    LeadID = "24";

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure);

    FieldsStructure.Insert("NAME"      , "Evgeniy");
    FieldsStructure.Insert("LAST_NAME" , "Evgeniev");

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "6476c766006e9f06006b12e400000001000...";
    LeadID = "26";

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateLead --url "b24-ar17wx.bitrix24.by" --lead %lead% --fields %fields% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1724490198.00253,
  "finish": 1724490198.16141,
  "duration": 0.158878087997437,
  "processing": 0.13422703742981,
  "date_start": "2024-08-24T09:03:18+00:00",
  "date_finish": "2024-08-24T09:03:18+00:00",
  "operating_reset_at": 1724490798,
  "operating": 0.134207010269165
 }
}
```

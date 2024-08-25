---
sidebar_position: 3
---

# Get lead
 Gets a lead by ID



`Function GetLead(Val URL, Val LeadID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | LeadID | --lead | Number, String | Lead ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.lead.get](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_get.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    LeadID = "24";

    Result = OPI_Bitrix24.GetLead(URL, LeadID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "6476c766006e9f06006b12e400000001000...";
    LeadID = "26";

    Result = OPI_Bitrix24.GetLead(URL, LeadID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetLead --url "b24-ar17wx.bitrix24.by" --lead %lead% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "34",
  "TITLE": "MegaClient",
  "HONORIFIC": null,
  "NAME": "Ivan",
  "SECOND_NAME": null,
  "LAST_NAME": "Ivanov",
  "COMPANY_TITLE": null,
  "COMPANY_ID": null,
  "CONTACT_ID": "34",
  "IS_RETURN_CUSTOMER": "N",
  "BIRTHDATE": "",
  "SOURCE_ID": null,
  "SOURCE_DESCRIPTION": null,
  "STATUS_ID": "CONVERTED",
  "STATUS_DESCRIPTION": null,
  "POST": null,
  "COMMENTS": null,
  "CURRENCY_ID": "BYN",
  "OPPORTUNITY": "0.00",
  "IS_MANUAL_OPPORTUNITY": "N",
  "HAS_PHONE": "Y",
  "HAS_EMAIL": "Y",
  "HAS_IMOL": "N",
  "ASSIGNED_BY_ID": "1",
  "CREATED_BY_ID": "1",
  "MODIFY_BY_ID": "1",
  "DATE_CREATE": "2024-08-24T09:03:15+00:00",
  "DATE_MODIFY": "2024-08-24T09:03:15+00:00",
  "DATE_CLOSED": "2024-08-24T09:03:15+00:00",
  "STATUS_SEMANTIC_ID": "S",
  "OPENED": "N",
  "ORIGINATOR_ID": null,
  "ORIGIN_ID": null,
  "MOVED_BY_ID": "1",
  "MOVED_TIME": "2024-08-24T09:03:15+00:00",
  "ADDRESS": "Pushkin st., b. 10",
  "ADDRESS_2": null,
  "ADDRESS_CITY": null,
  "ADDRESS_POSTAL_CODE": null,
  "ADDRESS_REGION": null,
  "ADDRESS_PROVINCE": null,
  "ADDRESS_COUNTRY": "Russia",
  "ADDRESS_COUNTRY_CODE": null,
  "ADDRESS_LOC_ADDR_ID": "66",
  "UTM_SOURCE": null,
  "UTM_MEDIUM": null,
  "UTM_CAMPAIGN": null,
  "UTM_CONTENT": null,
  "UTM_TERM": null,
  "LAST_ACTIVITY_BY": "1",
  "LAST_ACTIVITY_TIME": "2024-08-24T09:03:15+00:00",
  "EMAIL": [
   {
    "ID": "158",
    "VALUE_TYPE": "HOME",
    "VALUE": "yo@example.com",
    "TYPE_ID": "EMAIL"
   },
   {
    "ID": "160",
    "VALUE_TYPE": "WORK",
    "VALUE": "hi@example.com",
    "TYPE_ID": "EMAIL"
   }
  ],
  "PHONE": [
   {
    "ID": "162",
    "VALUE_TYPE": "WORK",
    "VALUE": "88005553535",
    "TYPE_ID": "PHONE"
   }
  ]
 },
 "time": {
  "start": 1724490196.80887,
  "finish": 1724490196.85079,
  "duration": 0.0419189929962158,
  "processing": 0.0176949501037598,
  "date_start": "2024-08-24T09:03:16+00:00",
  "date_finish": "2024-08-24T09:03:16+00:00",
  "operating_reset_at": 1724490796,
  "operating": 0
 }
}
```

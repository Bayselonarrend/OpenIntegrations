---
sidebar_position: 3
---

# Get deal
 Gets deal by ID



`Function GetDeal(Val URL, Val DealID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | DealID | --deal | Number, String | Deal ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.deal.get](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_get.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    DealID = "542";

    Result = OPI_Bitrix24.GetDeal(URL, DealID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    DealID = "542";

    Result = OPI_Bitrix24.GetDeal(URL, DealID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetDeal --url "b24-ar17wx.bitrix24.by" --deal %deal% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "748",
  "TITLE": "Planned sale",
  "TYPE_ID": "GOODS",
  "STAGE_ID": "NEW",
  "PROBABILITY": "30",
  "CURRENCY_ID": "USD",
  "OPPORTUNITY": "5000.00",
  "IS_MANUAL_OPPORTUNITY": "N",
  "TAX_VALUE": null,
  "LEAD_ID": null,
  "COMPANY_ID": "1",
  "CONTACT_ID": "3",
  "QUOTE_ID": null,
  "BEGINDATE": "2024-01-01T03:00:00+03:00",
  "CLOSEDATE": "2030-01-01T03:00:00+03:00",
  "ASSIGNED_BY_ID": "1",
  "CREATED_BY_ID": "1",
  "MODIFY_BY_ID": "1",
  "DATE_CREATE": "2024-10-07T22:27:35+03:00",
  "DATE_MODIFY": "2024-10-07T22:27:35+03:00",
  "OPENED": "Y",
  "CLOSED": "N",
  "COMMENTS": null,
  "ADDITIONAL_INFO": null,
  "LOCATION_ID": null,
  "CATEGORY_ID": "0",
  "STAGE_SEMANTIC_ID": "P",
  "IS_NEW": "Y",
  "IS_RECURRING": "N",
  "IS_RETURN_CUSTOMER": "N",
  "IS_REPEATED_APPROACH": "N",
  "SOURCE_ID": null,
  "SOURCE_DESCRIPTION": null,
  "ORIGINATOR_ID": null,
  "ORIGIN_ID": null,
  "MOVED_BY_ID": "1",
  "MOVED_TIME": "2024-10-07T22:27:35+03:00",
  "LAST_ACTIVITY_TIME": "2024-10-07T22:27:35+03:00",
  "UTM_SOURCE": null,
  "UTM_MEDIUM": null,
  "UTM_CAMPAIGN": null,
  "UTM_CONTENT": null,
  "UTM_TERM": null,
  "LAST_ACTIVITY_BY": "1"
 },
 "time": {
  "start": 1728329255.70948,
  "finish": 1728329255.76424,
  "duration": 0.054750919342041,
  "processing": 0.0240190029144287,
  "date_start": "2024-10-07T22:27:35+03:00",
  "date_finish": "2024-10-07T22:27:35+03:00",
  "operating_reset_at": 1728329855,
  "operating": 0
 }
}
```

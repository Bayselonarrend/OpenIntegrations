---
sidebar_position: 5
---

# Update deal
 Modifies an existing deal



`Function UpdateDeal(Val URL, Val DealID, Val FieldsStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | DealID | --deal | Number, String | Deal ID |
  | FieldsStructure | --fields | Structure of KeyAndValue | Deal fields structure |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.deal.update](https://https:
dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_update.php)
:::
<br/>


```bsl title="Code example"
    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"       , "Sale in RUB");
    FieldsStructure.Insert("CURRENCY_ID" , "RUB");
    FieldsStructure.Insert("OPPORTUNITY" , 50000);

    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    DealID = "";

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure);

    FieldsStructure.Insert("TITLE"    , "Future deal in RUB");
    FieldsStructure.Insert("BEGINDATE", "2025-01-01");

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "6476c766006e9f06006b12e400000001000...";
    DealID = "";

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateDeal --url "b24-ar17wx.bitrix24.by" --deal %deal% --fields %fields% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1724584046.54833,
  "finish": 1724584046.70114,
  "duration": 0.152806997299194,
  "processing": 0.124013900756836,
  "date_start": "2024-08-25T11:07:26+00:00",
  "date_finish": "2024-08-25T11:07:26+00:00",
  "operating_reset_at": 1724584646,
  "operating": 0.123990058898926
 }
}
```

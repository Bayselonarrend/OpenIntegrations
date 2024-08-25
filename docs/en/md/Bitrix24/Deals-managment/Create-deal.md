---
sidebar_position: 1
---

# Create deal
 Creates a new deal by field structure (see. GetDealStructure)



`Function CreateDeal(Val URL, Val FieldsStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FieldsStructure | --fields | Structure of KeyAndValue | Deal fields structure (see. GetDealStructure) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.deal.add](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_add.php)
:::
<br/>


```bsl title="Code example"
    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"         , "Planned sale");
    FieldsStructure.Insert("TYPE_ID"       , "GOODS");
    FieldsStructure.Insert("STAGE_ID"      , "NEW");
    FieldsStructure.Insert("COMPANY_ID"    , 1);
    FieldsStructure.Insert("CONTACT_ID"    , 3);
    FieldsStructure.Insert("OPENED"        , "Y");
    FieldsStructure.Insert("ASSIGNED_BY_ID", 1);
    FieldsStructure.Insert("PROBABILITY"   , 30);
    FieldsStructure.Insert("CURRENCY_ID"   , "USD");
    FieldsStructure.Insert("OPPORTUNITY"   , 5000);
    FieldsStructure.Insert("CATEGORY_ID"   , 5);
    FieldsStructure.Insert("BEGINDATE"     , "2024-01-01");
    FieldsStructure.Insert("CLOSEDATE"     , "2030-01-01");

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.CreateDeal(URL, FieldsStructure);

    FieldsStructure.Insert("TITLE"    , "Another deal");
    FieldsStructure.Insert("CLOSEDATE", "2031-01-01");

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "6476c766006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CreateDeal(URL, FieldsStructure, Token);
```



```sh title="CLI command example"
    
oint bitrix24 CreateDeal --url "b24-ar17wx.bitrix24.by" --fields %fields% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Result"

```

---
sidebar_position: 4
---

# Get deals list
 Gets the list of deals (50 pcs per query max) with or without filtering (see. GetDealsFilterStructure)



`Function GetDealsList(Val URL, Val Filter = "", Val Indent = 0, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Filter | --filter | Structure of KeyAndValue | Deals filter structure (see. GetDealsFilterStructure) |
  | Indent | --offset | Number, String | Offset from the beginning of the list to retrieve deals > 50 pcs recursively |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.deal.list](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_list.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetDealsList(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "6476c766006e9f06006b12e400000001000...";

    Filter = New Structure;
    Filter.Insert("TITLE"      , "Sale in RUB");
    Filter.Insert("CURRENCY_ID", "RUB");

    Result = OPI_Bitrix24.GetDealsList(URL, Filter, , Token);
```



```sh title="CLI command example"
    
oint bitrix24 GetDealsList --url "b24-ar17wx.bitrix24.by" --filter %filter% --offset %offset% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Result"

```

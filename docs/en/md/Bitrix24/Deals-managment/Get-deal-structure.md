---
sidebar_position: 6
---

# Get deal structure
 Gets a structure with field descriptions for creating a deal



`Function GetDealStructure(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.deal.fields](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_fields.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetDealStructure(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "6476c766006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetDealStructure(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetDealStructure --url "b24-ar17wx.bitrix24.by" --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Result"

```

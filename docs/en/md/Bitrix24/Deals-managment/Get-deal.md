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
    DealID = "";

    Result = OPI_Bitrix24.GetDeal(URL, DealID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "6476c766006e9f06006b12e400000001000...";
    DealID = "";

    Result = OPI_Bitrix24.GetDeal(URL, DealID, Token);
```



```sh title="CLI command example"
    
oint bitrix24 GetDeal --url "b24-ar17wx.bitrix24.by" --deal %deal% --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Result"

```

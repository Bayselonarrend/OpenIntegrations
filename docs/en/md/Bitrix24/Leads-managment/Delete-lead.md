---
sidebar_position: 2
---

# Delete lead
 Deletes a lead by ID



`Function DeleteLead(Val URL, Val LeadID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | LeadID | --lead | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.lead.delete](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_delete.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    LeadID = "24";

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "6476c766006e9f06006b12e400000001000...";
    LeadID = "26";

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteLead --url "b24-ar17wx.bitrix24.by" --lead %lead% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Result"

```

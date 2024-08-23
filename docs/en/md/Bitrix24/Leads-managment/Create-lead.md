---
sidebar_position: 1
---

# Create lead
 Creates a new lead by fields structure (see GetLeadStructure)



`Function CreateLead(Val URL, Val FieldsStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FieldsStructure | --fields | Structure of KeyAndValue | Lead fields structure (see GetLeadStructure) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.lead.add](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_add.php)
:::
<br/>


```bsl title="Code example"
    EmailsArray = New Array;
    EmailsArray.Add(New Structure("VALUE,VALUE_TYPE", "yo@example.com", "HOME"));
    EmailsArray.Add(New Structure("VALUE,VALUE_TYPE", "hi@example.com", "WORK"));

    PhonesArray = New Array;
    PhonesArray.Add(New Structure("VALUE,VALUE_TYPE", "88005553535", "WORK"));

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Pushkin st., b. 10");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Russia");
    FieldsStructure.Insert("EMAIL"          , EmailsArray);
    FieldsStructure.Insert("NAME"           , "John");
    FieldsStructure.Insert("LAST_NAME"      , "Doe");
    FieldsStructure.Insert("PHONE"          , PhonesArray);
    FieldsStructure.Insert("TITLE"          , "MegaClient");

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.CreateLead(URL, FieldsStructure);

    FieldsStructure.Insert("NAME"      , "Ivan");
    FieldsStructure.Insert("LAST_NAME" , "Ivanov");

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CreateLead(URL, FieldsStructure, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateLead --url "b24-ar17wx.bitrix24.by" --fields %fields% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Result"

```

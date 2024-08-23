---
sidebar_position: 3
---

# Create user
 Create new user by fields structure



`Function CreateUser(Val URL, Val FieldsStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FieldsStructure | --fields | Structure of KeyAndValue | New user data. See. GetUserFieldsStructure |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [user.add](https://dev.1c-bitrix.ru/rest_help/users/user_add.php)

 If you want to add an extranet user, you must pass in the fields: EXTRANET: Y and SONET_GROUP_ID: [...]

 If you want to add an intranet user, you must pass UF_DEPARTMENT field: [...]
:::
<br/>


```bsl title="Code example"
    URL   = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    Email = String(New UUID) + "@exepmple.org";
    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Result = OPI_Bitrix24.CreateUser(URL, UserStructure);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "6476c766006e9f06006b12e400000001000...";
    Email = String(New UUID) + "@exepmple.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"          , Email);
    UserStructure.Insert("NAME"           , "Vitaly");
    UserStructure.Insert("LAST_NAME"      , "Alpaca");
    UserStructure.Insert("PERSONAL_MOBILE", "88003553535");
    UserStructure.Insert("UF_DEPARTMENT"  , 1);

    Result = OPI_Bitrix24.CreateUser(URL, UserStructure, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateUser --url "b24-ar17wx.bitrix24.by" --fields %fields% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": 60,
  "time": {
  "start": 1722328388.80414,
  "finish": 1722328391.95472,
  "duration": 3.15058398246765,
  "processing": 3.02733707427978,
  "date_start": "2024-07-30T08:33:08+00:00",
  "date_finish": "2024-07-30T08:33:11+00:00",
  "operating_reset_at": 1722328988,
  "operating": 3.0273129940033
  }
  }
```

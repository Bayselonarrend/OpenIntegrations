---
sidebar_position: 6
---

# Find users
 Gets the list of users according to the specified filter



`Function FindUsers(Val URL, Val FilterStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FilterStructure | --filter | Structure of KeyAndValue | Filter. See GetUserFilterStructure |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [user.update](https://dev.1c-bitrix.ru/rest_help/users/user_update.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    FilterStructure = New Structure;
    FilterStructure.Insert("NAME"              , "Vitaly");
    FilterStructure.Insert("LAST_NAME"         , "Alpaca");
    FilterStructure.Insert("WORK_POSITION"     , "DevOps engineer");
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Marketing department");
    FilterStructure.Insert("USER_TYPE"         , "employee");

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    FilterStructure = New Structure;
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Bitrix");

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 FindUsers --url "b24-ar17wx.bitrix24.by" --filter %filter% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [],
 "time": {
  "start": 1728140868.04758,
  "finish": 1728140868.09157,
  "duration": 0.0439901351928711,
  "processing": 0.0122928619384766,
  "date_start": "2024-10-05T18:07:48+03:00",
  "date_finish": "2024-10-05T18:07:48+03:00",
  "operating_reset_at": 1728141468,
  "operating": 0
 }
}
```

﻿---
sidebar_position: 4
---

# Update user
 Updates user data



`Function UpdateUser(Val URL, Val UserID, Val FieldsStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | UserID | --userid | String, Number | User ID |
  | FieldsStructure | --fields | Structure of KeyAndValue | New user data. See. GetUserFieldsStructure |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [user.update](https://dev.1c-bitrix.ru/rest_help/users/user_update.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    UserID = "490";
    Email  = String(New UUID) + "@exepmple.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 1);

    Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    UserID = "492";
    Email  = String(New UUID) + "@exepmple.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"         , Email);
    UserStructure.Insert("NAME"          , "Oleg");
    UserStructure.Insert("LAST_NAME"     , "Lama");
    UserStructure.Insert("UF_DEPARTMENT" , 7);

    Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateUser --url "b24-ar17wx.bitrix24.by" --userid "80" --fields %fields% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728329246.23775,
  "finish": 1728329246.52825,
  "duration": 0.290501117706299,
  "processing": 0.259449005126953,
  "date_start": "2024-10-07T22:27:26+03:00",
  "date_finish": "2024-10-07T22:27:26+03:00",
  "operating_reset_at": 1728329846,
  "operating": 0.259423017501831
 }
}
```

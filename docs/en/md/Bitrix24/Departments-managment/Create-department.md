﻿---
sidebar_position: 1
---

# Create department
 Creates a new department



`Function CreateDepartment(Val URL, Val Name, Val ParentID = "", Val HeadID = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Name | --title | String | Department name |
  | ParentID | --parentid | String, Number | ID of parent department |
  | HeadID | --headid | String, Number | ID of department manager |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [department.add](https://dev.1c-bitrix.ru/rest_help/departments/department_add.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Name     = "Main department";
    ParentID = 1;

    Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Name     = "Subordinate department";
    ParentID = "478";
    HeadID   = 1;

    Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID, HeadID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateDepartment --url "b24-ar17wx.bitrix24.by" --title "Subordinate department" --parentid "68" --headid "1" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 594,
 "time": {
  "start": 1728454927.08955,
  "finish": 1728454927.30747,
  "duration": 0.217915773391724,
  "processing": 0.186015844345093,
  "date_start": "2024-10-09T09:22:07+03:00",
  "date_finish": "2024-10-09T09:22:07+03:00",
  "operating_reset_at": 1728455527,
  "operating": 0.18598484992981
 }
}
```

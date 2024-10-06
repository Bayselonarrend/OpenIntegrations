---
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
 "result": 562,
 "time": {
  "start": 1728140861.60253,
  "finish": 1728140861.73135,
  "duration": 0.128818988800049,
  "processing": 0.101286888122559,
  "date_start": "2024-10-05T18:07:41+03:00",
  "date_finish": "2024-10-05T18:07:41+03:00",
  "operating_reset_at": 1728141461,
  "operating": 0.101263999938965
 }
}
```

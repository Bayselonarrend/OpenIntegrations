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
 "result": 582,
 "time": {
  "start": 1728329238.51336,
  "finish": 1728329238.63965,
  "duration": 0.126287937164307,
  "processing": 0.0988650321960449,
  "date_start": "2024-10-07T22:27:18+03:00",
  "date_finish": "2024-10-07T22:27:18+03:00",
  "operating_reset_at": 1728329838,
  "operating": 0
 }
}
```

---
sidebar_position: 2
---

# Update department
 Update an existing department



`Function UpdateDepartment(Val URL, Val DepartmentID, Val Name = "", Val ParentID = "", Val HeadID = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | DepartmentID | --depid | String, Number | Department ID |
  | Name | --title | String | Department name |
  | ParentID | --parentid | String, Number | ID of parent department |
  | HeadID | --headid | String, Number | ID of department manager |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [department.update](https://dev.1c-bitrix.ru/rest_help/departments/department_update.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    DepartmentID = "478";
    ParentID     = 7;

    Result = OPI_Bitrix24.UpdateDepartment(URL, DepartmentID, , ParentID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    DepartmentID = "480";
    Name         = "New department";
    ParentID     = 1;
    HeadID       = 10;

    Result = OPI_Bitrix24.UpdateDepartment(URL
        , DepartmentID
        , Name
        , ParentID
        , HeadID
        , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateDepartment --url "b24-ar17wx.bitrix24.by" --depid "70" --title %title% --parentid "1" --headid "10" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728140862.1516,
  "finish": 1728140862.30485,
  "duration": 0.153247117996216,
  "processing": 0.126879930496216,
  "date_start": "2024-10-05T18:07:42+03:00",
  "date_finish": "2024-10-05T18:07:42+03:00",
  "operating_reset_at": 1728141462,
  "operating": 0.126857995986938
 }
}
```

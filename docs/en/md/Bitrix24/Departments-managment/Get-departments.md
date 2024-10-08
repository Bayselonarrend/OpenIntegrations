﻿---
sidebar_position: 3
---

# Get departments
 Gets a list of departments by ID or filter



`Function GetDepartments(Val URL, Val DepartmentID = "", Val Name = "", Val ParentID = "", Val HeadID = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | DepartmentID | --depid | String, Number | Selection by department ID |
  | Name | --title | String | Filter by name |
  | ParentID | --parentid | String, Number | Filter by parent ID |
  | HeadID | --headid | String, Number | Filter by manager ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [department.get](https://dev.1c-bitrix.ru/rest_help/departments/department_get.php)
:::
<br/>


```bsl title="Code example"
    URL          = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    DepartmentID = "480";

    Result = OPI_Bitrix24.GetDepartments(URL, DepartmentID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    HeadID = 1;

    Result = OPI_Bitrix24.GetDepartments(URL, , , , HeadID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetDepartments --url "b24-ar17wx.bitrix24.by" --depid "70" --title %title% --parentid %parentid% --headid "1" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "ID": "594",
   "NAME": "Subordinate department",
   "SORT": 500,
   "PARENT": "592",
   "UF_HEAD": "1"
  }
 ],
 "total": 1,
 "time": {
  "start": 1728454927.4735,
  "finish": 1728454927.50699,
  "duration": 0.0334928035736084,
  "processing": 0.00784516334533691,
  "date_start": "2024-10-09T09:22:07+03:00",
  "date_finish": "2024-10-09T09:22:07+03:00",
  "operating_reset_at": 1728455527,
  "operating": 0
 }
}
```

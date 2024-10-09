﻿---
sidebar_position: 4
---

# Delete department
 Delets department by ID



`Function DeleteDepartment(Val URL, Val DepartmentID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | DepartmentID | --depid | String, Number | Department ID for deletion |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [department.delete](https://dev.1c-bitrix.ru/rest_help/departments/department_delete.php)
:::
<br/>


```bsl title="Code example"
    URL          = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    DepartmentID = "480";

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID);

    URL          = "b24-ar17wx.bitrix24.by";
    Token        = "37d1fe66006e9f06006b12e400000001000...";
    DepartmentID = "478";

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteDepartment --url "b24-ar17wx.bitrix24.by" --depid "68" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454928.30262,
  "finish": 1728454928.41098,
  "duration": 0.108357906341553,
  "processing": 0.0806529521942139,
  "date_start": "2024-10-09T09:22:08+03:00",
  "date_finish": "2024-10-09T09:22:08+03:00",
  "operating_reset_at": 1728455528,
  "operating": 0
 }
}
```

---
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
    DepartmentID = "198";

    Result = OPI_Bitrix24.GetDepartments(URL, DepartmentID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "ec4dc366006e9f06006b12e400000001000...";
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
  "ID": "42",
  "NAME": "Subordinate department",
  "SORT": 500,
  "PARENT": "40",
  "UF_HEAD": "1"
  }
  ],
  "total": 1,
  "time": {
  "start": 1722171478.80371,
  "finish": 1722171478.83794,
  "duration": 0.034229040145874,
  "processing": 0.00419092178344727,
  "date_start": "2024-07-28T12:57:58+00:00",
  "date_finish": "2024-07-28T12:57:58+00:00",
  "operating_reset_at": 1722172078,
  "operating": 0
  }
  }
```

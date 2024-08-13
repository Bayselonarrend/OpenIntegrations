---
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
    URL          = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    DepartmentID = "70";

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID);

    URL          = "b24-ar17wx.bitrix24.by";
    Token        = "fe3fa966006e9f06006b12e400000001000...";
    DepartmentID = "68";

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteDepartment --url "b24-ar17wx.bitrix24.by" --depid "68" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1722171482.56495,
  "finish": 1722171482.65313,
  "duration": 0.0881810188293457,
  "processing": 0.0624208450317383,
  "date_start": "2024-07-28T12:58:02+00:00",
  "date_finish": "2024-07-28T12:58:02+00:00",
  "operating_reset_at": 1722172082,
  "operating": 0
  }
  }
```

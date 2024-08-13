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
  URL = FunctionParameters["Bitrix24_URL"];
  
  Name     = "Main department";
  ParentID = 1;
  
  Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID);
  
  OPI_TestDataRetrieval.WriteLog(Result, "CreateDepartment (wh)", "Bitrix24");
  
  URL   = FunctionParameters["Bitrix24_Domain"];
  Token = FunctionParameters["Bitrix24_Token"];
  
  Name     = "Subordinate department";
  ParentID = FunctionParameters["Bitrix24_HookDepID"];
  HeadID   = 1;
  
  Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID, HeadID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateDepartment --url "b24-ar17wx.bitrix24.by" --title "Subordinate department" --parentid "68" --headid "1" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": 42,
  "time": {
  "start": 1722171476.78229,
  "finish": 1722171477.19809,
  "duration": 0.415800094604492,
  "processing": 0.389212131500244,
  "date_start": "2024-07-28T12:57:56+00:00",
  "date_finish": "2024-07-28T12:57:57+00:00",
  "operating_reset_at": 1722172076,
  "operating": 0.389190912246704
  }
  }
```

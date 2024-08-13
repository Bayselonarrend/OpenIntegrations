---
sidebar_position: 5
---

# Change user status
 Activates or deactivates (fire) the selected user



`Function ChangeUserStatus(Val URL, Val UserID, Val Fire = True, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | UserID | --userid | String, Number | User ID |
  | Fire | --fire | Boolean | True > Deactivation, False > Activation |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>




```bsl title="Code example"
  URL    = FunctionParameters["Bitrix24_URL"];
  UserID = FunctionParameters["Bitrix24_HookUserID"];
  
  Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True);
  
  OPI_TestDataRetrieval.WriteLog(Result, "ChangeUserStatus (wh)", "Bitrix24");
  
  URL    = FunctionParameters["Bitrix24_Domain"];
  Token  = FunctionParameters["Bitrix24_Token"];
  UserID = FunctionParameters["Bitrix24_UserID"];
  
  Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ChangeUserStatus --url "b24-ar17wx.bitrix24.by" --userid "80" --fire %fire% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1722328399.68494,
  "finish": 1722328399.94913,
  "duration": 0.264194965362549,
  "processing": 0.229634046554565,
  "date_start": "2024-07-30T08:33:19+00:00",
  "date_finish": "2024-07-30T08:33:19+00:00",
  "operating_reset_at": 1722328999,
  "operating": 0.5396409034729
  }
  }
```

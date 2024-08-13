---
sidebar_position: 2
---

# Get user
 Gets user information by ID



`Function GetUser(Val URL, Val UserID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | UserID | --userid | String, Number | User ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [user.get](https://dev.1c-bitrix.ru/rest_help/users/user_get.php)
:::
<br/>


```bsl title="Code example"
  URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
  UserID = "78";
  
  Result = OPI_Bitrix24.GetUser(URL, UserID);
  
  URL    = "b24-ar17wx.bitrix24.by";
  Token  = "fe3fa966006e9f06006b12e400000001000...";
  UserID = "80";
  
  Result = OPI_Bitrix24.GetUser(URL, UserID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetUser --url "b24-ar17wx.bitrix24.by" --userid "80" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": [
  {
  "ID": "60",
  "XML_ID": "56731232",
  "ACTIVE": true,
  "NAME": "Oleg",
  "LAST_NAME": "Lama",
  "EMAIL": "804d1dbb-7df4-4245-8266-938fc2541978@exepmple.org",
  "LAST_LOGIN": "",
  "DATE_REGISTER": "2024-07-30T00:00:00+00:00",
  "IS_ONLINE": "N",
  "TIMESTAMP_X": {},
  "PERSONAL_GENDER": "",
  "PERSONAL_BIRTHDAY": "",
  "PERSONAL_MOBILE": "88003553535",
  "UF_EMPLOYMENT_DATE": "",
  "UF_DEPARTMENT": [
  7
  ],
  "USER_TYPE": "employee"
  }
  ],
  "total": 1,
  "time": {
  "start": 1722328397.72079,
  "finish": 1722328397.76914,
  "duration": 0.0483510494232178,
  "processing": 0.0120601654052734,
  "date_start": "2024-07-30T08:33:17+00:00",
  "date_finish": "2024-07-30T08:33:17+00:00",
  "operating_reset_at": 1722328997,
  "operating": 0
  }
  }
```

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
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    UserID = "490";

    Result = OPI_Bitrix24.GetUser(URL, UserID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    UserID = "492";

    Result = OPI_Bitrix24.GetUser(URL, UserID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetUser --url "b24-ar17wx.bitrix24.by" --userid "80" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "ID": "594",
   "XML_ID": "57951448",
   "ACTIVE": true,
   "NAME": "Oleg",
   "LAST_NAME": "Lama",
   "EMAIL": "584b160c-03dc-4548-a898-282d95334643@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-10-07T03:00:00+03:00",
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
  "start": 1728329246.66912,
  "finish": 1728329246.70401,
  "duration": 0.0348868370056152,
  "processing": 0.00925803184509277,
  "date_start": "2024-10-07T22:27:26+03:00",
  "date_finish": "2024-10-07T22:27:26+03:00",
  "operating_reset_at": 1728329846,
  "operating": 0
 }
}
```

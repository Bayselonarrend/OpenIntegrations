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
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    UserID = "624";

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "21750a67006e9f06006b12e400000001000...";
    UserID = "626";

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True, Token);
```
 



```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454937.15091,
  "finish": 1728454937.42878,
  "duration": 0.277868986129761,
  "processing": 0.252010822296143,
  "date_start": "2024-10-09T09:22:17+03:00",
  "date_finish": "2024-10-09T09:22:17+03:00",
  "operating_reset_at": 1728455537,
  "operating": 0.53964114189148
 }
}
```

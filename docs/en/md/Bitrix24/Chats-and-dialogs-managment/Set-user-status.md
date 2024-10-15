---
sidebar_position: 18
---

# Set user status
 Sets the status (online) of the current user



`Function SetUserStatus(Val URL, Val Status, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Status | --status | String, Number | Status value: online, dnd, away |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.user.status.set](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11499)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    Status = "dnd";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "21750a67006e9f06006b12e400000001000...";
    Status = "away";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status, Token);
```
 



```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454841.60883,
  "finish": 1728454841.64357,
  "duration": 0.0347371101379394,
  "processing": 0.00739097595214844,
  "date_start": "2024-10-09T09:20:41+03:00",
  "date_finish": "2024-10-09T09:20:41+03:00",
  "operating_reset_at": 1728455441,
  "operating": 0
 }
}
```

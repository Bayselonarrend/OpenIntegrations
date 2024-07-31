---
sidebar_position: 18
---

# Set user status
 Sets the status (online) of the current user



`Function SetUserStatus(Val URL, Val Status, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Status | --status | String, Number | Status value: online, dnd, away |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.user.status.set](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11499)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 Status = "dnd";
 
 Result = OPI_Bitrix24.SetUserStatus(URL, Status);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 Status = "away";
 
 Result = OPI_Bitrix24.SetUserStatus(URL, Status, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 SetUserStatus --url %url% --status %status% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1722083795.3692,
 "finish": 1722083795.39818,
 "duration": 0.0289750099182129,
 "processing": 0.00522208213806152,
 "date_start": "2024-07-27T12:36:35+00:00",
 "date_finish": "2024-07-27T12:36:35+00:00",
 "operating_reset_at": 1722084395,
 "operating": 0
 }
}
```

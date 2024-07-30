---
sidebar_position: 9
---

# Get timekeeping status
 Gets user timekeeping status



`Function GetTimekeepingStatus(Val URL, Val UserID = "", Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | UserID | --userid | String, Number | Users ID. Current by default |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [timeman.status](https://dev.1c-bitrix.ru/rest_help/timeman/base/timeman_status.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.GetTimekeepingStatus(URL);
 
 Hour = 3600;
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 UserID = 1;
 
 Result = OPI_Bitrix24.GetTimekeepingStatus(URL, UserID);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetTimekeepingStatus --url %url% --userid %userid% --token %token%

```

```json title="Result"
{
 "result": {
 "STATUS": "PAUSED",
 "TIME_START": "2024-07-30T07:10:51+00:00",
 "TIME_FINISH": "2024-07-30T08:32:00+00:00",
 "DURATION": "00:00:00",
 "TIME_LEAKS": "00:09:59",
 "ACTIVE": false,
 "IP_OPEN": "",
 "IP_CLOSE": "",
 "LAT_OPEN": 0,
 "LON_OPEN": 0,
 "LAT_CLOSE": 0,
 "LON_CLOSE": 0,
 "TZ_OFFSET": 10800
 },
 "time": {
 "start": 1722328322.65261,
 "finish": 1722328322.6837,
 "duration": 0.0310959815979004,
 "processing": 0.00899505615234375,
 "date_start": "2024-07-30T08:32:02+00:00",
 "date_finish": "2024-07-30T08:32:02+00:00",
 "operating_reset_at": 1722328922,
 "operating": 0
 }
}
```

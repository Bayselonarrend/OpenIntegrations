---
sidebar_position: 7
---

# Stop timekeeping
 Stops user timekeeping



`Function StopTimekeeping(Val URL, Val UserID = "", Val Time = "", Val Report = "", Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | UserID | --userid | String, Number | Users ID. Current by default |
 | Time | --time | Date | Stop time. The date must match the current. Current time by default. |
 | Report | --report | String | Reason for change. Required when Time is specified and free schedule is disabled |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [timeman.close](https://dev.1c-bitrix.ru/rest_help/timeman/base/timeman_close.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
 
 Result = OPI_Bitrix24.StopTimekeeping(URL);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 UserID = 1;
 Time = OPI_Tools.GetCurrentDate();
 Report = "Time off";
 
 Result = OPI_Bitrix24.StopTimekeeping(URL, UserID, Time, Report, );
```
	


```sh title="CLI command example"
 
 oint bitrix24 StopTimekeeping --url %url% --userid %userid% --time %time% --report %report% --token %token%

```

```json title="Result"
{
 "error": "WRONG_DATETIME_FORMAT",
 "error_description": "Wrong datetime format"
}
```

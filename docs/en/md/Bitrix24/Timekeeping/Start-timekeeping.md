---
sidebar_position: 6
---

# Start timekeeping
 Starts user timekeeping



`Function StartTimekeeping(Val URL, Val UserID = "", Val Time = "", Val Report = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | UserID | --userid | String, Number | Users ID. Current by default |
  | Time | --time | Date | Start time. The date must match the current. Current time by default. |
  | Report | --report | String | Reason for change. Required when Time is specified and free schedule is disabled |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [timeman.open](https://dev.1c-bitrix.ru/rest_help/timeman/base/timeman_open.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.StartTimekeeping(URL);

    Hour = 3600;

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "6476c766006e9f06006b12e400000001000...";
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate() - Hour;
    Report = "Late";

    Result = OPI_Bitrix24.StartTimekeeping(URL, UserID, Time, Report, );
```



```sh title="CLI command example"
    
  oint bitrix24 StartTimekeeping --url "b24-ar17wx.bitrix24.by" --userid "1" --time %time% --report "Late" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "STATUS": "OPENED",
  "TIME_START": "2024-07-30T07:10:51+00:00",
  "TIME_FINISH": null,
  "DURATION": "00:00:00",
  "TIME_LEAKS": "00:09:59",
  "ACTIVE": false,
  "IP_OPEN": "",
  "IP_CLOSE": "93.125.42.204",
  "LAT_OPEN": 0,
  "LON_OPEN": 0,
  "LAT_CLOSE": 0,
  "LON_CLOSE": 0,
  "TZ_OFFSET": 10800
  },
  "time": {
  "start": 1722328319.21856,
  "finish": 1722328319.25781,
  "duration": 0.0392520427703857,
  "processing": 0.014214038848877,
  "date_start": "2024-07-30T08:31:59+00:00",
  "date_finish": "2024-07-30T08:31:59+00:00",
  "operating_reset_at": 1722328919,
  "operating": 0.181692123413086
  }
  }
```

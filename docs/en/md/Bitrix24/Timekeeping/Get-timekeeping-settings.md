---
sidebar_position: 10
---

# Get timekeeping settings
 Gets user timekeeping settings



`Function GetTimekeepingSettings(Val URL, Val UserID = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | UserID | --userid | String, Number | Users ID. Current by default |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [timeman.settings](https://dev.1c-bitrix.ru/rest_help/timeman/base/timeman_settings.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";

    Result = OPI_Bitrix24.GetTimekeepingSettings(URL);

    Hour = 3600;

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";
    UserID = 1;

    Result = OPI_Bitrix24.GetTimekeepingSettings(URL, UserID);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTimekeepingSettings --url "b24-ar17wx.bitrix24.by" --userid "1" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
  {
  "result": {
  "UF_TIMEMAN": true,
  "UF_TM_FREE": false,
  "UF_TM_MAX_START": "09:15:00",
  "UF_TM_MIN_FINISH": "17:45:00",
  "UF_TM_MIN_DURATION": "08:00:00",
  "UF_TM_ALLOWED_DELTA": "00:15:00",
  "ADMIN": true
  },
  "time": {
  "start": 1722332243.86487,
  "finish": 1722332243.88732,
  "duration": 0.0224521160125732,
  "processing": 0.00417494773864746,
  "date_start": "2024-07-30T09:37:23+00:00",
  "date_finish": "2024-07-30T09:37:23+00:00",
  "operating_reset_at": 1722332843,
  "operating": 0
  }
  }

```

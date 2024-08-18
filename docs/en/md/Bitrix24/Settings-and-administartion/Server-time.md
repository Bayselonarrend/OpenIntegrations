---
sidebar_position: 4
---

# Server time
 Get current server time



`Function ServerTime(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [server_time](https://dev.1c-bitrix.ru/rest_help/general/server_time.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";

    Result = OPI_Bitrix24.ServerTime(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "c03fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.ServerTime(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ServerTime --url "b24-ar17wx.bitrix24.by" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": "2024-06-13T18:40:54+00:00",
  "time": {
  "start": 1718304054.57877,
  "finish": 1718304054.71748,
  "duration": 0.138707876205444,
  "processing": 0.0000510215759277344,
  "date_start": "2024-06-13T18:40:54+00:00",
  "date_finish": "2024-06-13T18:40:54+00:00",
  "operating_reset_at": 1718304654,
  "operating": 0
  }
  }
```

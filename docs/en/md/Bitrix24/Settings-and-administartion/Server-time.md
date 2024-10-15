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
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.ServerTime(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "21750a67006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.ServerTime(URL, Token);
```
 



```json title="Result"
{
 "result": "2024-10-09T09:19:10+03:00",
 "time": {
  "start": 1728454749.92311,
  "finish": 1728454750.26845,
  "duration": 0.345338821411133,
  "processing": 0.0000450611114501953,
  "date_start": "2024-10-09T09:19:09+03:00",
  "date_finish": "2024-10-09T09:19:10+03:00",
  "operating_reset_at": 1728455350,
  "operating": 0
 }
}
```

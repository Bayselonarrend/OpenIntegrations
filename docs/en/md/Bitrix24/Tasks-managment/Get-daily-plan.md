﻿---
sidebar_position: 25
---

# Get users daily tasks plan
 Gets the task plan for the current users day



`Function GetDailyPlan(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.planner.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/planner/getlist.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetDailyPlan(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetDailyPlan(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetDailyPlan --url "b24-ar17wx.bitrix24.by" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [],
 "time": {
  "start": 1728454787.66892,
  "finish": 1728454787.69815,
  "duration": 0.0292289257049561,
  "processing": 0.000327110290527344,
  "date_start": "2024-10-09T09:19:47+03:00",
  "date_finish": "2024-10-09T09:19:47+03:00",
  "operating_reset_at": 1728455387,
  "operating": 0
 }
}
```

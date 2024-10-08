﻿---
sidebar_position: 4
---

# Get task time accounting
 Get time accounting record data



`Function GetTaskTimeAccounting(Val URL, Val TaskID, Val RecordID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | String, Number | Task ID |
  | RecordID | --record | String, Number | Time record ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.elapseditem.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/get.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID   = "2112";
    RecordID = "714";

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID);

    URL      = "b24-ar17wx.bitrix24.by";
    Token    = "37d1fe66006e9f06006b12e400000001000...";
    RecordID = "716";

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTaskTimeAccounting --url "b24-ar17wx.bitrix24.by" --task "1088" --record "308" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "830",
  "TASK_ID": "2404",
  "USER_ID": "10",
  "COMMENT_TEXT": "Time spent on work",
  "SECONDS": "7200",
  "MINUTES": "120",
  "SOURCE": "2",
  "CREATED_DATE": "2024-09-09T09:20:37+03:00",
  "DATE_START": "2024-10-09T09:20:37+03:00",
  "DATE_STOP": "2024-10-09T09:20:37+03:00"
 },
 "time": {
  "start": 1728454837.65834,
  "finish": 1728454837.70708,
  "duration": 0.0487430095672607,
  "processing": 0.0207769870758057,
  "date_start": "2024-10-09T09:20:37+03:00",
  "date_finish": "2024-10-09T09:20:37+03:00",
  "operating_reset_at": 1728455437,
  "operating": 0
 }
}
```

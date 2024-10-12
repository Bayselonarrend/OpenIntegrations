﻿---
sidebar_position: 1
---

# Add task time accounting
 Adds information about the user's time spent to the task



`Function AddTaskTimeAccounting(Val URL, Val TaskID, Val Time, Val UserID = "", Val Text = "", Val SetupDate = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | String, Number | ID of task for time accounting |
  | Time | --amount | String, Number | Time spent in seconds |
  | UserID | --user | String, Number | ID of user for time accounting |
  | Text | --text | String | Comment text |
  | SetupDate | --date | String | Date the record was set |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.elapseditem.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/add.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2454";

    Time = 3600;

    Result = OPI_Bitrix24.AddTaskTimeAccounting(URL, TaskID, Time);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "21750a67006e9f06006b12e400000001000...";

    Text      = "Time spent on work";
    UserID    = 10;
    Time      = 7200;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Result = OPI_Bitrix24.AddTaskTimeAccounting(URL
        , TaskID
        , Time
        , UserID
        , Text
        , SetupDate
        , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddTaskTimeAccounting --url "b24-ar17wx.bitrix24.by" --task "1088" --amount "7200" --user "10" --text "Time spent on work" --date %date% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 830,
 "time": {
  "start": 1728454837.39657,
  "finish": 1728454837.48745,
  "duration": 0.0908730030059814,
  "processing": 0.0576651096343994,
  "date_start": "2024-10-09T09:20:37+03:00",
  "date_finish": "2024-10-09T09:20:37+03:00",
  "operating_reset_at": 1728455437,
  "operating": 0
 }
}
```

﻿---
sidebar_position: 5
---

# Move task to kanban stage
 Move task to another kanban stage



`Function MoveTaskToKanbanStage(Val URL, Val TaskID, Val StageID, Val Prev = 0, Val After = 0, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | String, Number | ID of task to move |
  | StageID | --stage | String, Number | Stage ID |
  | Prev | --before | String, Number | ID of the task to put the selected one in front of (if After not filled) |
  | After | --after | String, Number | ID of the task to be followed by the selected (if Prev not filled) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.stages.movetask](https://dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_movetask.php)
:::
<br/>


```bsl title="Code example"
    TaskID  = "2110";
    StageID = "730";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID);

    StageID = "732";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID, , , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 MoveTaskToKanbanStage --url "b24-ar17wx.bitrix24.by" --task "1086" --stage "320" --before %before% --after %after% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454833.97698,
  "finish": 1728454834.02471,
  "duration": 0.047731876373291,
  "processing": 0.0173599720001221,
  "date_start": "2024-10-09T09:20:33+03:00",
  "date_finish": "2024-10-09T09:20:34+03:00",
  "operating_reset_at": 1728455434,
  "operating": 0
 }
}
```

---
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
    TaskID  = "1090";
    StageID = "322";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID);

    StageID = "324";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "c03fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID, , , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 MoveTaskToKanbanStage --url "b24-ar17wx.bitrix24.by" --task "1086" --stage "320" --before %before% --after %after% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720600364.06058,
  "finish": 1720600364.11507,
  "duration": 0.0544910430908203,
  "processing": 0.0175719261169434,
  "date_start": "2024-07-10T08:32:44+00:00",
  "date_finish": "2024-07-10T08:32:44+00:00",
  "operating_reset_at": 1720600964,
  "operating": 0
  }
  }
```

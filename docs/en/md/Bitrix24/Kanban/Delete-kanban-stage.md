---
sidebar_position: 3
---

# ID of the stage to be deleted
 Removes a kanban (My Plan) stage, provided there are no tasks in it



`Function DeleteKanbanStage(Val URL, Val StageID, Val AsAdmin = False, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | StageID | --stage | String, Number | ID of stage to dele |
  | AsAdmin | --admin | Boolean | Allows you to add stages without checking permissions (for administrators) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.stages.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_delete.php)
:::
<br/>


```bsl title="Code example"
    StageID = "322";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, True);

    StageID = "324";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "c03fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteKanbanStage --url "b24-ar17wx.bitrix24.by" --stage "320" --admin %admin% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720600367.83205,
  "finish": 1720600367.8709,
  "duration": 0.0388522148132324,
  "processing": 0.0057981014251709,
  "date_start": "2024-07-10T08:32:47+00:00",
  "date_finish": "2024-07-10T08:32:47+00:00",
  "operating_reset_at": 1720600967,
  "operating": 0
  }
  }
```

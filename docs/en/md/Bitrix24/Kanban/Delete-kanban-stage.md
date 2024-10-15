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
    StageID = "864";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, True);

    StageID = "866";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "21750a67006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, , Token);
```
 



```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454834.86052,
  "finish": 1728454834.90096,
  "duration": 0.0404388904571533,
  "processing": 0.00777482986450195,
  "date_start": "2024-10-09T09:20:34+03:00",
  "date_finish": "2024-10-09T09:20:34+03:00",
  "operating_reset_at": 1728455434,
  "operating": 0
 }
}
```

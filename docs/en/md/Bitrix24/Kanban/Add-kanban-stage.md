---
sidebar_position: 1
---

# Add kanban stage
 Add new stage of kanban or My Plan



`Function AddKanbanStage(Val URL, Val Name, Val Color = "FFD800", Val PrevStageID = 0, Val EntityID = 0, Val AsAdmin = False, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Name | --title | String | New stage name |
  | Color | --color | String | HEX of new stage color |
  | PrevStageID | --prevstage | String, Number | ID of the stage after which a new stage should be inserted (at the beginning by default.) |
  | EntityID | --entityid | String, Number | ID of kanban owner (group or user) |
  | AsAdmin | --admin | Boolean | Allows you to add stages without checking permissions (for administrators) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.stages.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_add.php)
:::
<br/>


```bsl title="Code example"
  Name  = "New stage";
  Color = "0026FF";
  
  URL = FunctionParameters["Bitrix24_URL"];
  
  Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, 6);
  
  OPI_TestDataRetrieval.WriteLog(Result, "AddKanbanStage (wh)", "Bitrix24");
  
  PrevStageID = Result["result"];
  
  Name  = "New stage 2";
  Color = "0026FF";
  
  URL   = FunctionParameters["Bitrix24_Domain"];
  Token = FunctionParameters["Bitrix24_Token"];
  
  Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, PrevStageID, , True, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddKanbanStage --url "b24-ar17wx.bitrix24.by" --title %title% --color "0026FF" --prevstage "Result[result]" --entityid %entityid% --admin %admin% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": 132,
  "time": {
  "start": 1720600360.58899,
  "finish": 1720600360.679,
  "duration": 0.0900149345397949,
  "processing": 0.0587739944458008,
  "date_start": "2024-07-10T08:32:40+00:00",
  "date_finish": "2024-07-10T08:32:40+00:00",
  "operating_reset_at": 1720600960,
  "operating": 0
  }
  }
```

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

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, 6);

    PrevStageID = Result["result"];

    Name  = "New stage 2";
    Color = "0026FF";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, PrevStageID, , True, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddKanbanStage --url "b24-ar17wx.bitrix24.by" --title %title% --color "0026FF" --prevstage "Result[result]" --entityid %entityid% --admin %admin% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 834,
 "time": {
  "start": 1728329145.79764,
  "finish": 1728329145.86448,
  "duration": 0.066845178604126,
  "processing": 0.0373330116271973,
  "date_start": "2024-10-07T22:25:45+03:00",
  "date_finish": "2024-10-07T22:25:45+03:00",
  "operating_reset_at": 1728329745,
  "operating": 0
 }
}
```

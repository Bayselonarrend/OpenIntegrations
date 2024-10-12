﻿---
sidebar_position: 2
---

# Change kanban stage
 Changes the properties of the existing kanban or My plan stage



`Function UpdateKanbansStage(Val URL, Val Name, Val StageID, Val Color = "", Val PrevStageID = 0, Val AsAdmin = False, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Name | --title | String | New stages name |
  | StageID | --stage | String, Number | Stage ID for change |
  | Color | --color | String | HEX of new stage color |
  | PrevStageID | --prevstage | String, Number | Stage ID, after which the selected stage should be inserted |
  | AsAdmin | --admin | Boolean | Allows you to add stages without checking permissions (for administrators) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.stages.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_update.php)
:::
<br/>


```bsl title="Code example"
    Name    = "New stage name";
    Color   = "000000";
    StageID = "864";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color);

    Name    = "New stage name 2";
    Color   = "000000";
    StageID = "866";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "21750a67006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color, 6, True, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateKanbansStage --url "b24-ar17wx.bitrix24.by" --title %title% --stage "320" --color "000000" --prevstage %prevstage% --admin %admin% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454834.3617,
  "finish": 1728454834.44785,
  "duration": 0.0861501693725586,
  "processing": 0.0561039447784424,
  "date_start": "2024-10-09T09:20:34+03:00",
  "date_finish": "2024-10-09T09:20:34+03:00",
  "operating_reset_at": 1728455434,
  "operating": 0
 }
}
```

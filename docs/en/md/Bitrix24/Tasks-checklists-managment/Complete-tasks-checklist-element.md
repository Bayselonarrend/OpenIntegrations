﻿---
sidebar_position: 6
---

# Complete tasks checklist element
 Mark an element as completed



`Function CompleteTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | ElementID | --element | Number, String | Element ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.complete](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/complete.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID    = "2262";
    ElementID = "1344";

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID);

    TaskID    = "2264";
    ElementID = "1348";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CompleteTasksChecklistElement --url "b24-ar17wx.bitrix24.by" --task "1080" --element "400" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454787.01817,
  "finish": 1728454787.07164,
  "duration": 0.0534749031066894,
  "processing": 0.0282580852508545,
  "date_start": "2024-10-09T09:19:47+03:00",
  "date_finish": "2024-10-09T09:19:47+03:00",
  "operating_reset_at": 1728455387,
  "operating": 0
 }
}
```

﻿---
sidebar_position: 5
---

# Delete task
 Delete task by ID



`Function DeleteTask(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_delete.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteTask --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "task": true
 },
 "time": {
  "start": 1728454790.93474,
  "finish": 1728454791.12862,
  "duration": 0.193886995315552,
  "processing": 0.171198129653931,
  "date_start": "2024-10-09T09:19:50+03:00",
  "date_finish": "2024-10-09T09:19:51+03:00",
  "operating_reset_at": 1728455390,
  "operating": 0.171180963516235
 }
}
```

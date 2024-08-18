---
sidebar_position: 6
---

# Get results list
 Gets results list for task



`Function GetResultsList(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.result.list](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_result.list.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";
    TaskID = "1258";

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "c03fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetResultsList --url "b24-ar17wx.bitrix24.by" --task "1082" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": [
  {
  "id": 130,
  "taskId": 432,
  "commentId": 1376,
  "createdBy": 1,
  "createdAt": "2024-07-05T13:38:22+00:00",
  "updatedAt": "2024-07-05T13:38:22+00:00",
  "status": 0,
  "text": "The task has been changed, let's split up",
  "formattedText": "The task has been changed, let's split up",
  "files": []
  },
  {
  "id": 128,
  "taskId": 432,
  "commentId": 1374,
  "createdBy": 1,
  "createdAt": "2024-07-05T13:38:21+00:00",
  "updatedAt": "2024-07-05T13:38:21+00:00",
  "status": 0,
  "text": "The task has been changed, do not split up",
  "formattedText": "The task has been changed, do not split up",
  "files": []
  }
  ],
  "time": {
  "start": 1720186708.49595,
  "finish": 1720186708.54066,
  "duration": 0.044705867767334,
  "processing": 0.00980901718139648,
  "date_start": "2024-07-05T13:38:28+00:00",
  "date_finish": "2024-07-05T13:38:28+00:00",
  "operating_reset_at": 1720187308,
  "operating": 0
  }
  }
```

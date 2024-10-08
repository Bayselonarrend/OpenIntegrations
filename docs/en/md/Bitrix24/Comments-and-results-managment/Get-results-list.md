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
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2108";

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetResultsList --url "b24-ar17wx.bitrix24.by" --task "1082" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "id": 858,
   "taskId": 2370,
   "commentId": 5880,
   "createdBy": 1,
   "createdAt": "2024-10-07T22:25:08+03:00",
   "updatedAt": "2024-10-07T22:25:08+03:00",
   "status": 0,
   "text": "The task has been changed, let's split up",
   "formattedText": "The task has been changed, let's split up",
   "files": []
  },
  {
   "id": 856,
   "taskId": 2370,
   "commentId": 5878,
   "createdBy": 1,
   "createdAt": "2024-10-07T22:25:08+03:00",
   "updatedAt": "2024-10-07T22:25:08+03:00",
   "status": 0,
   "text": "The task has been changed, do not split up",
   "formattedText": "The task has been changed, do not split up",
   "files": []
  }
 ],
 "time": {
  "start": 1728329109.63564,
  "finish": 1728329109.66988,
  "duration": 0.0342400074005127,
  "processing": 0.00878000259399414,
  "date_start": "2024-10-07T22:25:09+03:00",
  "date_finish": "2024-10-07T22:25:09+03:00",
  "operating_reset_at": 1728329709,
  "operating": 0
 }
}
```

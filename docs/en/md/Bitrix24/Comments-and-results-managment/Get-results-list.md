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
    TaskID = "2420";

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "49e20867006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID, Token);
```
 



```json title="Result"
{
 "result": [
  {
   "id": 870,
   "taskId": 2400,
   "commentId": 5946,
   "createdBy": 1,
   "createdAt": "2024-10-09T09:19:54+03:00",
   "updatedAt": "2024-10-09T09:19:54+03:00",
   "status": 0,
   "text": "The task has been changed, let's split up",
   "formattedText": "The task has been changed, let's split up",
   "files": []
  },
  {
   "id": 868,
   "taskId": 2400,
   "commentId": 5944,
   "createdBy": 1,
   "createdAt": "2024-10-09T09:19:53+03:00",
   "updatedAt": "2024-10-09T09:19:53+03:00",
   "status": 0,
   "text": "The task has been changed, do not split up",
   "formattedText": "The task has been changed, do not split up",
   "files": []
  }
 ],
 "time": {
  "start": 1728454795.04247,
  "finish": 1728454795.07889,
  "duration": 0.0364160537719727,
  "processing": 0.00944018363952637,
  "date_start": "2024-10-09T09:19:55+03:00",
  "date_finish": "2024-10-09T09:19:55+03:00",
  "operating_reset_at": 1728455395,
  "operating": 0
 }
}
```

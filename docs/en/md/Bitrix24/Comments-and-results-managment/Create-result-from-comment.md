---
sidebar_position: 7
---

# Create result from comment
 Create task result from comment



`Function CreateResultFromComment(Val URL, Val CommentID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | CommentID | --comment | Number, String | CommentID |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.result.addFromComment](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_result_addFromComment.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 CommentID = "2264";
 
 Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 CommentID = "2266";
 
 Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 CreateResultFromComment --url "b24-ar17wx.bitrix24.by" --comment "1720" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
 "id": 130,
 "taskId": 432,
 "commentId": 1376,
 "createdBy": 1,
 "createdAt": "2024-07-05T13:38:22+00:00",
 "updatedAt": "2024-07-05T13:38:22+00:00",
 "status": 0,
 "text": "The task has been changed, let's split up",
 "formattedText": "The task has been changed, let's split up",
 "files": null
 },
 "time": {
 "start": 1720186706.85195,
 "finish": 1720186706.92671,
 "duration": 0.0747611522674561,
 "processing": 0.0460391044616699,
 "date_start": "2024-07-05T13:38:26+00:00",
 "date_finish": "2024-07-05T13:38:26+00:00",
 "operating_reset_at": 1720187306,
 "operating": 0
 }
}
```

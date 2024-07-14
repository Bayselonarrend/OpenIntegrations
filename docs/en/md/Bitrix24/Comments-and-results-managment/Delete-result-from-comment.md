---
sidebar_position: 8
---

# Delete result from comment
 Deletes task result, created from a comment



`Function DeleteResultFromComment(Val URL, Val CommentID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | CommentID | --comment | Number, String | CommentID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.result.deleteFromComment](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_result_deleteFromComment.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 CommentID = "1718";
 
 Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "56898d66006e9f06006b12e400000001000...";
 CommentID = "1720";
 
 Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 DeleteResultFromComment --url "b24-ar17wx.bitrix24.by" --comment "1720" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": null,
 "time": {
 "start": 1720295536.04613,
 "finish": 1720295536.09868,
 "duration": 0.0525519847869873,
 "processing": 0.0231878757476807,
 "date_start": "2024-07-06T19:52:16+00:00",
 "date_finish": "2024-07-06T19:52:16+00:00",
 "operating_reset_at": 1720296136,
 "operating": 0
 }
}
```

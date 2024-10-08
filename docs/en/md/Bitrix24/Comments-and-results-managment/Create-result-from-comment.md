---
sidebar_position: 7
---

# Create result from comment
 Create task result from comment



`Function CreateResultFromComment(Val URL, Val CommentID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | CommentID | --comment | Number, String | CommentID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.result.addFromComment](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_result_addFromComment.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    CommentID = "5286";

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    CommentID = "5288";

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateResultFromComment --url "b24-ar17wx.bitrix24.by" --comment "2936" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "id": 858,
  "taskId": 2370,
  "commentId": 5880,
  "createdBy": 1,
  "createdAt": "2024-10-07T22:25:08+03:00",
  "updatedAt": "2024-10-07T22:25:08+03:00",
  "status": 0,
  "text": "The task has been changed, let's split up",
  "formattedText": "The task has been changed, let's split up",
  "files": null
 },
 "time": {
  "start": 1728329109.43309,
  "finish": 1728329109.49586,
  "duration": 0.0627679824829102,
  "processing": 0.0332159996032715,
  "date_start": "2024-10-07T22:25:09+03:00",
  "date_finish": "2024-10-07T22:25:09+03:00",
  "operating_reset_at": 1728329709,
  "operating": 0
 }
}
```

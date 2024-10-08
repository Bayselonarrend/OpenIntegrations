---
sidebar_position: 8
---

# Delete result from comment
 Deletes task result, created from a comment



`Function DeleteResultFromComment(Val URL, Val CommentID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | CommentID | --comment | Number, String | CommentID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.result.deleteFromComment](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_result_deleteFromComment.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    CommentID = "5286";

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    CommentID = "5288";

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteResultFromComment --url "b24-ar17wx.bitrix24.by" --comment "2936" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": null,
 "time": {
  "start": 1728329109.8361,
  "finish": 1728329109.8858,
  "duration": 0.0497019290924072,
  "processing": 0.0225510597229004,
  "date_start": "2024-10-07T22:25:09+03:00",
  "date_finish": "2024-10-07T22:25:09+03:00",
  "operating_reset_at": 1728329709,
  "operating": 0
 }
}
```

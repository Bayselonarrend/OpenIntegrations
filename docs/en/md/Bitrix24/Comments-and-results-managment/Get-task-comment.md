---
sidebar_position: 2
---

# Get task comment
 Gets task comment data by ID



`Function GetTaskComment(Val URL, Val TaskID, Val CommentID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | CommentID | --comment | Number, String | CommentID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.commentitem.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/get.php)
:::
<br/>


```bsl title="Code example"
  URL       = FunctionParameters["Bitrix24_URL"];
  CommentID = FunctionParameters["Bitrix24_HookCommentID"];
  TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
  
  Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID);
  
  OPI_TestDataRetrieval.WriteLog(Result, "GetTaskComment (wh)", "Bitrix24");
  
  URL       = FunctionParameters["Bitrix24_Domain"];
  Token     = FunctionParameters["Bitrix24_Token"];
  CommentID = FunctionParameters["Bitrix24_CommentID"];
  
  Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTaskComment --url "b24-ar17wx.bitrix24.by" --task "1082" --comment "2936" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "POST_MESSAGE_HTML": null,
  "ID": "1496",
  "AUTHOR_ID": "1",
  "AUTHOR_NAME": "Anton Titovets",
  "AUTHOR_EMAIL": "",
  "POST_DATE": "2024-07-06T19:52:08+00:00",
  "POST_MESSAGE": "The task has been changed, let's split up"
  },
  "time": {
  "start": 1720295539.50621,
  "finish": 1720295539.55446,
  "duration": 0.0482499599456787,
  "processing": 0.019589900970459,
  "date_start": "2024-07-06T19:52:19+00:00",
  "date_finish": "2024-07-06T19:52:19+00:00",
  "operating_reset_at": 1720296139,
  "operating": 0
  }
  }
```

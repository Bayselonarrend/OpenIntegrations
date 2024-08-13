---
sidebar_position: 4
---

# Update task comment
 Changes task comment text



`Function UpdateTaskComment(Val URL, Val TaskID, Val CommentID, Val Text, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | CommentID | --comment | Number, String | CommentID |
  | Text | --text | String | Comment text |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.commentitem.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/update.php)
:::
<br/>


```bsl title="Code example"
  URL       = FunctionParameters["Bitrix24_URL"];
  TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
  CommentID = FunctionParameters["Bitrix24_HookCommentID"];
  
  Text = "The task has been changed, do not split up";
  
  Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text);
  
  OPI_TestDataRetrieval.WriteLog(Result, "UpdateTaskComment (wh)", "Bitrix24");
  
  URL       = FunctionParameters["Bitrix24_Domain"];
  Token     = FunctionParameters["Bitrix24_Token"];
  CommentID = FunctionParameters["Bitrix24_CommentID"];
  
  Text = "The task has been changed, let's split up";
  
  Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateTaskComment --url "b24-ar17wx.bitrix24.by" --task "1082" --comment "2936" --text "The task has been changed, let's split up" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720186705.11133,
  "finish": 1720186705.21965,
  "duration": 0.108311891555786,
  "processing": 0.0788998603820801,
  "date_start": "2024-07-05T13:38:25+00:00",
  "date_finish": "2024-07-05T13:38:25+00:00",
  "operating_reset_at": 1720187305,
  "operating": 0
  }
  }
```

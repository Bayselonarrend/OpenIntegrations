---
sidebar_position: 4
---

# Update task comment
 Changes task comment text



`Function UpdateTaskComment(Val URL, Val TaskID, Val CommentID, Val Text, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | CommentID | --comment | Number, String | CommentID |
 | Text | --text | String | Comment text |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.commentitem.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/update.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "724";
 CommentID = "2264";
 
 Text = "The task has been changed, do not split up";
 
 Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 CommentID = "2266";
 
 Text = "The task has been changed, let's split up";
 
 Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 UpdateTaskComment --url "b24-ar17wx.bitrix24.by" --task "504" --comment "1720" --text %text% --token "56898d66006e9f06006b12e400000001000..."

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

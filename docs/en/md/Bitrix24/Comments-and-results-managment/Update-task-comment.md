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
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID    = "2108";
    CommentID = "5286";

    Text = "The task has been changed, do not split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    CommentID = "5288";

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
  "start": 1728329109.15949,
  "finish": 1728329109.26359,
  "duration": 0.104099988937378,
  "processing": 0.0731880664825439,
  "date_start": "2024-10-07T22:25:09+03:00",
  "date_finish": "2024-10-07T22:25:09+03:00",
  "operating_reset_at": 1728329709,
  "operating": 0
 }
}
```

﻿---
sidebar_position: 5
---

# Delete comment
 Delete task comment by ID



`Function DeleteTaskComment(Val URL, Val TaskID, Val CommentID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | CommentID | --comment | Number, String | ID of comment to remove |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.commentitem.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/delete.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID    = "2108";
    CommentID = "5286";

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    CommentID = "5288";

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteTaskComment --url "b24-ar17wx.bitrix24.by" --task "1082" --comment "2936" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454796.03849,
  "finish": 1728454796.17589,
  "duration": 0.137403964996338,
  "processing": 0.113073110580444,
  "date_start": "2024-10-09T09:19:56+03:00",
  "date_finish": "2024-10-09T09:19:56+03:00",
  "operating_reset_at": 1728455396,
  "operating": 0.113054990768433
 }
}
```

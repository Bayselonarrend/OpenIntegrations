---
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
  URL       = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
  TaskID    = "1082";
  CommentID = "2932";
  
  Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID);
  
  URL       = "b24-ar17wx.bitrix24.by";
  Token     = "fe3fa966006e9f06006b12e400000001000...";
  CommentID = "2936";
  
  Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteTaskComment --url "b24-ar17wx.bitrix24.by" --task "1082" --comment "2936" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720295541.27592,
  "finish": 1720295541.38076,
  "duration": 0.104840040206909,
  "processing": 0.0781040191650391,
  "date_start": "2024-07-06T19:52:21+00:00",
  "date_finish": "2024-07-06T19:52:21+00:00",
  "operating_reset_at": 1720296141,
  "operating": 0
  }
  }
```

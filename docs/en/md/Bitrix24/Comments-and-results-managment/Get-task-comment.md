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
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    CommentID = "5286";
    TaskID    = "2108";

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    CommentID = "5288";

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTaskComment --url "b24-ar17wx.bitrix24.by" --task "1082" --comment "2936" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "POST_MESSAGE_HTML": null,
  "ID": "5880",
  "AUTHOR_ID": "1",
  "AUTHOR_NAME": "Антон Титовец",
  "AUTHOR_EMAIL": "",
  "POST_DATE": "2024-10-07T22:25:08+03:00",
  "POST_MESSAGE": "The task has been changed, let's split up"
 },
 "time": {
  "start": 1728329110.23465,
  "finish": 1728329110.28918,
  "duration": 0.0545291900634766,
  "processing": 0.0257711410522461,
  "date_start": "2024-10-07T22:25:10+03:00",
  "date_finish": "2024-10-07T22:25:10+03:00",
  "operating_reset_at": 1728329710,
  "operating": 0
 }
}
```

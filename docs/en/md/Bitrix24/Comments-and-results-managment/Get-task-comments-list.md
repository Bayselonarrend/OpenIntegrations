---
sidebar_position: 1
---

# Get comments list for a task
 Get user comments list for a task



`Function GetTaskCommentsList(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.commentitem.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/getlist.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2108";

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTaskCommentsList --url "b24-ar17wx.bitrix24.by" --task "1082" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "POST_MESSAGE_HTML": null,
   "ID": "5878",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-10-07T22:25:08+03:00",
   "POST_MESSAGE": "The task has been changed, do not split up"
  },
  {
   "POST_MESSAGE_HTML": null,
   "ID": "5880",
   "AUTHOR_ID": "1",
   "AUTHOR_NAME": "Антон Титовец",
   "AUTHOR_EMAIL": "",
   "POST_DATE": "2024-10-07T22:25:08+03:00",
   "POST_MESSAGE": "The task has been changed, let's split up"
  }
 ],
 "time": {
  "start": 1728329110.03152,
  "finish": 1728329110.07377,
  "duration": 0.0422458648681641,
  "processing": 0.0195379257202148,
  "date_start": "2024-10-07T22:25:10+03:00",
  "date_finish": "2024-10-07T22:25:10+03:00",
  "operating_reset_at": 1728329710,
  "operating": 0
 }
}
```
